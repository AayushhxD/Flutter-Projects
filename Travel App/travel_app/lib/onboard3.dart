import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:travel_app/signin.dart';

class Onboard3 extends StatelessWidget {
  const Onboard3({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white, // Set background color to white
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          // Image section at the top
          Padding(
            padding: const EdgeInsets.only(top: 0), // Adds space from the top
            child: Image.asset(
              'assets/252a6624a42c117099537c7a1320256d 1.png',
              fit: BoxFit.fill, // Adjust the fit to contain the image properly
              height: 444,
              width: MediaQuery.of(context).size.width,
            ),
          ),

          const SizedBox(height: 20),

          // Title section with rich text
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 33),
            child: RichText(
              textAlign: TextAlign.center,
              text: TextSpan(
                style: GoogleFonts.aclonica(
                  fontSize: 26,
                  fontWeight: FontWeight.w400,
                  color: const Color.fromRGBO(27, 30, 40, 1),
                ),
                children: <TextSpan>[
                  const TextSpan(text: 'People don’t take trips, trips take '),
                  TextSpan(
                    text: 'people',
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

          const SizedBox(height: 30),

          // Description text
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 50),
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

          // Next button
          Padding(
            padding: const EdgeInsets.only(bottom: 32.0),
            child: SizedBox(
              height: 56,
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
