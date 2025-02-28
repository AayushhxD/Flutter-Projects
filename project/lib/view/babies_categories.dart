import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:project/model/product_model.dart';
import 'package:project/view/cart.dart';
import 'package:project/view/home_Page_UI.dart';
import 'package:project/view/order_summary.dart';
import 'package:project/view/product_details.dart';

class BabiesCategories extends StatefulWidget {
  const BabiesCategories({super.key});

  @override
  State<BabiesCategories> createState() => _BabiesCategoriesState();
}

class _BabiesCategoriesState extends State<BabiesCategories> {
  List<NysaProduct> allProducts = [];
  List<NysaProduct> displayedProducts = [];
  String selectedCategory = "All";

  @override
  void initState() {
    super.initState();
    fetchDataFromFirestore();
  }

  void fetchDataFromFirestore() async {
    try {
      QuerySnapshot response = await FirebaseFirestore.instance
          .collection("products")
          .where("productCategories", isEqualTo: "Kids")
          .get();

      for (var doc in response.docs) {
        allProducts.add(NysaProduct(
          productId: doc.id,
          productName: doc['productName'],
          productPrice: doc['productPrice'],
          productWeight: doc['productWeight'],
          productCategories: doc['productCategories'],
          productType: doc['productType'],
          imageUrl: doc['imageUrl'],
          relatedImageUrls: doc['relatedImageUrls'],
        ));
      }
      setState(() {
        displayedProducts = List.from(allProducts);
      });
    } catch (e) {
      // Handle errors
    }
  }

  void filterProducts(String category) {
    setState(() {
      selectedCategory = category;
      if (category == "All") {
        displayedProducts = List.from(allProducts);
      } else {
        displayedProducts = allProducts
            .where((product) => product.productType == category)
            .toList();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          GestureDetector(
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(builder: (context) {
                return const Cart();
              }));
            },
            child: const Padding(
              padding: EdgeInsets.all(8.0),
              child: Icon(
                Icons.shopping_bag_outlined,
                color: Colors.white,
                size: 30,
              ),
            ),
          )
        ],
        leading: GestureDetector(
          onTap: () {
            Navigator.of(context).pop(MaterialPageRoute(builder: (context) {
              return const home_Page();
            }));
          },
          child: const Icon(
            Icons.arrow_back_ios,
            size: 35,
            color: Colors.white,
          ),
        ),
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
        title: Text(
          "Kids Categories",
          style: GoogleFonts.quicksand(
            fontSize: 27,
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Container(
              padding: const EdgeInsets.all(16.0),
              decoration: BoxDecoration(
                color: Colors.green.shade100,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Get 20% Off for all Items",
                          style: GoogleFonts.poppins(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.green.shade900,
                          ),
                        ),
                        const SizedBox(height: 8),
                        Text(
                          "Promo until 20 May 2024",
                          style: GoogleFonts.poppins(
                            fontSize: 14,
                            color: Colors.green.shade700,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(width: 10),
                  // Image.network(
                  //   'https://via.placeholder.com/80',
                  //   height: 80,
                  //   width: 80,
                  // ),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Wrap(
              spacing: 8.0,
              children: [
                _buildCategoryChip("All"),
                _buildCategoryChip("Necklaces"),
                _buildCategoryChip("Earrings"),
                _buildCategoryChip("Rings"),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: GridView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: displayedProducts.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 10,
                crossAxisSpacing: 10,
                childAspectRatio: 0.7,
              ),
              itemBuilder: (context, index) {
                final product = displayedProducts[index];
                return GestureDetector(
                  onTap: () {
                    Navigator.of(context)
                        .push(MaterialPageRoute(builder: (context) {
                      return Productscreen(fetchdata: product);
                    }));
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                          spreadRadius: 2,
                          blurRadius: 5,
                          offset: const Offset(0, 3),
                        ),
                      ],
                    ),
                    child: Stack(
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              margin: const EdgeInsets.all(10),
                              height: 150,
                              width: double.infinity,
                              child: Image.network(
                                product.imageUrl,
                                fit: BoxFit.cover,
                                loadingBuilder: (BuildContext context,
                                    Widget child,
                                    ImageChunkEvent? loadingProgress) {
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
                            Padding(
                              padding: const EdgeInsets.only(top: 4, left: 10),
                              child: Text(
                                product.productName,
                                style: GoogleFonts.caladea(
                                  fontWeight: FontWeight.w600,
                                  fontSize: 20,
                                  color: Colors.black,
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 3, left: 10),
                              child: Text(
                                "₹ ${product.productPrice}",
                                style: GoogleFonts.caladea(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 18,
                                  color: Colors.black,
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 8, left: 10),
                              child: ElevatedButton(
                                onPressed: () {
                                  Navigator.of(context).push(
                                    MaterialPageRoute(
                                      builder: (context) => OrderSummary(
                                        productName: product.productName,
                                        productPrice: product.productPrice,
                                        productWeight: product.productWeight,
                                        productImage: product.imageUrl,
                                      ),
                                    ),
                                  );
                                },
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.green,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                ),
                                child: const Text(
                                  'Buy Now',
                                  style: TextStyle(color: Colors.white),
                                ),
                              ),
                            ),
                          ],
                        ),
                        Positioned(
                          top: 10,
                          right: 10,
                          child: Icon(
                            Icons.favorite_border,
                            color: Colors.red,
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCategoryChip(String label) {
    return ChoiceChip(
      label: Text(
        label,
        style: GoogleFonts.poppins(
          fontSize: 14,
          color: selectedCategory == label ? Colors.white : Colors.black,
        ),
      ),
      selected: selectedCategory == label,
      onSelected: (bool selected) {
        if (selected) {
          filterProducts(label);
        }
      },
      selectedColor: Colors.green,
      backgroundColor: Colors.grey.shade200,
    );
  }
}
