// import 'dart:developer';
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_storage/firebase_storage.dart';
// import 'package:flutter/material.dart';

// class DeleteProductPage extends StatefulWidget {
//   const DeleteProductPage({super.key});

//   @override
//   State<DeleteProductPage> createState() => _DeleteProductPageState();
// }

// class _DeleteProductPageState extends State<DeleteProductPage> {
//   /// Fetch products from Firestore
//   Future<List<Map<String, dynamic>>> fetchProducts() async {
//     try {
//       final snapshot =
//           await FirebaseFirestore.instance.collection('products').get();
//       return snapshot.docs.map((doc) => {"id": doc.id, ...doc.data()}).toList();
//     } catch (e) {
//       log("Error fetching products: $e");
//       return [];
//     }
//   }

//   /// Delete product from Firestore and Firebase Storage
//   Future<void> deleteProduct(String productId, String mainImageUrl,
//       List<String> relatedImageUrls) async {
//     try {
//       // Delete from Firestore
//       await FirebaseFirestore.instance
//           .collection('products')
//           .doc(productId)
//           .delete();
//       log("Deleted product $productId from Firestore");

//       // Delete main image from Firebase Storage
//       await FirebaseStorage.instance.refFromURL(mainImageUrl).delete();
//       log("Deleted main image from Firebase Storage");

//       // Delete related images from Firebase Storage
//       for (var url in relatedImageUrls) {
//         await FirebaseStorage.instance.refFromURL(url).delete();
//       }
//       log("Deleted related images from Firebase Storage");

//       ScaffoldMessenger.of(context).showSnackBar(
//         const SnackBar(content: Text("Product deleted successfully!")),
//       );
//     } catch (e) {
//       log("Error deleting product: $e");
//       ScaffoldMessenger.of(context).showSnackBar(
//         const SnackBar(content: Text("Error deleting product.")),
//       );
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text("Delete Product"),
//         flexibleSpace: Container(
//           decoration: const BoxDecoration(
//             gradient: LinearGradient(
//               colors: [Color(0xFF06281E), Color(0xFF0C513D)],
//             ),
//           ),
//         ),
//         centerTitle: true,
//       ),
//       body: FutureBuilder<List<Map<String, dynamic>>>(
//         future: fetchProducts(),
//         builder: (context, snapshot) {
//           if (snapshot.connectionState == ConnectionState.waiting) {
//             return const Center(child: CircularProgressIndicator());
//           }
//           if (snapshot.hasError) {
//             return Center(child: Text("Error: ${snapshot.error}"));
//           }
//           if (!snapshot.hasData || snapshot.data!.isEmpty) {
//             return const Center(child: Text("No products found"));
//           }

//           final products = snapshot.data!;

//           return ListView.builder(
//             padding: const EdgeInsets.all(10),
//             itemCount: products.length,
//             itemBuilder: (context, index) {
//               final product = products[index];
//               final mainImageUrl = product['imageUrl'] as String? ?? '';
//               final relatedImageUrls =
//                   (product['relatedImageUrls'] as List<dynamic>? ?? [])
//                       .cast<String>();

//               return Card(
//                 margin: const EdgeInsets.symmetric(vertical: 8),
//                 elevation: 5,
//                 shape: RoundedRectangleBorder(
//                   borderRadius: BorderRadius.circular(15),
//                 ),
//                 child: ListTile(
//                   leading: mainImageUrl.isNotEmpty
//                       ? Image.network(
//                           mainImageUrl,
//                           width: 50,
//                           height: 50,
//                           fit: BoxFit.cover,
//                         )
//                       : const Icon(Icons.image, size: 50),
//                   title: Text(
//                     product['productName'] ?? "Unknown",
//                     style: const TextStyle(fontWeight: FontWeight.bold),
//                   ),
//                   subtitle: Text(
//                       "Price: ${product['productPrice'] ?? 'N/A'}\nWeight: ${product['productWeight'] ?? 'N/A'}"),
//                   trailing: IconButton(
//                     icon: const Icon(Icons.delete, color: Colors.red),
//                     onPressed: () async {
//                       final confirm = await showDialog<bool>(
//                         context: context,
//                         builder: (context) => AlertDialog(
//                           title: const Text("Delete Product"),
//                           content: const Text(
//                               "Are you sure you want to delete this product?"),
//                           actions: [
//                             TextButton(
//                               onPressed: () => Navigator.of(context).pop(false),
//                               child: const Text("Cancel"),
//                             ),
//                             TextButton(
//                               onPressed: () => Navigator.of(context).pop(true),
//                               child: const Text("Delete"),
//                             ),
//                           ],
//                         ),
//                       );

//                       if (confirm ?? false) {
//                         await deleteProduct(
//                           product['id'] as String,
//                           mainImageUrl,
//                           relatedImageUrls,
//                         );
//                         setState(() {}); // Refresh the list
//                       }
//                     },
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

import 'dart:developer';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';

class DeleteProductPage extends StatefulWidget {
  const DeleteProductPage({Key? key}) : super(key: key);

  @override
  State<DeleteProductPage> createState() => _DeleteProductPageState();
}

class _DeleteProductPageState extends State<DeleteProductPage> {
  /// Fetch products from Firestore
  Future<List<Map<String, dynamic>>> fetchProducts() async {
    try {
      final snapshot =
          await FirebaseFirestore.instance.collection('products').get();
      return snapshot.docs.map((doc) => {"id": doc.id, ...doc.data()}).toList();
    } catch (e) {
      log("Error fetching products: $e");
      return [];
    }
  }

  /// Delete product from Firestore and Firebase Storage
  Future<void> deleteProduct(String productId, String mainImageUrl,
      List<String> relatedImageUrls) async {
    try {
      // Delete product from Firestore
      await FirebaseFirestore.instance
          .collection('products')
          .doc(productId)
          .delete();
      log("Deleted product $productId from Firestore");

      // Delete main image from Firebase Storage
      if (mainImageUrl.isNotEmpty) {
        await FirebaseStorage.instance.refFromURL(mainImageUrl).delete();
        log("Deleted main image from Firebase Storage");
      }

      // Delete related images from Firebase Storage
      for (var url in relatedImageUrls) {
        await FirebaseStorage.instance.refFromURL(url).delete();
      }
      log("Deleted related images from Firebase Storage");

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Product deleted successfully!")),
      );
    } catch (e) {
      log("Error deleting product: $e");
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("deleted Successfully!.")),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Delete Product",
          style: TextStyle(color: Colors.white),
        ),
        flexibleSpace: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [Color(0xFF06281E), Color(0xFF0C513D)],
            ),
          ),
        ),
        centerTitle: true,
      ),
      body: FutureBuilder<List<Map<String, dynamic>>>(
        future: fetchProducts(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }
          if (snapshot.hasError) {
            return Center(child: Text("Error: ${snapshot.error}"));
          }
          if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return const Center(child: Text("No products found"));
          }

          final products = snapshot.data!;

          return ListView.builder(
            padding: const EdgeInsets.all(10),
            itemCount: products.length,
            itemBuilder: (context, index) {
              final product = products[index];
              final mainImageUrl = product['imageUrl'] as String? ?? '';
              final relatedImageUrls =
                  (product['relatedImageUrls'] as List<dynamic>? ?? [])
                      .cast<String>();

              return Card(
                margin: const EdgeInsets.symmetric(vertical: 10),
                elevation: 7,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
                child: ListTile(
                  leading: SizedBox(
                    width: 70, // Constrain the width
                    height: 70, // Constrain the height
                    child: mainImageUrl.isNotEmpty
                        ? Image.network(
                            mainImageUrl,
                            fit: BoxFit.cover,
                          )
                        : const Icon(Icons.image, size: 50),
                  ),
                  title: Text(
                    product['productName'],
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                  subtitle: Text(
                      "Price: ${product['productPrice'] ?? 'N/A'}\nWeight: ${product['productWeight'] ?? 'N/A'}"),
                  trailing: IconButton(
                    icon: const Icon(Icons.delete, color: Colors.red),
                    onPressed: () async {
                      final confirm = await showDialog<bool>(
                        context: context,
                        builder: (context) => AlertDialog(
                          title: const Text("Delete Product"),
                          content: const Text(
                              "Are you sure you want to delete this product?"),
                          actions: [
                            TextButton(
                              onPressed: () => Navigator.of(context).pop(false),
                              child: const Text("Cancel"),
                            ),
                            TextButton(
                              onPressed: () => Navigator.of(context).pop(true),
                              child: const Text("Delete"),
                            ),
                          ],
                        ),
                      );

                      if (confirm ?? false) {
                        await deleteProduct(
                          product['id'] as String,
                          mainImageUrl,
                          relatedImageUrls,
                        );
                        setState(() {}); // Refresh the list
                      }
                    },
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
