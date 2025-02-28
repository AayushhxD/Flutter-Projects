import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:carousel_slider/carousel_slider.dart';
import "package:google_fonts/google_fonts.dart";
import 'package:project/image_slider/image_slider.dart';
import 'package:project/image_slider/image_viewer_helper.dart';
import 'package:project/view/cart.dart';
import 'package:project/view/categories.dart';
import 'package:project/view/favorite.dart';
import 'package:project/view/login.dart';
import 'package:project/view/search.dart';

class home_Page extends StatefulWidget {
  const home_Page({super.key});

  @override
  State<home_Page> createState() => _home_PageState();
}

class _home_PageState extends State<home_Page> {
  Future<void> logout() async {
    try {
      await FirebaseAuth.instance.signOut();
      print("User logged out successfully.");
    } catch (e) {
      print("Error logging out: $e");
    }
  }

  late CarouselSliderController homeCarouselController;

  int innerCurrentPage = 0;

  void initState() {
    homeCarouselController = CarouselSliderController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size size;
    double height, width;

    size = MediaQuery.of(context).size;
    height = size.height;
    width = size.width;
    return Scaffold(
      extendBody: true,
      backgroundColor: const Color.fromARGB(246, 246, 246, 255),
      appBar: AppBar(
        toolbarHeight: 80.0,
        flexibleSpace: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.centerLeft, // Start from the left
              end: Alignment.centerRight, // End at the right
              colors: [
                Color.fromRGBO(6, 40, 30, 1),
                Color.fromRGBO(12, 81, 61, 1),
              ],
            ),
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: GestureDetector(
              onTap: () {
                // Add your onTap functionality here, e.g., toggle a favorite status or show a message
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (context) {
                  return const FavoritesScreen();
                }));
              },
              child: const Icon(
                Icons.favorite_outline,
                size: 30,
                color: Colors.white,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: GestureDetector(
              onTap: () {
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (context) {
                  return const Cart();
                }));
              },
              child: const Icon(
                Icons.shopping_bag_outlined,
                size: 30,
                color: Colors.white,
              ),
            ),
          ),
        ],
        title: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/Nysa2.png',
              height: 50,
              width: 50,
            ),
            const SizedBox(width: 10),
            Text(
              "NYSA JEWELS & CO.",
              style: GoogleFonts.cormorantGaramond(
                fontSize: 18,
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
        centerTitle: true,
      ),
      drawer: Drawer(
        //shadowColor: Colors.amber,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              /// Header of the Drawer
              Material(
                child: InkWell(
                  onTap: () {
                    Navigator.pop(context);
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const home_Page()),
                    );
                  },
                  child: Container(
                    decoration: const BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                        colors: [
                          Color.fromRGBO(6, 40, 30, 1),
                          Color.fromRGBO(12, 81, 61, 1),
                        ],
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black26,
                          blurRadius: 8,
                          offset: Offset(0, 4),
                        ),
                      ],
                    ),
                    padding: EdgeInsets.only(
                        top: MediaQuery.of(context).padding.top, bottom: 24),
                    child: FutureBuilder<DocumentSnapshot>(
                      future: FirebaseFirestore.instance
                          .collection('users')
                          .doc(FirebaseAuth.instance.currentUser?.uid)
                          .get(),
                      builder: (context, snapshot) {
                        if (snapshot.connectionState ==
                            ConnectionState.waiting) {
                          return const Center(
                              child: CircularProgressIndicator());
                        }

                        if (snapshot.hasError) {
                          return const Center(
                              child: Text("Error loading data"));
                        }

                        if (snapshot.hasData && snapshot.data != null) {
                          var userData = snapshot.data!;
                          String userName = userData['name'] ?? 'User';
                          String userEmail = userData['email'] ?? 'No Email';

                          return Column(
                            children: [
                              const SizedBox(height: 12),
                              Text(
                                userName,
                                style: const TextStyle(
                                  fontFamily: 'Poppins', // Apply Poppins font
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                              ),
                              Text(
                                userEmail,
                                style: const TextStyle(
                                  fontFamily: 'Poppins', // Apply Poppins font
                                  fontSize: 15,
                                  color: Colors.white70,
                                ),
                              ),
                            ],
                          );
                        }

                        return const Center(child: Text("No data available"));
                      },
                    ),
                  ),
                ),
              ),

              /// Header Menu items
              Column(
                children: [
                  ListTile(
                    leading:
                        const Icon(Icons.home_outlined, color: Colors.teal),
                    title: const Text('Home',
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.w500)),
                    onTap: () {
                      Navigator.pop(context);
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const home_Page()),
                      );
                    },
                  ),
                  ListTile(
                    leading:
                        const Icon(Icons.favorite_border, color: Colors.teal),
                    title: const Text('Favourites',
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.w500)),
                    onTap: () {
                      Navigator.pop(context);
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const FavoritesScreen()),
                      );
                    },
                  ),
                  ListTile(
                    leading: const Icon(Icons.category, color: Colors.teal),
                    title: const Text('Category',
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.w500)),
                    onTap: () {
                      Navigator.pop(context);
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const Categories()),
                      );
                    },
                  ),
                  ListTile(
                    leading:
                        const Icon(Icons.account_circle, color: Colors.teal),
                    title: Text('Account',
                        style: GoogleFonts.poppins(
                            fontSize: 16, fontWeight: FontWeight.w500)),
                    onTap: () {},
                  ),
                  const Divider(color: Colors.black45),
                  ListTile(
                    leading: const Icon(Icons.call, color: Colors.teal),
                    title: Text('Contact us',
                        style: GoogleFonts.poppins(
                            fontSize: 16, fontWeight: FontWeight.w500)),
                    onTap: () {},
                  ),
                  ListTile(
                    leading: const Icon(Icons.notifications_outlined,
                        color: Colors.teal),
                    title: Text('Notifications',
                        style: GoogleFonts.poppins(
                            fontSize: 16, fontWeight: FontWeight.w500)),
                    onTap: () {},
                  ),
                  ListTile(
                    leading: const Icon(Icons.logout, color: Colors.teal),
                    title: Text('Logout',
                        style: GoogleFonts.poppins(
                            fontSize: 16, fontWeight: FontWeight.w500)),
                    onTap: () async {
                      await FirebaseAuth.instance.signOut();
                      Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(builder: (context) => LoginPage()),
                        (route) => false,
                      );
                    },
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
      body: ListView.builder(
        itemCount: 1,
        itemBuilder: (BuildContext context, int index) {
          return Column(
            children: [
              const SizedBox(
                height: 15,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const Search()),
                      );
                    },
                    child: Container(
                      height: 50,
                      width: 314,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: const Color.fromRGBO(233, 237, 248, 1),
                        boxShadow: [
                          BoxShadow(
                            color:
                                Colors.black.withOpacity(0.2), // Subtle shadow
                            blurRadius: 10, // Softens the shadow
                            offset: const Offset(
                                0, 4), // Horizontal and vertical offset
                          ),
                        ],
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            "   Find Your Sparkle   ",
                            style: GoogleFonts.poppins(
                              color: const Color.fromARGB(255, 122, 122,
                                  122), // A slightly darker gray for elegance.
                              fontSize: 13,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const Search()),
                      );
                    },
                    child: Container(
                        height: 60,
                        width: 60,
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          gradient: LinearGradient(
                            begin: Alignment.centerLeft, // Start from the left
                            end: Alignment.centerRight, // End at the right
                            colors: [
                              Color.fromRGBO(6, 40, 30, 1),
                              Color.fromRGBO(12, 81, 61, 1),
                            ],
                          ),
                        ),
                        child: const Icon(
                          Icons.search,
                          color: Colors.white,
                        )),
                  )
                ],
              ),
              const SizedBox(
                height: 0.25,
              ),

              SizedBox(
                height: 300,
                width: 400,
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    // Carousel
                    Positioned.fill(
                      child: CarouselSlider(
                        carouselController: homeCarouselController,
                        items: AppData.homepage.map((imagePath) {
                          return Builder(
                            builder: (BuildContext context) {
                              return ImageViewerHelper.show(
                                context: context,
                                url: imagePath,
                              );
                            },
                          );
                        }).toList(),
                        options: CarouselOptions(
                          enlargeCenterPage: true,
                          autoPlay: true,
                          enableInfiniteScroll: true,
                          viewportFraction: 0.8,
                          onPageChanged: (index, reason) {
                            setState(() {
                              innerCurrentPage = index;
                            });
                          },
                        ),
                      ),
                    ),

                    // Indicators
                    Positioned(
                      bottom: 20, // Adjusted for better readability
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children:
                            List.generate(AppData.homepage.length, (index) {
                          bool isSelected = innerCurrentPage == index;
                          return GestureDetector(
                            onTap: () {
                              homeCarouselController.animateToPage(index);
                            },
                            child: AnimatedContainer(
                              width: isSelected ? 55 : 17,
                              margin: const EdgeInsets.symmetric(horizontal: 6),
                              height: 10,
                              decoration: BoxDecoration(
                                gradient: isSelected
                                    ? const LinearGradient(
                                        colors: [
                                          Color.fromRGBO(6, 40, 30, 1),
                                          Color.fromRGBO(12, 81, 61, 1),
                                        ],
                                        begin: Alignment.centerLeft,
                                        end: Alignment.centerRight,
                                      )
                                    : null, // No gradient when not selected
                                color: isSelected
                                    ? null
                                    : Colors.grey
                                        .shade300, // Fallback for deselected state
                                borderRadius: BorderRadius.circular(40),
                              ),
                              duration: const Duration(milliseconds: 300),
                              curve: Curves.ease,
                            ),
                          );
                        }),
                      ),
                    ),
                  ],
                ),
              ),

              // Best of Festive

              Container(
                height: 340,
                width: 400,
                color: const Color.fromARGB(252, 252, 252, 255),
                child: Column(
                  children: [
                    Text(
                      "Best Of Festive",
                      style: GoogleFonts.openSans(
                        fontWeight: FontWeight.w600,
                        fontSize: 28,
                        color: Colors.red, // Set alpha to 255 for full opacity
                      ),
                    ),
                    Text(
                      "Top picks for this season",
                      style: GoogleFonts.poppins(
                        fontWeight: FontWeight.w600,
                        fontSize: 13,
                        color:
                            Colors.black, // Set alpha to 255 for full opacity
                      ),
                    ),
                    const SizedBox(
                      height: 25,
                    ),
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            height: 250,
                            width: 380,
                            // color: Colors.amber,

                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Container(
                                  height: 240,
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.grey.withOpacity(0.5),
                                        spreadRadius: 2,
                                        blurRadius: 5,
                                        offset: const Offset(
                                            0, 3), // changes position of shadow
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
                                            width: 150,
                                            child: Image.network(
                                              "https://static.malabargoldanddiamonds.com/media/catalog/product/cache/1/image/9df78eab33525d08d6e5fb8d27136e95/n/n/nnkth085_c.jpg",
                                              fit: BoxFit.cover,
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.only(
                                                top: 5, left: 10),
                                            child: Text(
                                              "Timeless Polki Diamond",
                                              style: GoogleFonts.caladea(
                                                fontWeight: FontWeight.w600,
                                                fontSize: 13,
                                                color: Colors.black,
                                              ),
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.only(
                                                top: 5, left: 10),
                                            child: Text(
                                              "90,000",
                                              style: GoogleFonts.poppins(
                                                fontWeight: FontWeight.w600,
                                                fontSize: 13,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                                Container(
                                  height: 240,
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.grey.withOpacity(0.5),
                                        spreadRadius: 2,
                                        blurRadius: 5,
                                        offset: const Offset(
                                            0, 3), // changes position of shadow
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
                                            width: 150,
                                            child: Image.network(
                                              "https://static.malabargoldanddiamonds.com/media/catalog/product/cache/1/image/9df78eab33525d08d6e5fb8d27136e95/n/n/nnkth085_c.jpg",
                                              fit: BoxFit.cover,
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.only(
                                                top: 5, left: 10),
                                            child: Text(
                                              "Timeless Polki Diamond",
                                              style: GoogleFonts.caladea(
                                                fontWeight: FontWeight.w600,
                                                fontSize: 13,
                                                color: Colors.black,
                                              ),
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.only(
                                                top: 5, left: 10),
                                            child: Text(
                                              "90,000",
                                              style: GoogleFonts.poppins(
                                                fontWeight: FontWeight.w600,
                                                fontSize: 13,
                                              ),
                                            ),
                                          )
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Container(
                            height: 250,
                            width: 380,
                            // color: Colors.amber,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Container(
                                  height: 240,
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.grey.withOpacity(0.5),
                                        spreadRadius: 2,
                                        blurRadius: 5,
                                        offset: const Offset(
                                            0, 3), // changes position of shadow
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
                                            width: 150,
                                            child: Image.network(
                                              "https://static.malabargoldanddiamonds.com/media/catalog/product/cache/1/image/9df78eab33525d08d6e5fb8d27136e95/n/n/nnkth085_c.jpg",
                                              fit: BoxFit.cover,
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.only(
                                                top: 5, left: 10),
                                            child: Text(
                                              "Timeless Polki Diamond",
                                              style: GoogleFonts.caladea(
                                                fontWeight: FontWeight.w600,
                                                fontSize: 13,
                                                color: Colors.black,
                                              ),
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.only(
                                                top: 5, left: 10),
                                            child: Text(
                                              "90,000",
                                              style: GoogleFonts.poppins(
                                                fontWeight: FontWeight.w600,
                                                fontSize: 13,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                                Container(
                                  height: 240,
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.grey.withOpacity(0.5),
                                        spreadRadius: 2,
                                        blurRadius: 5,
                                        offset: const Offset(
                                            0, 3), // changes position of shadow
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
                                            width: 150,
                                            child: Image.network(
                                              "https://static.malabargoldanddiamonds.com/media/catalog/product/cache/1/image/9df78eab33525d08d6e5fb8d27136e95/n/n/nnkth085_c.jpg",
                                              fit: BoxFit.cover,
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.only(
                                                top: 5, left: 10),
                                            child: Text(
                                              "Timeless Polki Diamond",
                                              style: GoogleFonts.caladea(
                                                fontWeight: FontWeight.w600,
                                                fontSize: 13,
                                                color: Colors.black,
                                              ),
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.only(
                                                top: 5, left: 10),
                                            child: Text(
                                              "90,000",
                                              style: GoogleFonts.poppins(
                                                fontWeight: FontWeight.w600,
                                                fontSize: 13,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
              const SizedBox(
                height: 10,
              ),

              //Nysa Special

              Container(
                height: 340,
                width: 400,
                color: const Color.fromARGB(252, 252, 252, 255),
                child: Column(
                  children: [
                    Text(
                      "NYSA Special",
                      style: GoogleFonts.openSans(
                        fontWeight: FontWeight.w600,
                        fontSize: 28,
                        color: Colors.red, // Set alpha to 255 for full opacity
                      ),
                    ),
                    Text(
                      "Our top picks, just for you !",
                      style: GoogleFonts.poppins(
                        fontWeight: FontWeight.w600,
                        fontSize: 13,
                        color:
                            Colors.black, // Set alpha to 255 for full opacity
                      ),
                    ),
                    const SizedBox(
                      height: 25,
                    ),
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            height: 250,
                            width: 380,
                            // color: Colors.amber,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Container(
                                  height: 240,
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.grey.withOpacity(0.5),
                                        spreadRadius: 2,
                                        blurRadius: 5,
                                        offset: const Offset(
                                            0, 3), // changes position of shadow
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
                                            width: 150,
                                            child: Image.network(
                                              "https://static.malabargoldanddiamonds.com/media/catalog/product/cache/1/image/9df78eab33525d08d6e5fb8d27136e95/n/n/nnkth085_c.jpg",
                                              fit: BoxFit.cover,
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.only(
                                                top: 5, left: 10),
                                            child: Text(
                                              "Timeless Polki Diamond",
                                              style: GoogleFonts.caladea(
                                                fontWeight: FontWeight.w600,
                                                fontSize: 13,
                                                color: Colors.black,
                                              ),
                                            ),
                                          ),
                                          const Padding(
                                            padding: EdgeInsets.only(
                                                top: 5, left: 10),
                                            child: Text("90,000"),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                                Container(
                                  height: 240,
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.grey.withOpacity(0.5),
                                        spreadRadius: 2,
                                        blurRadius: 5,
                                        offset: const Offset(
                                            0, 3), // changes position of shadow
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
                                            width: 150,
                                            child: Image.network(
                                              "https://static.malabargoldanddiamonds.com/media/catalog/product/cache/1/image/9df78eab33525d08d6e5fb8d27136e95/n/n/nnkth085_c.jpg",
                                              fit: BoxFit.cover,
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.only(
                                                top: 5, left: 10),
                                            child: Text(
                                              "Timeless Polki Diamond",
                                              style: GoogleFonts.caladea(
                                                fontWeight: FontWeight.w600,
                                                fontSize: 13,
                                                color: Colors.black,
                                              ),
                                            ),
                                          ),
                                          const Padding(
                                            padding: EdgeInsets.only(
                                                top: 5, left: 10),
                                            child: Text("90,000"),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Container(
                            height: 250,
                            width: 380,
                            // color: Colors.amber,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Container(
                                  height: 240,
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.grey.withOpacity(0.5),
                                        spreadRadius: 2,
                                        blurRadius: 5,
                                        offset: const Offset(
                                            0, 3), // changes position of shadow
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
                                            width: 150,
                                            child: Image.network(
                                              "https://static.malabargoldanddiamonds.com/media/catalog/product/cache/1/image/9df78eab33525d08d6e5fb8d27136e95/n/n/nnkth085_c.jpg",
                                              fit: BoxFit.cover,
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.only(
                                                top: 5, left: 10),
                                            child: Text(
                                              "Timeless Polki Diamond",
                                              style: GoogleFonts.caladea(
                                                fontWeight: FontWeight.w600,
                                                fontSize: 13,
                                                color: Colors.black,
                                              ),
                                            ),
                                          ),
                                          const Padding(
                                            padding: EdgeInsets.only(
                                                top: 5, left: 10),
                                            child: Text("90,000"),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                                Container(
                                  height: 240,
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.grey.withOpacity(0.5),
                                        spreadRadius: 2,
                                        blurRadius: 5,
                                        offset: const Offset(
                                            0, 3), // changes position of shadow
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
                                            width: 150,
                                            child: Image.network(
                                              "https://static.malabargoldanddiamonds.com/media/catalog/product/cache/1/image/9df78eab33525d08d6e5fb8d27136e95/n/n/nnkth085_c.jpg",
                                              fit: BoxFit.cover,
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.only(
                                                top: 5, left: 10),
                                            child: Text(
                                              "Timeless Polki Diamond",
                                              style: GoogleFonts.caladea(
                                                fontWeight: FontWeight.w600,
                                                fontSize: 13,
                                                color: Colors.black,
                                              ),
                                            ),
                                          ),
                                          const Padding(
                                            padding: EdgeInsets.only(
                                                top: 5, left: 10),
                                            child: Text("90,000"),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
              const SizedBox(
                height: 10,
              ),

              //Gold Best Sellers

              Container(
                height: 600,
                width: 400,
                color: const Color.fromARGB(252, 252, 252, 255),
                child: Column(
                  children: [
                    Text(
                      "Gold Best Sellers",
                      style: GoogleFonts.openSans(
                        fontWeight: FontWeight.w600,
                        fontSize: 28,
                        color: Colors.red, // Set alpha to 255 for full opacity
                      ),
                    ),
                    Text(
                      "Look at our gold collection curated just for you",
                      style: GoogleFonts.poppins(
                        fontWeight: FontWeight.w600,
                        fontSize: 13,
                        color:
                            Colors.black, // Set alpha to 255 for full opacity
                      ),
                    ),
                    const SizedBox(
                      height: 25,
                    ),
                    SizedBox(
                      width: 380,
                      height: 250,
                      child: Image.network(
                        "https://www.orra.co.in/media/catalog/product/cache/f863675abff2fd3fa792fa24743dba0a/o/n/ons23022.jpg",
                        fit: BoxFit.cover,
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: [
                          Container(
                            height: 250,
                            width: 380,
                            // color: Colors.amber,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Container(
                                      margin: const EdgeInsets.all(10),
                                      height: 210,
                                      width: 170,
                                      child: Column(
                                        children: [
                                          Image.network(
                                            "https://www.tanishq.co.in/dw/image/v2/BKCK_PRD/on/demandware.static/-/Sites-Tanishq-product-catalog/default/dw31381538/images/hi-res/512714SMWABAP1.jpg?sw=640&sh=640",
                                            fit: BoxFit.cover,
                                          ),
                                          Text(
                                            "Earrings",
                                            style: GoogleFonts.caladea(
                                              fontWeight: FontWeight.w600,
                                              fontSize: 15,
                                              color: Colors
                                                  .red, // Set alpha to 255 for full opacity
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Container(
                                      margin: const EdgeInsets.all(10),
                                      height: 210,
                                      width: 170,
                                      child: Column(
                                        children: [
                                          Image.network(
                                            "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQX6PwT3Xqs_AAIXF1oMhFwcENhX3hx8jAVrw&s",
                                            fit: BoxFit.cover,
                                          ),
                                          Text(
                                            "Rings",
                                            style: GoogleFonts.caladea(
                                              fontWeight: FontWeight.w600,
                                              fontSize: 15,
                                              color: Colors
                                                  .red, // Set alpha to 255 for full opacity
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          Container(
                            height: 250,
                            width: 380,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Container(
                                      margin: const EdgeInsets.all(10),
                                      height: 210,
                                      width: 170,
                                      child: Column(
                                        children: [
                                          Image.network(
                                            "https://www.tanishq.co.in/dw/image/v2/BKCK_PRD/on/demandware.static/-/Sites-Tanishq-product-catalog/default/dw31381538/images/hi-res/512714SMWABAP1.jpg?sw=640&sh=640",
                                            fit: BoxFit.cover,
                                          ),
                                          Text(
                                            "Earrings",
                                            style: GoogleFonts.caladea(
                                              fontWeight: FontWeight.w600,
                                              fontSize: 15,
                                              color: Colors
                                                  .red, // Set alpha to 255 for full opacity
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Container(
                                      margin: const EdgeInsets.all(10),
                                      height: 210,
                                      width: 170,
                                      child: Column(
                                        children: [
                                          Image.network(
                                            "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQX6PwT3Xqs_AAIXF1oMhFwcENhX3hx8jAVrw&s",
                                            fit: BoxFit.cover,
                                          ),
                                          Text(
                                            "Rings",
                                            style: GoogleFonts.caladea(
                                              fontWeight: FontWeight.w600,
                                              fontSize: 15,
                                              color: Colors
                                                  .red, // Set alpha to 255 for full opacity
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Container(
                height: 570,
                width: 400,
                color: const Color.fromARGB(252, 252, 252, 255),
                child: Column(
                  children: [
                    Text(
                      "Collections",
                      style: GoogleFonts.caladea(
                        fontWeight: FontWeight.w600,
                        fontSize: 28,
                        color:
                            Colors.black, // Set alpha to 255 for full opacity
                      ),
                    ),
                    const SizedBox(
                      height: 25,
                    ),
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(
                                  width: 380,
                                  height: 380,
                                  child: Image.network(
                                    "https://www.orra.co.in/media/catalog/product/cache/f863675abff2fd3fa792fa24743dba0a/o/n/ons23022.jpg",
                                    fit: BoxFit.cover,
                                  ),
                                ),
                                const SizedBox(
                                  height: 15,
                                ),
                                Row(
                                  children: [
                                    Text(
                                      "Iris Silver",
                                      style: GoogleFonts.caladea(
                                        fontWeight: FontWeight.w600,
                                        fontSize: 23,
                                        color: Colors
                                            .black, // Set alpha to 255 for full opacity
                                      ),
                                    ),
                                    const Icon(Icons.arrow_forward)
                                  ],
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(
                                  width: 380,
                                  height: 380,
                                  child: Image.network(
                                    "https://www.orra.co.in/media/catalog/product/cache/f863675abff2fd3fa792fa24743dba0a/o/n/ons23022.jpg",
                                    fit: BoxFit.cover,
                                  ),
                                ),
                                const SizedBox(
                                  height: 15,
                                ),
                                Row(
                                  children: [
                                    Text(
                                      "Iris Silver",
                                      style: GoogleFonts.caladea(
                                        fontWeight: FontWeight.w600,
                                        fontSize: 23,
                                        color: Colors
                                            .black, // Set alpha to 255 for full opacity
                                      ),
                                    ),
                                    const Icon(Icons.arrow_forward)
                                  ],
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    const Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.arrow_back_ios_new),
                        Text(
                          "1/4",
                          style: TextStyle(fontSize: 15, color: Colors.black),
                        ),
                        Icon(Icons.arrow_forward_ios)
                      ],
                    )
                  ],
                ),
              ),
              const SizedBox(
                height: 10,
              ),
            ],
          );
        },
      ),
    );
  }
}
