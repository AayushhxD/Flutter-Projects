import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:project/model/product_model.dart';
import 'package:project/view/cart.dart';
import 'package:project/view/favorite.dart';
import 'package:project/view/order_summary.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class Productscreen extends StatefulWidget {
  final NysaProduct fetchdata;
  Productscreen({super.key, required this.fetchdata});

  @override
  State<Productscreen> createState() => _ProductscreenState();
}

class _ProductscreenState extends State<Productscreen> {
  @override
  void initState() {
    super.initState();
    _checkIfLiked();
    _checkIfInCart();
  }

  bool _isInCart = false;
  bool _isLiked = false;
  final PageController _pageController = PageController();
  int _count = 1;

  void _toggleCart(String productId) async {
    final user = FirebaseAuth.instance.currentUser;

    if (user == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('You must be logged in to add items to the cart.'),
        ),
      );
      return;
    }

    final userDocRef =
        FirebaseFirestore.instance.collection('users').doc(user.uid);

    final userDoc = await userDocRef.get();
    if (userDoc.exists) {
      final cart = List<String>.from(userDoc['cart'] ?? []);

      if (cart.contains(productId)) {
        cart.remove(productId);
      } else {
        cart.add(productId);
      }

      await userDocRef.update({'cart': cart});
      setState(() {
        _isInCart = cart.contains(productId);
      });
    }
  }

  void _checkIfInCart() async {
    final user = FirebaseAuth.instance.currentUser;

    if (user == null) return;

    final userDoc = await FirebaseFirestore.instance
        .collection('users')
        .doc(user.uid)
        .get();

    if (userDoc.exists) {
      final cart = List<String>.from(userDoc['cart'] ?? []);
      setState(() {
        _isInCart = cart.contains(widget.fetchdata.productId);
      });
    }
  }

  void _checkIfLiked() async {
    final user = FirebaseAuth.instance.currentUser;

    if (user == null) return;

    final userDoc = await FirebaseFirestore.instance
        .collection('users')
        .doc(user.uid)
        .get();

    if (userDoc.exists) {
      final favorites = List<String>.from(userDoc['favourites'] ?? []);
      setState(() {
        _isLiked = favorites.contains(widget.fetchdata.productId);
      });
    }
  }

  void _toggleLike(String productId) async {
    final user = FirebaseAuth.instance.currentUser;

    if (user == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
            content: Text('You must be logged in to favorite items.')),
      );
      return;
    }

    final userDocRef =
        FirebaseFirestore.instance.collection('users').doc(user.uid);

    final userDoc = await userDocRef.get();
    if (userDoc.exists) {
      final favorites = List<String>.from(userDoc['favourites'] ?? []);

      if (favorites.contains(productId)) {
        favorites.remove(productId);
      } else {
        favorites.add(productId);
      }

      await userDocRef.update({'favourites': favorites});
      setState(() {
        _isLiked = favorites.contains(productId);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: GestureDetector(
          onTap: () {
            Navigator.of(context).pop();
          },
          child: const Icon(
            Icons.arrow_back_ios,
            size: 35,
            color: Colors.white,
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const FavoritesScreen()),
                );
              },
              child: const Icon(
                Icons.favorite_outline,
                size: 30,
                color: Colors.white,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10),
            child: GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const Cart()),
                );
              },
              child: const Icon(
                Icons.shopping_bag_outlined,
                size: 30,
                color: Colors.white,
              ),
            ),
          ),
        ],
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
      ),
      body: Column(
        children: [
          const SizedBox(height: 10),
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 300,
                    child: PageView.builder(
                      controller: _pageController,
                      itemCount: widget.fetchdata.relatedImageUrls.length,
                      itemBuilder: (context, index) {
                        return Image.network(
                          widget.fetchdata.relatedImageUrls[index],
                          fit: BoxFit.cover,
                          loadingBuilder: (context, child, progress) {
                            return progress == null
                                ? child
                                : Center(
                                    child: LoadingAnimationWidget
                                        .threeArchedCircle(
                                      color:
                                          const Color.fromARGB(255, 15, 80, 18),
                                      size: 80,
                                    ),
                                  );
                          },
                        );
                      },
                    ),
                  ),
                  Center(
                    child: Padding(
                      padding: const EdgeInsets.only(top: 10, left: 5),
                      child: SmoothPageIndicator(
                        controller: _pageController,
                        count: widget.fetchdata.relatedImageUrls.length,
                        effect: WormEffect(
                          dotHeight: 12,
                          dotWidth: 12,
                          activeDotColor: Colors.teal,
                          dotColor: Colors.grey.shade400,
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 10),
                    child: Text(
                      "N Y S A",
                      style: GoogleFonts.poppins(
                        fontSize: 15,
                        color: const Color(0xFF093D2E),
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 10),
                        child: Text(
                          "${widget.fetchdata.productName}",
                          style: GoogleFonts.playfairDisplay(
                            fontSize: 30,
                            color: const Color(0xFF093D2E),
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(right: 25, top: 5),
                        child: Text(
                          " ₹ ${widget.fetchdata.productPrice}",
                          style: GoogleFonts.quicksand(
                            fontSize: 25,
                            color: const Color(0xFF093D2E),
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 5),
                  Padding(
                    padding: const EdgeInsets.only(left: 10, top: 5, right: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Text(
                              "Gross Weight  ",
                              style: GoogleFonts.openSans(fontSize: 15),
                            ),
                            Text(
                              "( in Gms )",
                              style: GoogleFonts.openSans(
                                  fontSize: 13, fontWeight: FontWeight.w400),
                            ),
                          ],
                        ),
                        IconButton(
                          icon: Icon(
                            _isLiked ? Icons.favorite : Icons.favorite_outline,
                            size: 30,
                            color: _isLiked
                                ? const Color.fromARGB(255, 227, 12, 12)
                                : Colors.grey,
                          ),
                          onPressed: () =>
                              _toggleLike(widget.fetchdata.productId),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 20, top: 8),
                    child: Container(
                      height: 30,
                      width: 70,
                      decoration: BoxDecoration(
                        color: const Color.fromARGB(255, 215, 223, 215),
                        borderRadius: BorderRadius.circular(50),
                        border: Border.all(
                          color: const Color.fromARGB(255, 5, 87, 8),
                        ),
                      ),
                      child: Center(
                        child: Text(
                          "${widget.fetchdata.productWeight}",
                          style: const TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                            color: Color.fromARGB(255, 5, 87, 8),
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),
                  const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text(
                      "Description of the Product",
                      style: TextStyle(fontSize: 18),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(5),
                    child: Text(
                      "The ${widget.fetchdata.productName}, crafted with sterling silver, features a bold and minimalist design that adds a powerful statement to any look. Perfect for everyday wear, this sleek bracelet offers strength and sophistication, making it the ideal accessory for the modern man who values simplicity and style.",
                      style: GoogleFonts.poppins(
                        fontSize: 20,
                        color: const Color(0xFF093D2E),
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: GestureDetector(
                  onTap: () => _toggleCart(widget.fetchdata.productId),
                  child: Container(
                    height: 60,
                    width: 140,
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: _isInCart ? Colors.green : Colors.grey,
                      ),
                      borderRadius: BorderRadius.circular(7),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        const SizedBox(width: 7),
                        Icon(
                          _isInCart ? Icons.check : Icons.shopping_bag_outlined,
                        ),
                        const SizedBox(width: 10),
                        Text(
                          _isInCart ? "Added" : "Add To Cart",
                          style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w500,
                            color: _isInCart
                                ? const Color.fromARGB(255, 42, 98, 44)
                                : Colors.black,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) {
                          return OrderSummary(
                            productName: widget.fetchdata.productName,
                            productPrice:
                                (int.parse(widget.fetchdata.productPrice) *
                                        _count)
                                    .toString(),
                            productWeight: widget.fetchdata.productWeight,
                            productImage: widget.fetchdata.imageUrl,
                          );
                        },
                      ),
                    );
                  },
                  child: Container(
                    height: 60,
                    width: 140,
                    decoration: BoxDecoration(
                      gradient: const LinearGradient(
                        begin: Alignment.centerLeft,
                        end: Alignment.centerRight,
                        colors: [
                          Color.fromRGBO(6, 40, 30, 1),
                          Color.fromRGBO(12, 81, 61, 1),
                        ],
                      ),
                      borderRadius: BorderRadius.circular(7), // Rounded edges
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                          spreadRadius: 2,
                          blurRadius: 5,
                          offset: const Offset(0, 3),
                        ),
                      ],
                    ),
                    child: const Center(
                      child: Text(
                        "Buy Now",
                        style: TextStyle(fontSize: 20, color: Colors.white),
                      ),
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
}
