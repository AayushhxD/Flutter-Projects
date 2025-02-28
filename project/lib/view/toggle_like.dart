// // import 'package:cloud_firestore/cloud_firestore.dart';
// // import 'package:firebase_auth/firebase_auth.dart';
// // import 'package:flutter/material.dart';

// // void _toggleLike(String productId) async {
// //   final user = FirebaseAuth.instance.currentUser;

// //   if (user == null) {
// //     ScaffoldMessenger.of(context).showSnackBar(
// //       const SnackBar(content: Text('You must be logged in to favorite items.')),
// //     );
// //     return;
// //   }

// //   final userDocRef =
// //       FirebaseFirestore.instance.collection('users').doc(user.uid);

// //   final userDoc = await userDocRef.get();
// //   if (userDoc.exists) {
// //     final favorites = List<String>.from(userDoc['favourites'] ?? []);

// //     if (favorites.contains(productId)) {
// //       favorites.remove(productId); // Remove from favorites
// //     } else {
// //       favorites.add(productId); // Add to favorites
// //     }

// //     await userDocRef.update({'favourites': favorites});
// //     setState(() {
// //       _isLiked = favorites.contains(productId);
// //     });
// //   }
// // }

//  Padding(
//             padding: const EdgeInsets.all(0),
//             child: Container(
//                 color: Colors.white,
//                 padding: const EdgeInsets.all(5),
//                 height: 200,
//                 width: 410,
//                 child: Row(
//                   children: [
//                     const SizedBox(width: 5),
//                     Container(
//                       height: 90,
//                       width: 90,
//                       child: Image.asset(
//                         widget.productImage,
//                         fit: BoxFit.cover,
//                       ),
//                     ),
//                     SizedBox(width: 12),
//                     Column(
//                       mainAxisAlignment: MainAxisAlignment.center,
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         Text(
//                           " ${widget.productName}",
//                           style: const TextStyle(
//                               fontSize: 18, fontWeight: FontWeight.w600),
//                         ),
//                         Text(
//                           "Weight: ${widget.productWeight} gms",
//                         ),
//                         const SizedBox(height: 10),
//                         Padding(
//                           padding: const EdgeInsets.only(left: 10),
//                           child: Row(
//                             children: [
//                               // Quantity Selector
//                               Container(
//                                 height: 30,
//                                 width: 110,
//                                 decoration: BoxDecoration(
//                                   border: Border.all(
//                                       color: const Color(0xFF093D2E)),
//                                 ),
//                                 child: Row(
//                                   children: [
//                                     IconButton(
//                                       icon: const Icon(Icons.remove,
//                                           size: 16, color: Color(0xFF093D2E)),
//                                       onPressed: () {
//                                         setState(() {
//                                           if (_count > 1) _count--;
//                                         });
//                                       },
//                                     ),
//                                     Text(
//                                       "$_count",
//                                       style: GoogleFonts.quicksand(
//                                         fontSize: 16,
//                                         fontWeight: FontWeight.w600,
//                                         color: const Color(0xFF093D2E),
//                                       ),
//                                     ),
//                                     IconButton(
//                                       icon: const Icon(Icons.add,
//                                           size: 16, color: Color(0xFF093D2E)),
//                                       onPressed: () {
//                                         setState(() {
//                                           _count++;
//                                         });
//                                       },
//                                     ),
//                                   ],
//                                 ),
//                               ),
//                             ],
//                           ),
//                         ),
//                         const SizedBox(height: 5),
//                         const Text("   Delivery in 2 Days"),
//                         Text(
//                           "   Price: ${21000 * _count}",
//                           style: const TextStyle(
//                               fontSize: 16, fontWeight: FontWeight.w600),
//                         ),
//                         Text("   Order Date: 12-11-24"),
//                         Text("   Delivery Date: 15-11-24"),
//                       ],
//                     )
//                   ],
//                 )),
//           ),
