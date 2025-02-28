import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'Signin.dart';
import 'Signup.dart';

class Onboarding extends StatefulWidget {
  const Onboarding({super.key});

  @override
  State<Onboarding> createState() => _OnboardingState();
}

class _OnboardingState extends State<Onboarding> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(255, 255, 255, 1),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 550,
            child: Image.asset(
              "assets/Rectangle 989.png",
              fit: BoxFit.cover,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 30, top: 20, right: 30),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Find The",
                  style: GoogleFonts.imprima(
                    fontWeight: FontWeight.w400,
                    fontSize: 42,
                    color: const Color.fromRGBO(13, 13, 14, 1),
                  ),
                ),
                Text(
                  "Best Collections",
                  style: GoogleFonts.imprima(
                    fontWeight: FontWeight.w400,
                    fontSize: 42,
                    color: const Color.fromRGBO(13, 13, 14, 1),
                  ),
                ),
                Text(
                  "Get your dream item easily with FashionHub and get other intersting offer",
                  style: GoogleFonts.imprima(
                    fontWeight: FontWeight.w400,
                    fontSize: 15,
                    color: const Color.fromRGBO(121, 119, 128, 1),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.of(context)
                            .push(MaterialPageRoute(builder: (context) {
                          return const Signup();
                        }));
                      },
                      child: Container(
                        width: 150,
                        height: 62,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(90),
                          border: Border.all(
                            color: const Color.fromRGBO(13, 13, 14, 1),
                            width: 1,
                          ),
                        ),
                        child: Center(
                          child: Text(
                            "Sign Up",
                            style: GoogleFonts.imprima(
                              fontWeight: FontWeight.w400,
                              fontSize: 18,
                              color: const Color.fromRGBO(13, 13, 14, 1),
                            ),
                          ),
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.of(context)
                            .push(MaterialPageRoute(builder: (context) {
                          return const Signin();
                        }));
                      },
                      child: Container(
                        width: 150,
                        height: 62,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(90),
                            color: const Color.fromRGBO(255, 122, 0, 1)),
                        child: Center(
                          child: Text(
                            "Sign In",
                            style: GoogleFonts.imprima(
                              fontWeight: FontWeight.w400,
                              fontSize: 18,
                              color: const Color.fromRGBO(255, 255, 255, 1),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
