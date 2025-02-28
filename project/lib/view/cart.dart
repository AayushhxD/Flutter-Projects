import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:project/view/cart_orders.dart';
import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';

class Cart extends StatefulWidget {
  const Cart({Key? key}) : super(key: key);

  @override
  State<Cart> createState() => _CartState();
}

class _CartState extends State<Cart> {
  List<Map<String, dynamic>?> _cartItems = [];
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    _fetchCartItems();
  }

  Future<void> _fetchCartItems() async {
    final user = FirebaseAuth.instance.currentUser;

    if (user == null) {
      _showAwesomeSnackBar('Error', 'You must be logged in to view the cart.',
          ContentType.failure);
      return;
    }

    try {
      final userDoc = await FirebaseFirestore.instance
          .collection('users')
          .doc(user.uid)
          .get();

      if (userDoc.exists) {
        final cart = List<String>.from(userDoc['cart'] ?? []);
        final cartProducts = await Future.wait(cart.map((productId) async {
          try {
            final productDoc = await FirebaseFirestore.instance
                .collection('products')
                .doc(productId)
                .get();
            if (productDoc.exists) {
              return {
                ...productDoc.data()!,
                'id': productDoc.id,
                'quantity': 1, // Add a quantity field, default to 1
              };
            }
          } catch (e) {
            print('Error fetching product $productId: $e');
          }
          return null;
        }).toList());

        setState(() {
          _cartItems = cartProducts.where((item) => item != null).toList();
          _isLoading = false;
        });
      }
    } catch (e) {
      print('Error fetching cart: $e');
      _showAwesomeSnackBar(
          'Error', 'Failed to fetch cart: $e', ContentType.failure);
    }
  }

  double _calculateTotalPrice() {
    return _cartItems.fold(0.0, (sum, item) {
      final price = item?['productPrice'] ?? '0.0';
      double parsedPrice = double.tryParse(price.toString()) ?? 0.0;
      int quantity = item?['quantity'] ?? 1;
      return sum + (parsedPrice * quantity);
    });
  }

  Future<void> _removeFromCart(String productId) async {
    final user = FirebaseAuth.instance.currentUser;

    if (user == null) {
      _showAwesomeSnackBar('Error', 'You must be logged in to remove items.',
          ContentType.failure);
      return;
    }

    try {
      await FirebaseFirestore.instance
          .collection('users')
          .doc(user.uid)
          .update({
        'cart': FieldValue.arrayRemove([productId]),
      });

      setState(() {
        _cartItems.removeWhere((item) => item?['id'] == productId);
      });

      _showAwesomeSnackBar(
          'Success', 'Item removed from cart.', ContentType.success);
    } catch (e) {
      _showAwesomeSnackBar(
          'Error', 'Failed to remove item: $e', ContentType.failure);
    }
  }

  void _showAwesomeSnackBar(String title, String message, ContentType type) {
    final snackBar = SnackBar(
      content: AwesomeSnackbarContent(
        title: title,
        message: message,
        contentType: type,
      ),
      behavior: SnackBarBehavior.floating,
      backgroundColor: Colors.transparent,
      elevation: 0,
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  void _updateQuantity(String productId, int change) {
    setState(() {
      final index = _cartItems.indexWhere((item) => item?['id'] == productId);
      if (index != -1) {
        _cartItems[index]?['quantity'] =
            (_cartItems[index]?['quantity'] ?? 1) + change;
        if (_cartItems[index]?['quantity'] <= 0) {
          _cartItems[index]?['quantity'] = 1;
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: GestureDetector(
          onTap: () => Navigator.pop(context),
          child:
              const Icon(Icons.arrow_back_ios, size: 24, color: Colors.black),
        ),
        title: Text(
          "Cart",
          style: GoogleFonts.quicksand(
              fontSize: 24, color: Colors.black, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: _isLoading
          ? Center(
              child: CircularProgressIndicator(),
            )
          : _cartItems.isEmpty
              ? Center(
                  child: SizedBox(
                      height: double.infinity,
                      width: double.infinity,
                      child: Image.asset(
                        "assets/no_cart.jpg",
                        fit: BoxFit.contain,
                      )),
                )
              : Column(
                  children: [
                    Expanded(
                      child: ListView.builder(
                        itemCount: _cartItems.length,
                        itemBuilder: (context, index) {
                          final item = _cartItems[index];
                          if (item == null || item['id'] == null) {
                            return const SizedBox.shrink();
                          }

                          return Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 16, vertical: 8),
                            child: Slidable(
                              key: ValueKey(item['id']),
                              endActionPane: ActionPane(
                                motion: const DrawerMotion(),
                                children: [
                                  SlidableAction(
                                    onPressed: (context) =>
                                        _removeFromCart(item['id']),
                                    backgroundColor: Colors.red,
                                    foregroundColor: Colors.white,
                                    icon: Icons.delete,
                                    label: 'Delete',
                                  ),
                                ],
                              ),
                              child: Container(
                                padding: const EdgeInsets.all(16),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(12),
                                  color: Colors.white,
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.grey.withOpacity(0.3),
                                      spreadRadius: 3,
                                      blurRadius: 6,
                                      offset: const Offset(0, 3),
                                    ),
                                  ],
                                ),
                                child: Row(
                                  children: [
                                    Container(
                                      height: 80,
                                      width: 80,
                                      clipBehavior: Clip.antiAlias,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(8),
                                        color: Colors.grey[200],
                                      ),
                                      child: Image.network(
                                        item['imageUrl'] ?? '',
                                        fit: BoxFit.cover,
                                        errorBuilder:
                                            (context, error, stackTrace) =>
                                                const Icon(Icons.error),
                                      ),
                                    ),
                                    const SizedBox(width: 16),
                                    Expanded(
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            item['productName'] ??
                                                'Unknown Product',
                                            style: GoogleFonts.inter(
                                              fontSize: 16,
                                              fontWeight: FontWeight.w600,
                                            ),
                                          ),
                                          const SizedBox(height: 4),
                                          Text(
                                            item['productType'] ?? 'N/A',
                                            style: GoogleFonts.inter(
                                              fontSize: 14,
                                              fontWeight: FontWeight.w400,
                                              color: Colors.grey,
                                            ),
                                          ),
                                          const SizedBox(height: 4),
                                          Text(
                                            "Rs ${item['productPrice'] ?? '0'}",
                                            style: GoogleFonts.inter(
                                              fontSize: 16,
                                              fontWeight: FontWeight.w600,
                                              color: Colors.pink,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Column(
                                      children: [
                                        IconButton(
                                          icon: const Icon(Icons.add),
                                          onPressed: () {
                                            _updateQuantity(item['id'], 1);
                                          },
                                        ),
                                        Text(
                                          '${item['quantity']}',
                                          style: GoogleFonts.inter(
                                            fontSize: 16,
                                            fontWeight: FontWeight.w600,
                                          ),
                                        ),
                                        IconButton(
                                          icon: const Icon(Icons.remove),
                                          onPressed: () {
                                            _updateQuantity(item['id'], -1);
                                          },
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 16, vertical: 16),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.2),
                            spreadRadius: 2,
                            blurRadius: 5,
                            offset: const Offset(0, -3),
                          ),
                        ],
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Amount Price",
                                style: GoogleFonts.poppins(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400,
                                  color: Colors.grey,
                                ),
                              ),
                              Text(
                                "Rs.${_calculateTotalPrice().toStringAsFixed(2)}",
                                style: GoogleFonts.poppins(
                                  fontSize: 24,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black,
                                ),
                              ),
                            ],
                          ),
                          ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.pink,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12),
                              ),
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 24, vertical: 12),
                            ),
                            onPressed: () {
                              if (_cartItems.isNotEmpty) {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => CartOrders(
                                      userId: (FirebaseAuth
                                          .instance.currentUser?.uid)!,
                                      productName:
                                          _cartItems[0]!['productName'],
                                      productPrice:
                                          (_calculateTotalPrice()).toString(),
                                      productWeight:
                                          _cartItems[0]!['productWeight'],
                                      productImage: _cartItems[0]!['imageUrl'],
                                      itemCount: _cartItems.length,
                                    ),
                                  ),
                                );
                              } else {
                                _showAwesomeSnackBar('Error',
                                    'Your cart is empty.', ContentType.failure);
                              }
                            },
                            child: Row(
                              children: [
                                Text(
                                  "Check Out",
                                  style: GoogleFonts.inter(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                  ),
                                ),
                                const SizedBox(width: 8),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
    );
  }
}
