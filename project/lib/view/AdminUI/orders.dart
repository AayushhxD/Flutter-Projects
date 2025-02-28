// import 'package:flutter/material.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:google_fonts/google_fonts.dart';

// class AdminOrdersPage extends StatefulWidget {
//   const AdminOrdersPage({Key? key}) : super(key: key);

//   @override
//   State<AdminOrdersPage> createState() => _AdminOrdersPageState();
// }

// class _AdminOrdersPageState extends State<AdminOrdersPage> {
//   // Fetching orders from Firestore
//   Future<List<Map<String, dynamic>>> fetchOrders() async {
//     try {
//       final querySnapshot =
//           await FirebaseFirestore.instance.collection('orders').get();
//       return querySnapshot.docs
//           .map((doc) => {"id": doc.id, ...doc.data() as Map<String, dynamic>})
//           .toList();
//     } catch (e) {
//       print("Error fetching orders: $e");
//       return [];
//     }
//   }

//   // Method to format timestamps into a readable format
//   String formatTimestamp(Timestamp timestamp) {
//     final dateTime = timestamp.toDate();
//     return "${dateTime.day}-${dateTime.month}-${dateTime.year} ${dateTime.hour}:${dateTime.minute}";
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text(
//           "Admin Orders",
//           style:
//               GoogleFonts.montserrat(fontSize: 24, fontWeight: FontWeight.bold),
//         ),
//         backgroundColor: Colors.green,
//         centerTitle: true,
//       ),
//       body: FutureBuilder<List<Map<String, dynamic>>>(
//         future: fetchOrders(),
//         builder: (context, snapshot) {
//           if (snapshot.connectionState == ConnectionState.waiting) {
//             return const Center(child: CircularProgressIndicator());
//           }

//           if (snapshot.hasError) {
//             return Center(child: Text("Error: ${snapshot.error}"));
//           }

//           if (!snapshot.hasData || snapshot.data!.isEmpty) {
//             return const Center(child: Text("No orders found."));
//           }

//           final orders = snapshot.data!;

//           return ListView.builder(
//             itemCount: orders.length,
//             itemBuilder: (context, index) {
//               final order = orders[index];
//               final userName = order['userName'];
//               final orderDate = order['orderDate'];
//               final productImage = order['productImage'];
//               final productName = order['productName'];
//               final productPrice = order['productPrice'];
//               final quantity = order['quantity'];

//               final orderId = order['id'];
//               final userId = order['userId'];
//               final orderItems = order['orderItems'] ?? [];
//               final totalAmount = order['totalAmount'] ?? 0.0;
//               final status = order['status'] ?? 'pending';
//               final timestamp = order['timestamp'] as Timestamp?;

//               return Card(
//                 margin:
//                     const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
//                 elevation: 5,
//                 shape: RoundedRectangleBorder(
//                   borderRadius: BorderRadius.circular(10),
//                 ),
//                 child: Padding(
//                   padding: const EdgeInsets.all(16.0),
//                   child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       // Order ID and Timestamp
//                       Row(
//                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                         children: [
//                           Text(
//                             "Order ID: $orderId",
//                             style: GoogleFonts.montserrat(
//                                 fontSize: 16, fontWeight: FontWeight.bold),
//                           ),
//                           if (timestamp != null)
//                             Text(
//                               formatTimestamp(timestamp),
//                               style: GoogleFonts.montserrat(
//                                   fontSize: 14, color: Colors.grey),
//                             ),
//                         ],
//                       ),
//                       const SizedBox(height: 10),

//                       // User ID
//                       Text(
//                         "User ID: $userId",
//                         style: GoogleFonts.montserrat(fontSize: 14),
//                       ),
//                       const SizedBox(height: 10),

//                       // List of ordered items
//                       Text(
//                         "Ordered Items: ${orderItems.join(', ')}",
//                         style: GoogleFonts.montserrat(fontSize: 14),
//                       ),
//                       const SizedBox(height: 10),

//                       // Total Amount
//                       Text(
//                         "Total: ₹${totalAmount}",
//                         style: GoogleFonts.montserrat(
//                             fontSize: 16, fontWeight: FontWeight.bold),
//                       ),
//                     ],
//                   ),
//                 ),
//               );
//             },
//           );
//         },
//       ),
//     );
//   }
// }
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:google_fonts/google_fonts.dart';

class AdminOrdersPage extends StatefulWidget {
  const AdminOrdersPage({Key? key}) : super(key: key);

  @override
  State<AdminOrdersPage> createState() => _AdminOrdersPageState();
}

class _AdminOrdersPageState extends State<AdminOrdersPage> {
  // Fetching orders from Firestore
  Future<List<Map<String, dynamic>>> fetchOrders() async {
    try {
      final querySnapshot =
          await FirebaseFirestore.instance.collection('orders').get();
      return querySnapshot.docs
          .map((doc) => {"id": doc.id, ...doc.data() as Map<String, dynamic>})
          .toList();
    } catch (e) {
      print("Error fetching orders: $e");
      return [];
    }
  }

  // Method to format timestamps into a readable format
  String formatTimestamp(Timestamp timestamp) {
    final dateTime = timestamp.toDate();
    return "${dateTime.day}-${dateTime.month}-${dateTime.year} ${dateTime.hour}:${dateTime.minute}";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 80.0,
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
        title: const Text(
          "Orders",
          style: TextStyle(
              color: Colors.white, fontWeight: FontWeight.w600, fontSize: 30),
        ),
        centerTitle: true,
      ),
      body: Stack(
        children: [
          Opacity(
            opacity: 0.5, // Adjust this value for the fade effect
            child: Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage(
                      "https://southjewellery.com/wp-content/uploads/2021/09/Madhuri-Dixit-in-a-green-paithani-saree-by-Madhurya-creations-for-dance-deewane-4.jpg"),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          FutureBuilder<List<Map<String, dynamic>>>(
            // Fetch orders
            future: fetchOrders(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(child: CircularProgressIndicator());
              }

              if (snapshot.hasError) {
                return Center(child: Text("Error: ${snapshot.error}"));
              }

              if (!snapshot.hasData || snapshot.data!.isEmpty) {
                return const Center(child: Text("No orders found."));
              }

              final orders = snapshot.data!;

              return ListView.builder(
                itemCount: orders.length,
                itemBuilder: (context, index) {
                  final order = orders[index];
                  final userName = order['userName'];
                  final orderDate = order['orderDate'];
                  final productImage =
                      order['productImage']; // URL of product image
                  final productName = order['productName'];
                  final productPrice = order['productPrice'];
                  final quantity = order['quantity'];

                  final orderId = order['id'];
                  final userId = order['userId'];
                  final orderItems = order['orderItems'] ?? [];
                  final totalAmount = order['totalAmount'] ?? 0.0;
                  final status = order['status'] ?? 'pending';
                  final timestamp = order['timestamp'] as Timestamp?;

                  return Card(
                    margin: const EdgeInsets.symmetric(
                        vertical: 10, horizontal: 15),
                    elevation: 5,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Row(
                        children: [
                          // Left Column for Order Details
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                // Order ID and Timestamp
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Expanded(
                                      child: Text(
                                        "Order ID: $orderId",
                                        style: GoogleFonts.montserrat(
                                            fontSize: 16,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                    if (timestamp != null)
                                      Text(
                                        formatTimestamp(timestamp),
                                        style: GoogleFonts.montserrat(
                                            fontSize: 14, color: Colors.grey),
                                      ),
                                  ],
                                ),
                                const SizedBox(height: 10),
                                Text(
                                  "Date: $orderDate",
                                  style: GoogleFonts.average(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w600),
                                ),
                                const SizedBox(height: 5),

                                // Username below Order ID
                                Row(
                                  children: [
                                    Text(
                                      "User: ",
                                      style: GoogleFonts.average(
                                          fontSize: 18,
                                          fontWeight: FontWeight.w600),
                                    ),
                                    Text(
                                      "$userName",
                                      style: GoogleFonts.average(
                                          fontSize: 16,
                                          fontWeight: FontWeight.w600),
                                    ),
                                  ],
                                ),
                                const SizedBox(height: 5),

                                // Quantity of the product
                                Row(
                                  children: [
                                    Text(
                                      "Quantity: ",
                                      style: GoogleFonts.montserrat(
                                          fontSize: 18,
                                          fontWeight: FontWeight.w500),
                                    ),
                                    Text(
                                      "$quantity",
                                      style: GoogleFonts.montserrat(
                                          fontSize: 16,
                                          fontWeight: FontWeight.w500),
                                    ),
                                  ],
                                ),
                                const SizedBox(height: 10),

                                // Total Amount
                                Row(
                                  children: [
                                    Text(
                                      "Total :",
                                      style: GoogleFonts.montserrat(
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    Text(
                                      "  ₹${totalAmount}",
                                      style: GoogleFonts.montserrat(
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.green),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),

                          // Right Column for Product Image
                          if (productImage != null)
                            Container(
                              width: 120,
                              height: 120,
                              margin: const EdgeInsets.only(left: 10),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(8),
                                child: Image.network(
                                  productImage,
                                  fit: BoxFit.cover,
                                  loadingBuilder:
                                      (context, child, loadingProgress) {
                                    if (loadingProgress == null) {
                                      return child;
                                    } else {
                                      return Center(
                                        child: CircularProgressIndicator(
                                          value: loadingProgress
                                                      .expectedTotalBytes !=
                                                  null
                                              ? loadingProgress
                                                      .cumulativeBytesLoaded /
                                                  (loadingProgress
                                                          .expectedTotalBytes ??
                                                      1)
                                              : null,
                                        ),
                                      );
                                    }
                                  },
                                ),
                              ),
                            ),
                        ],
                      ),
                    ),
                  );
                },
              );
            },
          ),
        ],
      ),
    );
  }
}
