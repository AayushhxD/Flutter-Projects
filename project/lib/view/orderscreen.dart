import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class OrdersScreen extends StatefulWidget {
  final String userId;

  const OrdersScreen({Key? key, required this.userId}) : super(key: key);

  @override
  _OrdersScreenState createState() => _OrdersScreenState();
}

class _OrdersScreenState extends State<OrdersScreen> {
  late Future<List<Map<String, dynamic>>> orders;

  @override
  void initState() {
    super.initState();
    orders = fetchOrders();
  }

  // Fetch orders from Firestore
  Future<List<Map<String, dynamic>>> fetchOrders() async {
    try {
      final userDoc = await FirebaseFirestore.instance
          .collection('users')
          .doc(widget.userId)
          .get();

      if (!userDoc.exists || userDoc.data() == null) {
        print("User document not found or data is null.");
        return [];
      }

      // Retrieve orders directly from the Firestore document
      final ordersData = List.from(userDoc.data()?['orders'] ?? []);

      if (ordersData.isEmpty) {
        print("No orders found in the user document.");
        return [];
      }

      return ordersData.map((order) {
        return {
          'orderDate': order['orderDate'],
          'totalPrice': order['totalPrice'],
          'status': order['status'],
          'productName': order['productName'],
          'productPrice': order['productPrice'],
          'quantity': order['quantity'],
          'productWeight': order['productWeight'],
          'imageUrl': order['productImage'],
        };
      }).toList();
    } catch (e) {
      print("Error fetching orders: $e");
      return [];
    }
  }

  // Format order date for display
  String formatOrderDate(dynamic orderDate) {
    if (orderDate is Timestamp) {
      return orderDate.toDate().toString().split(' ')[0];
    } else if (orderDate is String) {
      return orderDate;
    } else {
      return 'N/A';
    }
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
        title: Text(
          "Your Orders",
          style: GoogleFonts.quicksand(
              fontSize: 27, color: Colors.white, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        flexibleSpace: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.centerLeft,
              end: Alignment.centerRight,
              colors: [
                Color.fromRGBO(6, 40, 30, 1),
                Color.fromRGBO(12, 81, 61, 1)
              ],
            ),
          ),
        ),
      ),
      body: FutureBuilder<List<Map<String, dynamic>>>(
        future: orders,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }

          if (snapshot.hasError) {
            return const Center(child: Text('Error loading orders'));
          }

          if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return const Center(child: Text('No orders available.'));
          }

          final orderList = snapshot.data!;
          return ListView.builder(
            padding: const EdgeInsets.all(8),
            itemCount: orderList.length,
            itemBuilder: (context, orderIndex) {
              final order = orderList[orderIndex];
              final orderDate = formatOrderDate(order['orderDate']);
              final productName = order['productName'] ?? 'Unknown Product';
              final productImage = order['imageUrl'] ?? '';
              final productPrice = order['productPrice'] ?? 0.0;
              final quantity = order['quantity'] ?? 1;
              final productWeight = order['productWeight'] ?? 'N/A';
              final totalAmount = order['totalPrice'];
              log("Products Image: $productImage");

              return Card(
                elevation: 6,
                margin: const EdgeInsets.symmetric(vertical: 10),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Order Header with Date & Status
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Order Date: $orderDate',
                            style: GoogleFonts.lato(
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                              color: Colors.black87,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 10),

                      // Product Details on Card
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // Product Image
                          ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: Image.network(
                              productImage,
                              height: 80,
                              width: 80,
                              fit: BoxFit.cover,
                              errorBuilder: (context, error, stackTrace) =>
                                  const Icon(Icons.error),
                            ),
                          ),
                          const SizedBox(width: 15),

                          // Product Info
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  productName,
                                  style: GoogleFonts.inter(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w600,
                                    color: Colors.black87,
                                  ),
                                ),
                                const SizedBox(height: 5),
                                Text(
                                  'Weight: $productWeight',
                                  style: GoogleFonts.inter(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w400,
                                    color: Colors.black54,
                                  ),
                                ),
                                const SizedBox(height: 5),
                                Text(
                                  'Quantity: $quantity',
                                  style: GoogleFonts.inter(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w400,
                                    color: Colors.black54,
                                  ),
                                ),
                                const SizedBox(height: 5),
                                // Text(
                                //   '₹$productPrice',
                                //   style: GoogleFonts.inter(
                                //     fontSize: 14,
                                //     fontWeight: FontWeight.bold,
                                //     color: Colors.green,
                                //   ),
                                // ),
                              ],
                            ),
                          ),
                        ],
                      ),

                      const SizedBox(height: 10),

                      // Total Price
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Total Price:',
                            style: GoogleFonts.lato(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            '₹$productPrice',
                            style: GoogleFonts.lato(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: Colors.green,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
