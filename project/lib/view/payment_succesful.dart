import 'package:flutter/material.dart';
import 'package:project/gnav_bar.dart/nav_bar.dart';
import 'package:project/view/categories.dart';
import 'package:project/view/home_Page_UI.dart';

class PaymentSuccesful extends StatelessWidget {
  const PaymentSuccesful({super.key});

  void navigate(BuildContext context) {
    Future.delayed(const Duration(seconds: 3), () async {
      Navigator.of(context).pushAndRemoveUntil(
          MaterialPageRoute(builder: (context) => const NavBar()),
          (Route route) => true);
    });
  }

  @override
  Widget build(BuildContext context) {
    navigate(context);

    return Scaffold(
      body: Center(
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
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Add GIF
                Image.asset(
                  'assets/success.gif', // Replace with your GIF path
                  height: 150,
                  width: 150,
                ),
                const SizedBox(height: 20),
                const Text(
                  'Payment Successful!',
                  style: TextStyle(
                    // color: Color.fromARGB(255, 4, 139, 8),
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
