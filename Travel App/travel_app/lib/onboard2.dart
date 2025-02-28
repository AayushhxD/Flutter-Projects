import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:travel_app/onboard3.dart';

class Onboard2 extends StatelessWidget {
  const Onboard2({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white, // Set the background color to white
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          // Image section
          Padding(
            padding: const EdgeInsets.all(0),
            child: Image.asset(
              'assets/7f47f9144194941 1.png',
              fit: BoxFit.fill, // Adjust the fit to contain the image properly
              height: 444,
              width: MediaQuery.of(context).size.width,
            ),
          ),
          const SizedBox(height: 20),

          // Title section with rich text
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
                children: <TextSpan>[
                  const TextSpan(text: 'It’s a big world out there go '),
                  TextSpan(
                    text: 'explore',
                    style: GoogleFonts.aclonica(
                      fontSize: 26,
                      fontWeight: FontWeight.w400,
                      color: const Color.fromRGBO(255, 112, 41, 1),
                    ),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(
            height: 30,
          ),

          // Description text
          Padding(
            padding: const EdgeInsets.only(left: 50, right: 46),
            child: Text(
              'To get the best of your adventure you just need to leave and go where you like. We are waiting for you!',
              textAlign: TextAlign.center,
              style: GoogleFonts.poppins(
                fontSize: 16,
                fontWeight: FontWeight.w400,
                color: const Color.fromRGBO(125, 132, 141, 1),
              ),
            ),
          ),
          const Spacer(),

          // Next Button
          Padding(
            padding: const EdgeInsets.only(bottom: 32.0),
            child: SizedBox(
              height: 56,
              width: 335,
              child: ElevatedButton(
                onPressed: () {
                  // Navigate to Onboard3
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) {
                        return const Onboard3();
                      },
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
                  'Next',
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
