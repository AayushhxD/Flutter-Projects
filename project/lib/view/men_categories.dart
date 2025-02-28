import 'dart:async';
import 'dart:developer';

import 'package:card_loading/card_loading.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:project/model/product_model.dart';
import 'package:project/view/cart.dart';
import 'package:project/view/home_Page_UI.dart';
import 'package:project/view/order_summary.dart';
import 'package:project/view/product_details.dart';

class MenCategories extends StatefulWidget {
  const MenCategories({super.key});

  @override
  State<MenCategories> createState() => _MenCategoriesState();
}

class _MenCategoriesState extends State<MenCategories> {
  List<NysaProduct> allProducts = [];
  List<NysaProduct> displayedProducts = [];
  String selectedCategory = "All";
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    fetchDataFromFirestore();
  }

  void fetchDataFromFirestore() async {
    try {
      QuerySnapshot response = await FirebaseFirestore.instance
          .collection("products")
          .where("productCategories", isEqualTo: "Men")
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
        _isLoading = false;
      });
    } catch (e) {
      log("Error fetching data: $e");
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
          "Men Categories",
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
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                // Promo Banner
                Container(
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: Colors.green.shade700,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Row(
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Get 20% Off for all Items",
                              style: GoogleFonts.quicksand(
                                fontSize: 18,
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(height: 5),
                            Text(
                              "Promo until 20 May 2024",
                              style: GoogleFonts.quicksand(
                                fontSize: 14,
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(width: 10),
                      // Image.network(
                      //   'https://via.placeholder.com/50', // Replace with your image URL
                      //   width: 50,
                      //   height: 50,
                      // ),
                    ],
                  ),
                ),
                const SizedBox(height: 20),
                // Category Chips
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: Wrap(
                    spacing: 8.0,
                    children: [
                      _buildCategoryChip("All"),
                      _buildCategoryChip("Shirts"),
                      _buildCategoryChip("Pants"),
                      _buildCategoryChip("Shoes"),
                    ],
                  ),
                ),
                const SizedBox(height: 20),
                // GridView
                _isLoading
                    ? GridView.builder(
                        padding: const EdgeInsets.all(8.0),
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          mainAxisSpacing: 10,
                          crossAxisSpacing: 10,
                          childAspectRatio: 0.8,
                        ),
                        itemCount: 6,
                        itemBuilder: (context, index) {
                          return const CardLoading(
                            height: 100,
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                            margin: EdgeInsets.only(bottom: 10),
                          );
                        },
                      )
                    : GridView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: displayedProducts.length,
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          mainAxisSpacing: 10,
                          crossAxisSpacing: 10,
                          childAspectRatio: 0.7,
                        ),
                        itemBuilder: (context, index) {
                          final product = displayedProducts[index];
                          return GestureDetector(
                            onTap: () {
                              Navigator.of(context).push(
                                MaterialPageRoute(builder: (context) {
                                  return Productscreen(fetchdata: product);
                                }),
                              );
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
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
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
                                              ImageChunkEvent?
                                                  loadingProgress) {
                                            if (loadingProgress == null) {
                                              return child;
                                            } else {
                                              return Center(
                                                child:
                                                    CircularProgressIndicator(
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
                                        padding: const EdgeInsets.only(
                                            top: 4, left: 10),
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
                                        padding: const EdgeInsets.only(
                                            top: 3, left: 10),
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
                                        padding: const EdgeInsets.only(
                                            top: 8, left: 10),
                                        child: ElevatedButton(
                                          onPressed: () {
                                            Navigator.of(context).push(
                                              MaterialPageRoute(
                                                builder: (context) =>
                                                    OrderSummary(
                                                  productName:
                                                      product.productName,
                                                  productPrice:
                                                      product.productPrice,
                                                  productWeight:
                                                      product.productWeight,
                                                  productImage:
                                                      product.imageUrl,
                                                ),
                                              ),
                                            );
                                          },
                                          style: ElevatedButton.styleFrom(
                                            backgroundColor: Colors.green,
                                            shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(8),
                                            ),
                                          ),
                                          child: const Text(
                                            'Buy Now',
                                            style:
                                                TextStyle(color: Colors.white),
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
              ],
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
