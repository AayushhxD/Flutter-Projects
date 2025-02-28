import 'package:routegen/view/jaydeep/admin_side/admin_screen2.dart';
import 'package:routegen/view/jaydeep/admin_side/admin_screen3.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';



class AdminScreen1 extends StatefulWidget {
  const AdminScreen1({super.key});

  @override
  State<AdminScreen1> createState() => _AdminScreen1State();
}

class _AdminScreen1State extends State<AdminScreen1> {
   
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Background Image with a Color Overlay for better contrast
         
          // Logo Image
          Positioned(
            top: 70,
            left: (MediaQuery.of(context).size.width / 2) - 40,
            child: Image.asset(
              "asset/RG_logo.png",
              height: 80,
              width: 80,
            ),
          ),
          
          // Title Text
          Positioned(
            top: 150,
            left: (MediaQuery.of(context).size.width / 2) - 80,
            child: Text(
              "RouteGen",
              style: GoogleFonts.raleway(
                fontSize: 32,
                fontWeight: FontWeight.w600,
                color: Colors.black,
              ),
            ),
          ),
          
          // Welcome Text
          Positioned(
            top: 300,
            left: (MediaQuery.of(context).size.width / 2) - 130,
            child: Text(
              "Welcome Admin",
              style: GoogleFonts.raleway(
                fontSize: 32,
                fontWeight: FontWeight.w600,
                color: Colors.black,
              ),
            ),
          ),
          
          // Create Profile Button
          Positioned(
            top: 400,
            left: (MediaQuery.of(context).size.width / 2) - 110,
            child: SizedBox(
              height: 55,
              child: ElevatedButton(
                style: const ButtonStyle(
                  backgroundColor: WidgetStatePropertyAll(
                    Color.fromRGBO(255, 136, 17, 1),
                  ),
                ),
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => const AdminScreen2(),));
                },
                child: Text(
                  "Create Profile",
                  style: GoogleFonts.raleway(
                    fontSize: 25,
                    fontWeight: FontWeight.w600,
                    color: Colors.black,
                  ),
                ),
              ),
            ),
          ),
          
          // View Employee Button
          Positioned(
            top: 480,
            left: (MediaQuery.of(context).size.width / 2) - 120,
            child: SizedBox(
              height: 55,
              child: ElevatedButton(
                style:const ButtonStyle(
                  backgroundColor: WidgetStatePropertyAll(
                    Color.fromRGBO(255, 136, 17, 1),
                  ),
                ),
                onPressed: () {
                   Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => const AdminScreen3(),));
                },
                child: Text(
                  "View Employee",
                  style: GoogleFonts.raleway(
                    fontSize: 25,
                    fontWeight: FontWeight.w600,
                    color: Colors.black,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
