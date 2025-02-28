import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:project/view/address_page.dart';
import 'package:project/view/payment_succesful.dart';
import 'package:slider_button/slider_button.dart';

class OrderSummary extends StatefulWidget {
  final String productName;
  final String productPrice;
  final String productWeight;
  final String productImage;

  const OrderSummary({
    super.key,
    required this.productName,
    required this.productPrice,
    required this.productWeight,
    required this.productImage,
  });

  @override
  State<OrderSummary> createState() => _OrderSummaryState();
}

class _OrderSummaryState extends State<OrderSummary> {
  double totalPayment = 0;
  int _count = 1;
  Map<String, dynamic>? _addressData;
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    totalPayment = _calculateTotalPrice();
    _fetchAddress();
  }

  Future<void> _fetchAddress() async {
    try {
      final currentUser = FirebaseAuth.instance.currentUser;
      if (currentUser == null) {
        throw Exception("User not logged in.");
      }

      DocumentSnapshot userDoc = await FirebaseFirestore.instance
          .collection('users')
          .doc(currentUser.uid)
          .get();

      if (!userDoc.exists) {
        throw Exception("User document does not exist.");
      }

      Map<String, dynamic>? userData = userDoc.data() as Map<String, dynamic>?;

      setState(() {
        _addressData = userData?['address'] as Map<String, dynamic>? ?? {};
        _isLoading = false;
      });
    } catch (e) {
      print("Error fetching address: $e");
      setState(() {
        _isLoading = false;
      });
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Failed to fetch address: $e")),
      );
    }
  }

  double _calculateTotalPrice() {
    double pricePerItem = double.tryParse(widget.productPrice) ?? 0.0;
    return pricePerItem * _count;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Order Summary",
          style: GoogleFonts.poppins(
            fontSize: 22,
            fontWeight: FontWeight.bold,
          ),
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios),
          onPressed: () => Navigator.pop(context),
        ),
        toolbarHeight: 80.0,
        flexibleSpace: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.centerLeft,
              end: Alignment.centerRight,
              colors: [Color(0xFF06401E), Color(0xFF0C513D)],
            ),
          ),
        ),
      ),
      backgroundColor: const Color(0xFFF5F5F5),
      body: _isLoading
          ? const Center(child: CircularProgressIndicator())
          : SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _buildAddressSection(),
                    const SizedBox(height: 20),
                    _buildProductTile(),
                    const SizedBox(height: 20),
                    _buildPaymentSummary(),
                  ],
                ),
              ),
            ),
      bottomNavigationBar: _buildPaymentSection(),
    );
  }

  Widget _buildAddressSection() {
    return Card(
      elevation: 3,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Delivery Address",
              style: GoogleFonts.poppins(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 10),
            if (_addressData == null || _addressData!.isEmpty)
              Center(
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const AddressPage()),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF06401E),
                    padding: const EdgeInsets.symmetric(vertical: 16.0),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    elevation: 5,
                    shadowColor: Colors.black.withOpacity(0.2),
                  ),
                  child: Text(
                    'Add Address',
                    style: GoogleFonts.poppins(
                      fontSize: 18.0,
                      color: const Color.fromARGB(255, 255, 255, 255),
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              )
            else
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    _addressData?['fullName'] ?? "Name not available",
                    style: GoogleFonts.poppins(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    "${_addressData?['house']}, ${_addressData?['road']}, ${_addressData?['city']}, ${_addressData?['state']} - ${_addressData?['pincode']}",
                    style: GoogleFonts.poppins(fontSize: 14),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    "+91 ${_addressData?['phone'] ?? 'Phone not available'}",
                    style: GoogleFonts.poppins(fontSize: 14),
                  ),
                  const SizedBox(height: 10),
                  Align(
                    alignment: Alignment.centerRight,
                    child: TextButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const AddressPage()),
                        );
                      },
                      style: TextButton.styleFrom(
                        padding: const EdgeInsets.symmetric(
                            vertical: 8.0, horizontal: 16.0),
                        backgroundColor: const Color(0xFF0C513D),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                      ),
                      child: Text(
                        'Change',
                        style: GoogleFonts.poppins(
                          fontSize: 16.0,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
          ],
        ),
      ),
    );
  }

  Widget _buildProductTile() {
    return Card(
      elevation: 3,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Row(
          children: [
            Container(
              height: 100,
              width: 100,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage(widget.productImage),
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
                    widget.productName,
                    style: GoogleFonts.poppins(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 5),
                  Text(
                    "Weight: ${widget.productWeight} gms",
                    style: GoogleFonts.poppins(fontSize: 14),
                  ),
                  const SizedBox(height: 10),
                  _buildQuantitySelector(),
                  const SizedBox(height: 10),
                  Text(
                    "Price: ₹${totalPayment.toStringAsFixed(2)}",
                    style: GoogleFonts.poppins(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildQuantitySelector() {
    return Row(
      children: [
        IconButton(
          onPressed: () {
            setState(() {
              if (_count > 1) {
                _count--;
                totalPayment = _calculateTotalPrice();
              }
            });
          },
          icon: const Icon(Icons.remove_circle, color: Colors.red),
        ),
        Text(
          "$_count",
          style: GoogleFonts.poppins(fontWeight: FontWeight.bold),
        ),
        IconButton(
          onPressed: () {
            setState(() {
              _count++;
              totalPayment = _calculateTotalPrice();
            });
          },
          icon: const Icon(Icons.add_circle, color: Colors.green),
        ),
      ],
    );
  }

  Widget _buildPaymentSummary() {
    return Card(
      elevation: 3,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Order Summary",
              style: GoogleFonts.poppins(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Subtotal", style: GoogleFonts.poppins(fontSize: 14)),
                Text("₹${totalPayment.toStringAsFixed(2)}",
                    style: GoogleFonts.poppins(fontSize: 14)),
              ],
            ),
            const SizedBox(height: 8),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Shipping", style: GoogleFonts.poppins(fontSize: 14)),
                const Text("₹50", style: TextStyle(fontSize: 14)),
              ],
            ),
            const Divider(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Total",
                  style: GoogleFonts.poppins(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  "₹${(totalPayment + 50).toStringAsFixed(2)}",
                  style: GoogleFonts.poppins(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildPaymentSection() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: SizedBox(
        width: double.infinity,
        child: SliderButton(
          action: () async {
            final currentUser = FirebaseAuth.instance.currentUser;
            if (currentUser != null) {
              await FirebaseFirestore.instance
                  .collection("Orders")
                  .doc(currentUser.uid)
                  .collection("UserOrders")
                  .add({
                "Order": {
                  "Name": widget.productName,
                  "Weight": widget.productWeight,
                  "Quantity": _count,
                  "Total": totalPayment.toStringAsFixed(2),
                  "Shipping": 50,
                  "FinalTotal": (totalPayment + 50).toStringAsFixed(2),
                  "Status": "Pending",
                  "Address": _addressData,
                  "OrderTime": DateTime.now(),
                },
              });
            }
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => const PaymentSuccesful()));
          },
          label: const Center(
            child: Text(
              "Slide to confirm order",
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          icon: const Icon(Icons.arrow_forward_ios, color: Colors.white),
          backgroundColor: const Color(0xFF06401E),
          buttonColor: Colors.green,
          height: 60,
          width: 300,
          radius: 10,
          shimmer: true,
          vibrationFlag: true,
        ),
      ),
    );
  }
}
