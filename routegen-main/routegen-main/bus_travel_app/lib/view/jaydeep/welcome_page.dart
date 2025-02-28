import 'package:routegen/view/jaydeep/loginpage.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:routegen/view/jaydeep/sign_up.dart';

class WelcomePage extends StatefulWidget {
  const WelcomePage({super.key});

  @override
  State<WelcomePage> createState() => _LandingPageState();
}

class _LandingPageState extends State<WelcomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(255, 206, 72, 1),
      body: Stack(
        children: [
          SizedBox(
            width: 700,
            height: 670,
            child: Image.asset(
              "asset/India.png",
              color: const Color.fromRGBO(255, 230, 162, 1),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 420.0),
            child: SizedBox(
              width: double.infinity,
              child: Container(
                decoration: const BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: Color.fromRGBO(255, 206, 72, 0.8),
                      blurRadius: 190.0,
                      spreadRadius: 90.0,
                      offset: Offset(0, 30),
                    ),
                  ],
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 50.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Hero(
                            tag: 'app_logo',
                            child: Image.asset(
                              "asset/RG_logo.png",
                              height: 60,
                              width: 60,
                            ),
                          ),
                          const SizedBox(width: 10.0),
                          Hero(
                            tag: 'route_gen_text',
                            child:Material(
                              color: Colors.transparent,
                            child: Text(
                              "RouteGen",
                              style: GoogleFonts.raleway(
                                fontSize: 32,
                                fontWeight: FontWeight.w700,
                                color: Colors.black,
                                letterSpacing: 1.5,
                              ),
                            ),
                          ),
                          ),
                        ],
                      ),
                      // Rest of the Welcome page content remains the same
                      const SizedBox(height: 10),
                      Text(
                        "Plan Your\nNext Trip !",
                        style: GoogleFonts.raleway(
                          fontSize: 34,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      const SizedBox(height: 15),
                      Text(
                        "No matter anywhere in Maharashtra you are travelling, we will find the best Routes for you",
                        style: GoogleFonts.raleway(
                          fontWeight: FontWeight.w600,
                          fontSize: 20,
                        ),
                      ),
                      const SizedBox(height: 105.0),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SizedBox(
                            width: double.infinity,
                            height: 60,
                            child: ElevatedButton(
                              onPressed: () {
                                Navigator.of(context)
                                    .pushReplacement(MaterialPageRoute(
                                  builder: (context) {
                                    return const Loginpage();
                                  },
                                ));
                              },
                              style: const ButtonStyle(
                                backgroundColor:
                                    WidgetStatePropertyAll(Colors.black),
                              ),
                              child: Text(
                                "Login",
                                style: GoogleFonts.raleway(
                                  fontSize: 22.0,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(height: 10.0),
                          SizedBox(
                            width: double.infinity,
                            height: 60,
                            child: ElevatedButton(
                              onPressed: () {
                                Navigator.of(context)
                                    .pushReplacement(MaterialPageRoute(
                                  builder: (context) {
                                    return const SignUpPage();
                                  },
                                ));
                              },
                              style: const ButtonStyle(
                                backgroundColor: WidgetStatePropertyAll(
                                    Color.fromRGBO(255, 136, 17, 1)),
                              ),
                              child: Text(
                                "Sign Up",
                                style: GoogleFonts.raleway(
                                  fontSize: 22.0,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
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
