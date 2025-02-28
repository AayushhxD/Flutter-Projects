import 'package:fitness_app/bottombar.dart'; // Import BottomBar
import 'package:fitness_app/handtraining.dart'; // Import HandTrainingScreen
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'login.dart'; // Import LoginScreen

class Onboarding extends StatefulWidget {
  const Onboarding({super.key});

  @override
  State<Onboarding> createState() => _OnboardingState();
}

class _OnboardingState extends State<Onboarding> {
  final PageController _controller = PageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: _controller,
        children: [
          Stack(
            children: [
              Container(
                height: double.infinity,
                width: double.infinity,
              ),
              Image.asset(
                "assets/Image.png",
                height: 565,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
              Positioned(
                top: 372,
                child: Container(
                  height: 193,
                  width: MediaQuery.of(context).size.width,
                  decoration: const BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        Color.fromRGBO(255, 255, 255, 0),
                        Color.fromRGBO(255, 255, 255, 1),
                      ],
                    ),
                  ),
                ),
              ),
              Positioned(
                top: 612,
                left: 80,
                child: Container(
                  height: 14,
                  width: 71,
                  color: const Color.fromRGBO(187, 242, 70, 1),
                ),
              ),
              Positioned(
                top: 574,
                left: 100,
                child: Text(
                  'Wherever You Are',
                  style: GoogleFonts.lato(
                    fontSize: 24,
                    fontWeight: FontWeight.w800,
                  ),
                ),
              ),
              Positioned(
                top: 596,
                left: 80,
                child: Text(
                  'Health Is Number One',
                  style: GoogleFonts.lato(
                    fontSize: 24,
                    fontWeight: FontWeight.w800,
                  ),
                ),
              ),
              Positioned(
                top: 656,
                left: 80,
                child: Text(
                  'There is no instant way to a healthy life',
                  style: GoogleFonts.lato(
                    fontSize: 15,
                    fontWeight: FontWeight.w400,
                    color: const Color.fromRGBO(25, 33, 38, 0.5),
                  ),
                ),
              ),
              Positioned(
                top: 713,
                left: MediaQuery.of(context).size.width / 2 -
                    30, // Centering the SmoothPageIndicator
                child: SmoothPageIndicator(
                  controller: _controller,
                  count: 3,
                ),
              ),
              Positioned(
                top: 764,
                left: 40,
                child: SizedBox(
                  height: 56,
                  width: 350,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color.fromRGBO(25, 33, 38, 1),
                    ),
                    onPressed: () {
                      Navigator.of(context)
                          .push(MaterialPageRoute(builder: (context) {
                        return const LoginScreen(); // Navigate to Login Screen
                      }));
                    },
                    child: Text(
                      "Get Started",
                      style: GoogleFonts.lato(
                        fontSize: 16,
                        fontWeight: FontWeight.w700,
                        color: const Color.fromRGBO(255, 255, 255, 1),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
          // New Screen for Hand Training
          Stack(
            children: [
              Container(
                height: double.infinity,
                width: double.infinity,
              ),
              Image.asset(
                "assets/HandTrainingImage.png",
                height: 565,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
              Positioned(
                top: 372,
                child: Container(
                  height: 193,
                  width: MediaQuery.of(context).size.width,
                  decoration: const BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        Color.fromRGBO(255, 255, 255, 0),
                        Color.fromRGBO(255, 255, 255, 1),
                      ],
                    ),
                  ),
                ),
              ),
              Positioned(
                top: 612,
                left: 80,
                child: Container(
                  height: 14,
                  width: 71,
                  color: const Color.fromRGBO(187, 242, 70, 1),
                ),
              ),
              Positioned(
                top: 574,
                left: 100,
                child: Text(
                  'Hand Training',
                  style: GoogleFonts.lato(
                    fontSize: 24,
                    fontWeight: FontWeight.w800,
                  ),
                ),
              ),
              Positioned(
                top: 596,
                left: 80,
                child: Text(
                  'Train Your Hands',
                  style: GoogleFonts.lato(
                    fontSize: 24,
                    fontWeight: FontWeight.w800,
                  ),
                ),
              ),
              Positioned(
                top: 656,
                left: 80,
                child: Text(
                  'Effective exercises for hand strength',
                  style: GoogleFonts.lato(
                    fontSize: 15,
                    fontWeight: FontWeight.w400,
                    color: const Color.fromRGBO(25, 33, 38, 0.5),
                  ),
                ),
              ),
              Positioned(
                top: 713,
                left: MediaQuery.of(context).size.width / 2 -
                    30, // Centering the SmoothPageIndicator
                child: SmoothPageIndicator(
                  controller: _controller,
                  count: 3,
                ),
              ),
              Positioned(
                top: 764,
                left: 40,
                child: SizedBox(
                  height: 56,
                  width: 350,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color.fromRGBO(25, 33, 38, 1),
                    ),
                    onPressed: () {
                      Navigator.of(context)
                          .push(MaterialPageRoute(builder: (context) {
                        return const HandTrainingScreen(); // Navigate to Hand Training Screen
                      }));
                    },
                    child: Text(
                      "Start Training",
                      style: GoogleFonts.lato(
                        fontSize: 16,
                        fontWeight: FontWeight.w700,
                        color: const Color.fromRGBO(255, 255, 255, 1),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
