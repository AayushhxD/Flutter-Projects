import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:travel_app/onboard2.dart';

class Onboard1 extends StatelessWidget {
  const Onboard1({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          // Image section with proper fitting
          Padding(
            padding: const EdgeInsets.all(0),
            child: Image.asset(
              'assets/afbea499038243 1.png',
              fit: BoxFit.fill, // Adjust the fit to contain the image properly
              height: 444,
              width: MediaQuery.of(context).size.width, // Set a dynamic width
            ),
          ),
          const SizedBox(height: 20),

          Padding(
            padding: const EdgeInsets.only(left: 33, right: 33),
            child: RichText(
              textAlign: TextAlign.center,
              text: TextSpan(
                style: GoogleFonts.aclonica(
                  fontSize: 26,
                  fontWeight: FontWeight.w400,
                  color: const Color.fromRGBO(27, 30, 40, 1),
                ),
                children: <InlineSpan>[
                  const TextSpan(text: 'Life is short and the world is '),
                  WidgetSpan(
                    child: Stack(alignment: Alignment.bottomCenter, children: [
                      Text(
                        'wide',
                        style: GoogleFonts.aclonica(
                          fontSize: 26,
                          fontWeight: FontWeight.w400,
                          color: const Color.fromRGBO(255, 112, 41, 1),
                        ),
                      ),
                    ]),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(
            height: 30,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 50, right: 46),
            child: Text(
              'At Friends tours and travel, we customize reliable and trustworthy educational tours to destinations',
              textAlign: TextAlign.center,
              style: GoogleFonts.poppins(
                fontSize: 16,
                fontWeight: FontWeight.w400,
                color: const Color.fromRGBO(125, 132, 141, 1),
              ),
            ),
          ),
          const Spacer(),
          Padding(
            padding: const EdgeInsets.only(bottom: 32.0),
            child: SizedBox(
              height: 56,
              width: 335,
              child: ElevatedButton(
                onPressed: () {
                  // Navigate to Onboard2
                  Navigator.of(context).pushReplacement(
                    MaterialPageRoute(
                      builder: (context) =>
                          const Onboard2(), // Navigate to Onboard2
                    ),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color.fromRGBO(13, 110, 253, 1),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 50, vertical: 20),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16.0),
                  ),
                ),
                child: Text(
                  'Get Started',
                  style: GoogleFonts.poppins(
                    fontSize: 15,
                    fontWeight: FontWeight.w600,
                    color: const Color.fromRGBO(255, 255, 255, 1),
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
