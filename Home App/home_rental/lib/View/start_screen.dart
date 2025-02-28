import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:home_rental/View/home_screen.dart';

class StartScreen extends StatefulWidget {
  const StartScreen({super.key});

  @override
  State<StartScreen> createState() => _StartScreenState();
}

class _StartScreenState extends State<StartScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(mainAxisAlignment: MainAxisAlignment.start, children: [
      Container(
        height: 650,
        width: double.infinity,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/1.png"),
            fit: BoxFit.fill,
          ),
        ),
      ),
      Container(
        padding: const EdgeInsets.only(
          top: 25,
          bottom: 8,
          left: 68,
          right: 68,
        ),
        child: Text(
          "Let's Find Your Paradise",
          style: GoogleFonts.poppins(
              fontWeight: FontWeight.w600,
              fontSize: 22,
              color: const Color.fromRGBO(0, 0, 0, 1)),
        ),
      ),
      Container(
        padding: const EdgeInsets.only(top: 8, bottom: 15, left: 95, right: 80),
        child: Text(
          "Find your prefect dream space with just few click's",
          style: GoogleFonts.poppins(
              fontWeight: FontWeight.w400,
              fontSize: 15,
              color: const Color.fromRGBO(101, 101, 101, 1)),
          textAlign: TextAlign.center,
        ),
      ),
      ElevatedButton(
        style: ElevatedButton.styleFrom(
            fixedSize: const Size(180, 45),
            backgroundColor: const Color.fromRGBO(32, 169, 247, 1)),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const HomeScreen(),
            ),
          );
        },
        child: Text(
          "Get Started",
          style: GoogleFonts.poppins(
              fontWeight: FontWeight.w400,
              fontSize: 22,
              color: const Color.fromRGBO(255, 255, 255, 1)),
        ),
      ),
      const Spacer(),
    ]));
  }
}
