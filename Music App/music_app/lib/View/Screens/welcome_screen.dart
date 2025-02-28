import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:music_app/View/Screens/Home/gallery_screen.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({super.key});

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(19, 19, 19, 1),
      body: Stack(
        children: [
          Container(
            height: 700,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage(
                  "lib/Assets/img/welcomeBG.png",
                ),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Container(
            margin: const EdgeInsets.only(top: 450),
            decoration: const BoxDecoration(
                image: DecorationImage(
              image: AssetImage(
                "lib/Assets/img/Ellipse.png",
              ),
              fit: BoxFit.cover,
            )),
          ),
          Container(
              width: double.infinity,
              alignment: Alignment.center,
              margin: const EdgeInsets.only(top: 460),
              child: Column(
                children: [
                  Text(
                    "Dancing between\nThe Shadows\nof rhythm",
                    style: GoogleFonts.inter(
                        color: Colors.white,
                        fontSize: 36,
                        fontWeight: FontWeight.w600),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.of(context).push(
                          MaterialPageRoute(builder: (_) => const Gallery()));
                    },
                    child: Container(
                        width: double.infinity,
                        margin:
                            const EdgeInsets.only(left: 85, right: 85, top: 20),
                        alignment: Alignment.center,
                        padding: const EdgeInsets.symmetric(vertical: 10),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(19),
                          color: const Color.fromRGBO(255, 46, 0, 1),
                        ),
                        child: Text(
                          "Get Started",
                          style: GoogleFonts.inter(
                            fontSize: 20,
                            fontWeight: FontWeight.w600,
                          ),
                        )),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.of(context).push(
                          MaterialPageRoute(builder: (_) => const Gallery()));
                    },
                    child: Container(
                      width: double.infinity,
                      margin:
                          const EdgeInsets.only(left: 85, right: 85, top: 15),
                      alignment: Alignment.center,
                      padding: const EdgeInsets.symmetric(
                        vertical: 10,
                      ),
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: const Color.fromRGBO(255, 46, 0, 1),
                        ),
                        borderRadius: BorderRadius.circular(19),
                      ),
                      child: Text(
                        "Continue With Email",
                        style: GoogleFonts.inter(
                          fontSize: 20,
                          fontWeight: FontWeight.w600,
                          color: const Color.fromRGBO(255, 46, 0, 1),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Text(
                    "By Continuing you agree to terms\nof Services and Privacy policy",
                    textAlign: TextAlign.center,
                    style: GoogleFonts.inter(
                        color: const Color.fromRGBO(203, 200, 200, 0.401),
                        fontWeight: FontWeight.w600),
                  )
                ],
              ))
        ],
      ),
    );
  }
}
