import 'dart:developer';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:project/view/address_page.dart';
import 'package:slider_button/slider_button.dart';

import 'payment_succesful.dart';

class CartOrders extends StatefulWidget {
  final String userId;
  final String productImage;
  const CartOrders(
      {super.key,
      required this.userId,
      required productName,
      required String productPrice,
      required this.productImage,
      required productWeight,
      required int itemCount});

  @override
  State<CartOrders> createState() => _CartOrderSummaryState();
}

class _CartOrderSummaryState extends State<CartOrders> {
  double totalPayment = 0;
  Map<String, int> productQuantities = {};
  Map<String, dynamic>? _addressData;
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    _calculateTotalPayment();
    _fetchAddress();
  }

  // Method to fetch address from Firestore
  Future<void> _fetchAddress() async {
    try {
      final currentUser = FirebaseAuth.instance.currentUser;
      if (currentUser == null) {
        throw Exception("User not logged in.");
      }

      // Fetch user's document from Firestore
      DocumentSnapshot userDoc = await FirebaseFirestore.instance
          .collection('users')
          .doc(currentUser.uid)
          .get();

      // Ensure the document exists
      if (!userDoc.exists) {
        throw Exception("User document does not exist.");
      }

      // Safely cast the data and extract the address
      Map<String, dynamic>? userData = userDoc.data() as Map<String, dynamic>?;

      setState(() {
        _addressData = userData?['address'] as Map<String, dynamic>? ??
            {}; // Default to empty map
        _isLoading = false;
      });
    } catch (e) {
      print("Error fetching address: $e");
      setState(() {
        _isLoading = false; // Stop loading even on error
      });
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Failed to fetch address: $e")),
      );
    }
  }

  /// Fetch cart products from Firestore
  Future<List<Map<String, dynamic>>> fetchCartProducts() async {
    try {
      // Fetch user cart from users collection
      final userDoc = await FirebaseFirestore.instance
          .collection('users')
          .doc(widget.userId)
          .get();

      final cart = List.from(userDoc.data()?['cart'] ?? []);
      log("CART : $cart");
      if (cart.isEmpty) return [];

      // Fetch product details for items in the cart
      final productDocs = await FirebaseFirestore.instance
          .collection('products')
          .where(FieldPath.documentId, whereIn: cart)
          .get();

      return productDocs.docs
          .map((doc) => {"id": doc.id, ...doc.data() as Map<String, dynamic>})
          .toList();
    } catch (e) {
      log("Error fetching cart products: $e");
      return [];
    }
  }

  /// Calculate total payment based on current product quantities
  void _calculateTotalPayment() async {
    final products = await fetchCartProducts();
    double total = 0;

    for (var product in products) {
      final price = double.tryParse(product['productPrice'].toString()) ?? 0.0;
      final quantity = productQuantities[product['id']] ?? 1;
      total += price * quantity;
    }

    setState(() {
      totalPayment = total;
    });
  }

  /// Update product quantity and recalculate total
  void _updateQuantity(String productId, int change) {
    setState(() {
      productQuantities[productId] =
          (productQuantities[productId] ?? 1) + change;
      if (productQuantities[productId]! < 1) productQuantities[productId] = 1;
    });
    _calculateTotalPayment();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: GestureDetector(
          onTap: () => Navigator.pop(context),
          child:
              const Icon(Icons.arrow_back_ios, size: 35, color: Colors.white),
        ),
        title: const Text(
          "Order Summary",
          style: TextStyle(
              fontSize: 22, color: Colors.white, fontWeight: FontWeight.bold),
        ),
        toolbarHeight: 80.0,
        centerTitle: true,
        flexibleSpace: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.centerLeft,
              end: Alignment.centerRight,
              colors: [
                Color.fromRGBO(6, 40, 30, 1),
                Color.fromRGBO(12, 81, 61, 1),
              ],
            ),
          ),
        ),
      ),
      body: FutureBuilder<List<Map<String, dynamic>>>(
        future: fetchCartProducts(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: LoadingAnimationWidget.hexagonDots(
                color: Color.fromARGB(255, 10, 89, 12),
                size: 100,
              ),
            );
          }
          if (snapshot.hasError) {
            return Center(child: Text("Error: ${snapshot.error}"));
          }
          if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return const Center(child: Text("No products in the cart."));
          }

          final products = snapshot.data!;

          return Column(
            children: [
              const SizedBox(height: 10),
              _buildAddressSection(),
              const SizedBox(height: 10),
              Expanded(
                child: ListView.builder(
                  itemCount: products.length,
                  itemBuilder: (context, index) {
                    log("Products List: $products");
                    final product = products[index];
                    final productId = product['id'];
                    final productName = product['productName'] ?? "Unknown";
                    final productPrice = double.tryParse(
                            product['productPrice']?.toString() ?? "0") ??
                        0.0;
                    final productImage = product['imageUrl'] ?? '';
                    final productWeight = product['productWeight'] ?? '';
                    final quantity = productQuantities[productId] ?? 1;

                    return _buildProductTile(
                      productId,
                      productName,
                      productPrice,
                      productWeight,
                      productImage,
                      quantity,
                    );
                  },
                ),
              ),
              _buildPaymentSection(),
            ],
          );
        },
      ),
      backgroundColor: const Color.fromARGB(255, 233, 231, 231),
    );
  }

  Widget _buildAddressSection() {
    if (_addressData == null || _addressData!.isEmpty) {
      return const Center(child: Text("No address found!"));
    }

    return Container(
      color: Colors.white,
      padding: const EdgeInsets.all(8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              const Text(
                "Deliver to:",
                style: TextStyle(fontWeight: FontWeight.w600, fontSize: 20),
              ),
              const Spacer(),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const AddressPage()),
                  );
                },
                child: Container(
                  height: 40,
                  width: 120,
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: const Color.fromARGB(255, 164, 162, 162),
                      width: 1.0,
                    ),
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: const Center(
                    child: Row(
                      children: [
                        Icon(Icons.add),
                        Text(
                          "  Add Address",
                          style: TextStyle(
                            fontWeight: FontWeight.w500,
                            color: Colors.blue,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 10),
            ],
          ),
          const SizedBox(height: 10),
          Text(
            _addressData?['fullName'] ?? "Name not available",
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
          ),
          const SizedBox(height: 10),
          Text(
            "${_addressData?['house']}, ${_addressData?['road']}, ${_addressData?['city']}, ${_addressData?['state']} - ${_addressData?['pincode']}",
          ),
          const SizedBox(height: 10),
          Row(
            children: [
              Text("+91 ${_addressData?['phone'] ?? 'Phone not available'}"),
              Spacer(),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const AddressPage()),
                  );
                },
                child: Container(
                  height: 40,
                  width: 90,
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: const Color.fromARGB(255, 164, 162, 162),
                      width: 1.0,
                    ),
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: const Center(
                    child: Row(
                      children: [
                        Icon(Icons.edit),
                        Text(
                          "  Change",
                          style: TextStyle(
                            fontWeight: FontWeight.w500,
                            color: Colors.blue,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildProductTile(
    String productId,
    String productName,
    double productPrice,
    String productWeight,
    String productImage,
    int quantity,
  ) {
    log("PRODUVT IMAGE : $productImage");
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: Colors.white,
        ),
        padding: const EdgeInsets.all(10),
        child: Row(
          children: [
            Container(
              height: 110,
              width: 110,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage(productImage.isNotEmpty
                      ? productImage
                      : 'https://via.placeholder.com/150'), // Fallback image
                  fit: BoxFit.cover,
                ),
                borderRadius: BorderRadius.circular(10),
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    productName,
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  Text("Weight: $productWeight gms"),
                  const SizedBox(height: 10),
                  Row(
                    children: [
                      _buildQuantitySelector(productId),
                      const SizedBox(width: 20),
                    ],
                  ),
                  const SizedBox(height: 7),
                  Text(
                    "Price: ₹${(productPrice * quantity).toStringAsFixed(2)}",
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(height: 5),
                  const Text("Delivery in 2 Days"),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildQuantitySelector(String productId) {
    return Container(
      height: 30,
      width: 110,
      decoration: BoxDecoration(
        border: Border.all(color: const Color(0xFF093D2E)),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          IconButton(
            icon: const Icon(Icons.remove, size: 16, color: Color(0xFF093D2E)),
            onPressed: () => _updateQuantity(productId, -1),
          ),
          Text(
            "${productQuantities[productId] ?? 1}",
            style: GoogleFonts.quicksand(
              fontSize: 16,
              fontWeight: FontWeight.w600,
              color: const Color(0xFF093D2E),
            ),
          ),
          IconButton(
            icon: const Icon(Icons.add, size: 16, color: Color(0xFF093D2E)),
            onPressed: () => _updateQuantity(productId, 1),
          ),
        ],
      ),
    );
  }

  Widget _buildPaymentSection() {
    return Container(
      color: Colors.white,
      padding: const EdgeInsets.all(15),
      child: Column(
        children: [
          Row(
            children: [
              Image.asset("assets/gpay.png", height: 40, width: 40),
              const SizedBox(width: 10),
              const Text(
                "Pay using Google Pay",
                style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
              ),
            ],
          ),
          const SizedBox(height: 20),
          SizedBox(
            width: 350,
            child: SliderButton(
              action: () async {
                // Add a small delay or perform any necessary logic before navigating
                await Future.delayed(const Duration(milliseconds: 200));

                // Fetch the products in the cart
                final products = await fetchCartProducts();

                // Get the total payment from the cart
                double total = totalPayment;

                try {
                  // Fetch the current orders array from Firestore
                  final userDoc = await FirebaseFirestore.instance
                      .collection('users')
                      .doc(widget.userId)
                      .get();

                  final currentOrders =
                      List.from(userDoc.data()?['orders'] ?? []);

                  // Loop through the cart products and add necessary details to the existing orders
                  for (var product in products) {
                    final productId = product['id'];
                    final productName = product['productName'] ?? "Unknown";
                    final productPrice = double.tryParse(
                            product['productPrice']?.toString() ?? "0") ??
                        0.0;
                    final productWeight = product['productWeight'] ?? "Unknown";
                    final productImage =
                        product['imageUrl'] ?? "default_image.png";
                    final quantity = productQuantities[productId] ?? 1;

                    // Add new product to the current order items in the orders list
                    currentOrders.add({
                      'productName': productName,
                      'productPrice': productPrice,
                      'productWeight': productWeight,
                      'productImage': productImage,
                      'quantity': quantity,
                      'totalPrice': productPrice * quantity,
                      'orderDate': DateTime.now().toIso8601String(),
                    });
                  }

                  // Create a new order object (combining the existing order details and new products)
                  Map<String, dynamic> newOrder = {
                    'orderDate': Timestamp.now(),
                    'orderItems': currentOrders, // Updated order list
                    'totalAmount': total, // Total amount for the order
                    'status': 'Pending', // Set initial status
                  };

                  // Update the user's Firestore document with the updated orders list
                  await FirebaseFirestore.instance
                      .collection('users')
                      .doc(widget.userId)
                      .update({
                    'orders': currentOrders, // Update orders with the new list
                    'cart': [], // Clear the cart after successful purchase
                  });

                  // Navigate to the payment success page
                  if (context.mounted) {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const PaymentSuccesful()),
                    );
                  }
                } catch (e) {
                  log("Error adding order: $e");
                  // Optionally show an error message if something goes wrong
                }
              },
              label: Center(
                child: Text(
                  "Slide to Pay | ₹${totalPayment.toStringAsFixed(2)}",
                  style: const TextStyle(
                    color: Color(0xff4a4a4a),
                    fontWeight: FontWeight.w500,
                    fontSize: 17,
                  ),
                ),
              ),
              icon: const Icon(Icons.arrow_forward_ios),
            ),
          ),
        ],
      ),
    );
  }
}
