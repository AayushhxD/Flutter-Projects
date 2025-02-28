import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:project/view/cart.dart';
import 'package:project/view/favorite.dart';
import 'package:project/view/login.dart';
import 'package:project/view/orderscreen.dart';

class Account extends StatefulWidget {
  const Account({super.key});

  @override
  State<Account> createState() => _AccountState();
}

class _AccountState extends State<Account> {
  String username = '';
  late Future<User?> currentUserFuture;

  @override
  void initState() {
    super.initState();
    _getUser();
    currentUserFuture = FirebaseAuth.instance
        .authStateChanges()
        .firstWhere((user) => user != null);
  }

  Future<void> _getUser() async {
    User? user = FirebaseAuth.instance.currentUser;
    if (user != null) {
      setState(() {
        username = user.displayName ?? user.email ?? 'Guest';
      });
    }
  }

  Future<void> logout() async {
    try {
      await FirebaseAuth.instance.signOut();
      print("User logged out successfully.");
    } catch (e) {
      print("Error logging out: $e");
    }
  }

  Widget _buildRichButton(BuildContext context,
      {required IconData icon,
      required String label,
      required VoidCallback onTap}) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 100,
        width: 160,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(15),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.2),
              spreadRadius: 3,
              blurRadius: 6,
              offset: const Offset(0, 3),
            ),
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircleAvatar(
              radius: 25,
              backgroundColor: const Color.fromRGBO(12, 81, 61, 1),
              child: Icon(icon, color: Colors.white, size: 30),
            ),
            const SizedBox(height: 10),
            Text(
              label,
              style: GoogleFonts.poppins(
                fontSize: 16,
                fontWeight: FontWeight.w500,
                color: Colors.black87,
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Method to show coupon bottom sheet
  void _showCouponBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (context) {
        return Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                "Available Coupons",
                style: GoogleFonts.poppins(
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(height: 10),
              ListView.builder(
                shrinkWrap: true,
                itemCount: 3, // Example: 3 coupons
                itemBuilder: (context, index) {
                  final coupons = [
                    'NYSA10 - 10% OFF',
                    'JEWELS20 - 20% OFF',
                    'WELCOME30 - 30% OFF'
                  ];

                  return ListTile(
                    title: Text(
                      coupons[index],
                      style: GoogleFonts.poppins(fontSize: 16),
                    ),
                    trailing: IconButton(
                      icon: const Icon(Icons.copy),
                      onPressed: () {
                        Clipboard.setData(ClipboardData(text: coupons[index]));
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                              content: Text("Coupon copied to clipboard")),
                        );
                      },
                    ),
                  );
                },
              ),
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<User?>(
        future: currentUserFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Scaffold(
              body: Center(child: CircularProgressIndicator()),
            );
          }

          if (snapshot.hasError) {
            return Scaffold(
              body: Center(child: Text('Error: ${snapshot.error}')),
            );
          }

          final User? currentUser = snapshot.data;
          if (currentUser == null) {
            return Scaffold(
              appBar: AppBar(
                title: const Text('Account'),
              ),
              body: const Center(
                  child: Text('Please log in to view your account.')),
            );
          }

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
                actions: [
                  IconButton(
                    onPressed: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(builder: (context) {
                          return const FavoritesScreen();
                        }),
                      );
                    },
                    icon: const Icon(
                      Icons.favorite_outline,
                      size: 30,
                      color: Colors.white,
                    ),
                  ),
                  IconButton(
                    onPressed: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(builder: (context) {
                          return const Cart();
                        }),
                      );
                    },
                    icon: const Icon(
                      Icons.shopping_bag_outlined,
                      size: 30,
                      color: Colors.white,
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
              body: SingleChildScrollView(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(children: [
                    Container(
                      height: 70,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(15),
                        boxShadow: [
                          BoxShadow(
                            color: const Color.fromARGB(255, 255, 255, 255)
                                .withOpacity(0.2),
                            spreadRadius: 3,
                            blurRadius: 6,
                            offset: const Offset(0, 3),
                          ),
                        ],
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            FutureBuilder<DocumentSnapshot>(
                              future: FirebaseFirestore.instance
                                  .collection('users')
                                  .doc(currentUser.uid)
                                  .get(),
                              builder: (context, snapshot) {
                                if (snapshot.connectionState ==
                                    ConnectionState.waiting) {
                                  return const Text(
                                    "Loading",
                                    style: TextStyle(
                                      fontSize: 25,
                                      fontWeight: FontWeight.w700,
                                    ),
                                  );
                                }
                                if (snapshot.hasError) {
                                  return const Text(
                                    "Error loading name",
                                    style: TextStyle(
                                      fontSize: 25,
                                      fontWeight: FontWeight.w700,
                                    ),
                                  );
                                }
                                final userData = snapshot.data?.data()
                                    as Map<String, dynamic>?;
                                final userName = userData?['name'] ?? 'Guest';
                                return Text(
                                  "Hi $userName",
                                  style: GoogleFonts.poppins(
                                    fontSize: 20,
                                    fontWeight: FontWeight.w500,
                                  ),
                                );
                              },
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        _buildRichButton(
                          context,
                          icon: Icons.card_giftcard,
                          label: "Orders",
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => OrdersScreen(
                                  userId: currentUser.uid,
                                ),
                              ),
                            );
                          },
                        ),
                        _buildRichButton(
                          context,
                          icon: Icons.favorite,
                          label: "Wishlist",
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => FavoritesScreen(),
                              ),
                            );
                          },
                        ),
                      ],
                    ),
                    const SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        _buildRichButton(
                          context,
                          icon: Icons.local_offer_outlined,
                          label: "Coupons",
                          onTap: () => _showCouponBottomSheet(
                              context), // Show the bottom sheet
                        ),
                        _buildRichButton(
                          context,
                          icon: Icons.logout,
                          label: "Logout",
                          onTap: () async {
                            await logout();
                            Navigator.pushAndRemoveUntil(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => LoginPage()),
                              (route) => false,
                            );
                          },
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    Container(
                        height: 360,
                        width: 400,
                        color: Colors.white,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                "Top Picks for You",
                                style: GoogleFonts.poppins(
                                  fontSize: 20,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            Expanded(
                              child: PageView.builder(
                                itemCount: 4, // Number of items in the carousel
                                controller:
                                    PageController(viewportFraction: 0.85),
                                itemBuilder: (context, index) {
                                  // Array of different image URLs
                                  final images = [
                                    "https://nysajewels.co/cdn/shop/files/DSC_0211.jpg?v=1732827212&width=823",
                                    "https://nysajewels.co/cdn/shop/files/F055A76F-1FE0-4B1D-9F03-F1A7CCCAAD92.jpg?v=1732827247&width=823",
                                    "https://nysajewels.co/cdn/shop/files/2B2E6C51-661F-44A6-A4ED-F4A1C2D77699.jpg?v=1732827196&width=823",
                                    "https://nysajewels.co/cdn/shop/files/DSC5683_bd58fe07-2946-4ed1-b1c3-7c1c50b9fe49.jpg?v=1733164483&width=823",
                                  ];

                                  // Array of jewelry names
                                  final names = [
                                    "custom silver ring",
                                    "Silver Swirl Ring",
                                    "Shiny Charm",
                                    "Astra Ring",
                                  ];

                                  // Array of prices
                                  final prices = [
                                    "Rs. 1,216.00",
                                    "Rs. 1,199.00",
                                    "Rs. 999.00",
                                    "Rs. 1,699.00"
                                  ];

                                  return AnimatedContainer(
                                    duration: const Duration(seconds: 5),
                                    curve: Curves.easeInOut,
                                    margin: const EdgeInsets.symmetric(
                                        horizontal: 8),
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(15),
                                      boxShadow: [
                                        BoxShadow(
                                          color: Colors.grey.withOpacity(0.5),
                                          spreadRadius: 2,
                                          blurRadius: 6,
                                          offset: const Offset(0,
                                              3), // Changes the shadow position
                                        ),
                                      ],
                                    ),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        ClipRRect(
                                          borderRadius: const BorderRadius.only(
                                              topLeft: Radius.circular(15),
                                              topRight: Radius.circular(15)),
                                          child: Image.network(
                                            images[index],
                                            height: 180,
                                            width: double.infinity,
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.all(10.0),
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                names[index],
                                                style: GoogleFonts.poppins(
                                                  fontWeight: FontWeight.w600,
                                                  fontSize: 14,
                                                  color: Colors.black,
                                                ),
                                              ),
                                              const SizedBox(height: 8),
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Text(
                                                    prices[index],
                                                    style: GoogleFonts.poppins(
                                                      fontSize: 14,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      color:
                                                          const Color.fromARGB(
                                                              255, 0, 0, 0),
                                                    ),
                                                  ),
                                                  ElevatedButton(
                                                    onPressed: () {
                                                      // Add action to navigate or interact
                                                    },
                                                    style: ElevatedButton
                                                        .styleFrom(
                                                      backgroundColor:
                                                          Colors.black,
                                                      shape:
                                                          RoundedRectangleBorder(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(8),
                                                      ),
                                                    ),
                                                    child: const Text(
                                                      "View",
                                                      style: TextStyle(
                                                        fontSize: 14,
                                                        color: Colors.white,
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
                                  );
                                },
                              ),
                            ),
                          ],
                        ))
                  ])));
        });
  }
}
