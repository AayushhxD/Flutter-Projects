import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class FavoritesScreen extends StatefulWidget {
  const FavoritesScreen({super.key});

  @override
  State<FavoritesScreen> createState() => _FavoritesScreenState();
}

class _FavoritesScreenState extends State<FavoritesScreen> {
  List<Map<String, dynamic>> favData = [];
  List<String> favIds = [];
  List<String> selectedIds = [];
  bool _isLoading = true;

  Future<void> getFavData() async {
    DocumentSnapshot userDoc = await FirebaseFirestore.instance
        .collection("users")
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .get();

    favIds = List<String>.from(userDoc['favourites'] ?? []);
    favData.clear();

    for (String favId in favIds) {
      DocumentSnapshot productDoc = await FirebaseFirestore.instance
          .collection("products")
          .doc(favId)
          .get();
      favData.add({
        ...?productDoc.data() as Map<String, dynamic>?,
        'id': favId,
      });
    }

    setState(() {
      _isLoading = false;
    });
  }

  Future<void> addToCart(String productId) async {
    final user = FirebaseAuth.instance.currentUser;
    if (user != null) {
      await FirebaseFirestore.instance
          .collection("users")
          .doc(user.uid)
          .update({
        'cart': FieldValue.arrayUnion([productId]),
        'favourites': FieldValue.arrayRemove([productId])
      });
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: AwesomeSnackbarContent(
            title: 'Success!',
            message: 'Item added to cart and removed from favorites.',
            contentType: ContentType.success,
          ),
          backgroundColor: Colors.transparent,
          behavior: SnackBarBehavior.floating,
          elevation: 0,
        ),
      );
      getFavData(); // Refresh the favorites list
    }
  }

  Future<void> removeFromFavorites(String productId) async {
    final user = FirebaseAuth.instance.currentUser;
    if (user != null) {
      await FirebaseFirestore.instance
          .collection("users")
          .doc(user.uid)
          .update({
        'favourites': FieldValue.arrayRemove([productId])
      });
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: AwesomeSnackbarContent(
            title: 'Removed!',
            message: 'Item removed from favorites.',
            contentType: ContentType.warning,
          ),
          backgroundColor: Colors.transparent,
          behavior: SnackBarBehavior.floating,
          elevation: 0,
        ),
      );
      getFavData(); // Refresh the favorites list
    }
  }

  @override
  void initState() {
    super.initState();
    getFavData();
  }

  @override
  Widget build(BuildContext context) {
    final user = FirebaseAuth.instance.currentUser;

    if (user == null) {
      return Scaffold(
        appBar: AppBar(title: const Text("Wishlist")),
        body: const Center(
          child: Text("Please log in to view your favorites."),
        ),
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Favorite",
          style: GoogleFonts.poppins(
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(30.0),
          child: Padding(
            padding: const EdgeInsets.only(bottom: 8.0),
            child: Text(
              "Your favorite items at a glance",
              style: GoogleFonts.poppins(
                fontSize: 14,
                color: Colors.white70,
              ),
            ),
          ),
        ),
      ),
      body: _isLoading
          ? const Center(child: CircularProgressIndicator())
          : favData.isEmpty
              ? Center(
                  child: Text(
                    "You haven't added any favorites yet!",
                    style: GoogleFonts.poppins(
                      fontSize: 22,
                      fontWeight: FontWeight.w500,
                      color: Colors.grey[700],
                    ),
                    textAlign: TextAlign.center,
                  ),
                )
              : Column(
                  children: [
                    Expanded(
                      child: ListView.builder(
                        padding: const EdgeInsets.all(8.0),
                        itemCount: favData.length,
                        itemBuilder: (context, index) {
                          final product = favData[index];
                          final isSelected =
                              selectedIds.contains(product['id']);
                          return Slidable(
                            key: ValueKey(product['id']),
                            endActionPane: ActionPane(
                              motion: const ScrollMotion(),
                              children: [
                                SlidableAction(
                                  onPressed: (context) =>
                                      removeFromFavorites(product['id']),
                                  backgroundColor: Colors.pink,
                                  foregroundColor: Colors.white,
                                  icon: Icons.delete,
                                  label: 'Delete',
                                ),
                              ],
                            ),
                            child: Card(
                              margin: const EdgeInsets.symmetric(vertical: 8.0),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: ListTile(
                                contentPadding: const EdgeInsets.all(8.0),
                                leading: Image.network(
                                  product['imageUrl'] ?? '',
                                  width: 80,
                                  fit: BoxFit.cover,
                                ),
                                title: Text(
                                  product['productName'] ?? 'Product Name',
                                  style: GoogleFonts.raleway(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                subtitle: Row(
                                  children: [
                                    Text(
                                      "₹${product['productPrice'] ?? 'N/A'}",
                                      style: GoogleFonts.raleway(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.pink,
                                      ),
                                    ),
                                    const SizedBox(width: 10),
                                    Row(
                                      children: [
                                        const Icon(Icons.star,
                                            color: Colors.pink, size: 16),
                                        const SizedBox(width: 4),
                                        Text(
                                          "4.3",
                                          style: GoogleFonts.raleway(
                                            fontSize: 14,
                                            color: Colors.pink,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                                trailing: GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      if (isSelected) {
                                        selectedIds.remove(product['id']);
                                      } else {
                                        selectedIds.add(product['id']);
                                      }
                                    });
                                  },
                                  child: AnimatedContainer(
                                    duration: const Duration(milliseconds: 300),
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: isSelected
                                          ? Colors.pink
                                          : Colors.grey[300],
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.all(6.0),
                                      child: Icon(
                                        isSelected ? Icons.check : Icons.circle,
                                        color: Colors.white,
                                        size: 20,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: ElevatedButton(
                        onPressed: () {
                          for (var id in selectedIds) {
                            addToCart(id);
                          }
                          setState(() {
                            selectedIds.clear();
                          });
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.pink,
                          minimumSize: const Size(double.infinity, 50),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                        child: Text(
                          'Add To Cart',
                          style: GoogleFonts.poppins(
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
    );
  }
}

class ProductDetailsScreen extends StatelessWidget {
  final Map<String, dynamic> product;

  const ProductDetailsScreen({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(product['productName'] ?? 'Details')),
      body: Center(
        child: Hero(
          tag: product['id'],
          child: Image.network(product['imageUrl'] ?? ''),
        ),
      ),
    );
  }
}
