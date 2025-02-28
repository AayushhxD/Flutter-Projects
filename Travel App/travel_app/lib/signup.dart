import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:travel_app/signin.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        // Added Scrollable Widget
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 100, horizontal: 36),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  "Sign up now",
                  style: GoogleFonts.poppins(
                    fontSize: 26,
                    fontWeight: FontWeight.w600,
                    color: const Color.fromRGBO(27, 30, 40, 1),
                  ),
                ),
                const SizedBox(height: 16), // Add space between text
                Text(
                  "Please fill the details and create account",
                  style: GoogleFonts.poppins(
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                    color: const Color.fromRGBO(125, 131, 141, 1),
                  ),
                ),
                const SizedBox(
                    height: 32), // Add space between text and text fields
                TextField(
                  decoration: InputDecoration(
                    hintText: "Leonardo Smith",
                    hintStyle: GoogleFonts.poppins(
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                      color: const Color.fromRGBO(27, 30, 40, 1),
                    ),
                    border: InputBorder.none,
                    filled: true,
                    fillColor: const Color.fromRGBO(247, 247, 249, 1),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(14),
                    ),
                  ),
                ),
                const SizedBox(height: 16), // Space between text fields
                TextField(
                  decoration: InputDecoration(
                    hintText: "www.uihut@gmail.com",
                    hintStyle: GoogleFonts.poppins(
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                      color: const Color.fromRGBO(27, 30, 40, 1),
                    ),
                    border: InputBorder.none,
                    filled: true,
                    fillColor: const Color.fromRGBO(247, 247, 249, 1),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(14),
                    ),
                  ),
                ),
                const SizedBox(height: 16), // Space between text fields
                TextField(
                  decoration: InputDecoration(
                    hintText: "Password",
                    suffixIcon: Icon(Icons.remove_red_eye),
                    border: InputBorder.none,
                    filled: true,
                    fillColor: const Color.fromRGBO(247, 247, 249, 1),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(14),
                    ),
                  ),
                ),
                const SizedBox(height: 8), // Space for password note
                Text(
                  "Password must be 8 characters",
                  style: GoogleFonts.poppins(
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                    color: const Color.fromRGBO(125, 132, 141, 1),
                  ),
                ),
                const SizedBox(height: 32), // Space above button
                Container(
                  height: 65,
                  width: 335,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) {
                            return const SignInPage();
                          },
                        ),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color.fromRGBO(13, 110, 253, 1),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30.0),
                      ),
                    ),
                    child: Text(
                      'Sign Up',
                      style: GoogleFonts.poppins(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: Color.fromRGBO(255, 255, 255, 1),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 16), // Space between button and text
                Text(
                  'Or connect ',
                  style: GoogleFonts.poppins(
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                    color: Color.fromRGBO(27, 30, 40, 1),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset("assets/Group 332.png"),
                    SizedBox(width: 30),
                    Image.asset("assets/Group 334.png"),
                    SizedBox(width: 30),
                    Image.asset("assets/Group 333.png"),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
