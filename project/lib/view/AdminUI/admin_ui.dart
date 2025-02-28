import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:project/view/AdminUI/add_item.dart';
import 'package:project/view/AdminUI/admin_contact.dart';
import 'package:project/view/AdminUI/delete_items.dart';
import 'package:project/view/AdminUI/orders.dart';
import 'package:project/view/login.dart';

class AdminScreen extends StatefulWidget {
  const AdminScreen({super.key});

  @override
  State<AdminScreen> createState() => _AdminScreenState();
}

class _AdminScreenState extends State<AdminScreen> {
  // Fetch the total count of products
  Future<int> getProductCount() async {
    try {
      final querySnapshot =
          await FirebaseFirestore.instance.collection('products').get();
      return querySnapshot.docs.length;
    } catch (e) {
      print("Error counting products: $e");
      return 0;
    }
  }

  // Fetch the total count of users
  Future<int> getUserCount() async {
    try {
      final querySnapshot =
          await FirebaseFirestore.instance.collection('users').get();
      return querySnapshot.docs.length;
    } catch (e) {
      print("Error counting users: $e");
      return 0;
    }
  }

  // Fetch the total count of orders
  Future<int> getOrderCount() async {
    try {
      final querySnapshot =
          await FirebaseFirestore.instance.collection('orders').get();
      return querySnapshot.docs.length;
    } catch (e) {
      print("Error counting orders: $e");
      return 0;
    }
  }

  // Combine all counts in a single Future
  Future<Map<String, int>> getDashboardData() async {
    try {
      final productCount = await getProductCount();
      final userCount = await getUserCount();
      final orderCount = await getOrderCount();
      return {
        'products': productCount,
        'users': userCount,
        'orders': orderCount,
      };
    } catch (e) {
      print("Error fetching dashboard data: $e");
      return {'products': 0, 'users': 0, 'orders': 0};
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
        title: Text(
          "Admin ",
          style: GoogleFonts.quicksand(
            fontSize: 27,
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),
      drawer: Drawer(
        // shadowColor: Colors.amber,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              /// Header of the Drawer
              Material(
                child: InkWell(
                  onTap: () {
                    /// Close Navigation drawer before
                    // Navigator.pop(context);
                    // Navigator.push(
                    //   context,
                    //   MaterialPageRoute(builder: (context) => home_Page()),
                    // );
                  },
                  child: Container(
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
                    padding: EdgeInsets.only(
                        top: MediaQuery.of(context).padding.top, bottom: 24),
                    child: const Column(
                      children: [
                        CircleAvatar(
                          radius: 52,
                          backgroundImage: NetworkImage(
                              'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTF6xmrryKWOpEBFw96uOo5sOW0JGkwV1mjkw&s'),
                        ),
                        SizedBox(
                          height: 12,
                        ),
                        Text(
                          'Raj',
                          style: TextStyle(fontSize: 28, color: Colors.white),
                        ),
                      ],
                    ),
                  ),
                ),
              ),

              /// Header Menu items

              Column(
                children: [
                  ListTile(
                    leading: const Icon(Icons.add_shopping_cart),
                    title: const Text("Add Items"),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const AddItem()),
                      );
                    },
                  ),

                  ListTile(
                    leading: const Icon(Icons.remove_circle),
                    title: const Text("Delete Items"),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => DeleteProductPage(),
                        ),
                      );
                    },
                  ),
                  ListTile(
                    leading: const Icon(Icons.shopping_cart),
                    title: const Text("Orders"),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const AdminOrdersPage()),
                      );
                    },
                  ),
                  ListTile(
                    leading: const Icon(Icons.report),
                    title: const Text("Reports"),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const AdminReport()),
                      );
                    },
                  ),

                  //const Spacer(),
                  ListTile(
                    leading: const Icon(Icons.logout),
                    title: const Text("Logout"),
                    onTap: () async {
                      await logout();
                      Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(builder: (context) => LoginPage()),
                        (route) => false, // This removes all previous routes
                      );
                    },
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
      body: Stack(
        children: [
          // Background Image with Faded Effect
          Opacity(
            opacity: 0.5, // Adjust this value for the fade effect
            child: Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage(
                      "https://static.toiimg.com/thumb/97720811/97720811.jpg?height=746&width=420&resizemode=76&imgsize=66680"),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          FutureBuilder<Map<String, int>>(
            future: getDashboardData(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(child: CircularProgressIndicator());
              }
              if (snapshot.hasError) {
                return Center(
                  child: Text("Error: ${snapshot.error}"),
                );
              }
              if (snapshot.hasData) {
                final data = snapshot.data!;
                return Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      _buildDashboardTile(
                          title: "Total Products", count: data['products']!),
                      const SizedBox(height: 20),
                      _buildDashboardTile(
                          title: "Total Customers", count: data['users']!),
                      const SizedBox(height: 20),
                      _buildDashboardTile(
                          title: "Total Orders", count: data['orders']!),
                    ],
                  ),
                );
              }
              return const Center(child: Text("No data available"));
            },
          ),
        ],
      ),
    );
  }

  Widget _buildDashboardTile({required String title, required int count}) {
    return Container(
      height: 100,
      width: 250,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.3),
            spreadRadius: 3,
            blurRadius: 5,
            offset: Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "$title",
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Colors.black54,
            ),
          ),
          const SizedBox(height: 10),
          Text(
            "$count",
            style: const TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.bold,
              color: Colors.green,
            ),
          ),
        ],
      ),
    );
  }
}
