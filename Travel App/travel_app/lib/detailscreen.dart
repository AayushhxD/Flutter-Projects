import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:travel_app/view.dart';
import 'package:travel_app/home.dart';

class DetailsScreen extends StatefulWidget {
  const DetailsScreen({super.key});

  @override
  State<DetailsScreen> createState() => _Details_ScreenState();
}

class _Details_ScreenState extends State<DetailsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Image.asset(
            "assets/49024100a89c01bb1b2bacc523162e75.jpeg",
            height: double.infinity,
            width: double.infinity,
            fit: BoxFit.cover,
          ),
          Padding(
            padding: const EdgeInsets.only(top: 56, left: 20, right: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Opacity(
                  opacity: 0.16,
                  child: GestureDetector(
                    onTap: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) {
                            return const Home_Page();
                          },
                        ),
                      );
                    },
                    child: Container(
                      height: 44,
                      width: 44,
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        color: Color.fromRGBO(27, 30, 40, 1),
                      ),
                      child: const Icon(
                        Icons.arrow_back_ios_new,
                        size: 20,
                        color: Color.fromRGBO(255, 255, 255, 1),
                      ),
                    ),
                  ),
                ),
                Text(
                  "Details",
                  style: GoogleFonts.poppins(
                    fontWeight: FontWeight.w500,
                    fontSize: 18,
                    color: const Color.fromRGBO(255, 255, 255, 1),
                  ),
                ),
                Opacity(
                  opacity: 0.16,
                  child: Container(
                    height: 44,
                    width: 44,
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: Color.fromRGBO(27, 30, 40, 1),
                    ),
                    child: const Icon(
                      Icons.bookmark_outline_rounded,
                      size: 24,
                      color: Color.fromRGBO(255, 255, 255, 1),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            top: 355,
            bottom: 0,
            left: 0,
            right: 0,
            child: SingleChildScrollView(
              child: Container(
                width: double.infinity,
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.elliptical(1000, 200),
                    topRight: Radius.elliptical(1000, 200),
                  ),
                  color: Color.fromRGBO(255, 255, 255, 1),
                ),
                child: Padding(
                  padding:
                      const EdgeInsets.only(left: 20, right: 20, bottom: 50),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 20),
                        child: Align(
                          alignment: Alignment.topCenter,
                          child: Opacity(
                            opacity: 0.20,
                            child: Container(
                              height: 5,
                              width: 36,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(16),
                                color: const Color.fromRGBO(125, 132, 141, 1),
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 20),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Niladri Reservoir",
                                style: GoogleFonts.poppins(
                                  fontWeight: FontWeight.w600,
                                  fontSize: 24,
                                  color: const Color.fromRGBO(27, 30, 40, 1),
                                ),
                              ),
                              SizedBox(height: 4),
                              Text(
                                "Tekergat, Sunamgnj",
                                style: GoogleFonts.poppins(
                                  fontWeight: FontWeight.w400,
                                  fontSize: 15,
                                  color: const Color.fromRGBO(125, 132, 141, 1),
                                ),
                              ),
                            ],
                          ),
                          Image.asset("assets/Ellipse 25.png"),
                        ],
                      ),
                      SizedBox(height: 16),
                      Row(
                        children: [
                          const Icon(
                            Icons.location_on_outlined,
                            size: 14.33,
                            color: Color.fromRGBO(125, 132, 141, 1),
                          ),
                          SizedBox(width: 4),
                          Text(
                            "Tekergat",
                            style: GoogleFonts.poppins(
                              fontWeight: FontWeight.w400,
                              fontSize: 15,
                              color: const Color.fromRGBO(125, 132, 141, 1),
                            ),
                          ),
                          Spacer(),
                          const Icon(
                            Icons.star,
                            size: 11.64,
                            color: Color.fromRGBO(255, 211, 54, 1),
                          ),
                          SizedBox(width: 4),
                          Text(
                            "4.7",
                            style: GoogleFonts.poppins(
                              fontSize: 16,
                              fontWeight: FontWeight.w400,
                              color: const Color.fromRGBO(27, 30, 40, 1),
                            ),
                          ),
                          SizedBox(width: 4),
                          Text(
                            "(2498)",
                            style: GoogleFonts.poppins(
                              fontWeight: FontWeight.w400,
                              fontSize: 15,
                              color: const Color.fromRGBO(125, 132, 141, 1),
                            ),
                          ),
                          Spacer(),
                          Text(
                            "\$59/",
                            style: GoogleFonts.poppins(
                              fontSize: 16,
                              fontWeight: FontWeight.w400,
                              color: const Color.fromRGBO(13, 110, 253, 1),
                            ),
                          ),
                          SizedBox(width: 4),
                          Text(
                            "Person",
                            style: GoogleFonts.poppins(
                              fontWeight: FontWeight.w400,
                              fontSize: 15,
                              color: const Color.fromRGBO(125, 132, 141, 1),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 16),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                              child: Image.asset("assets/Rectangle 822.png")),
                          SizedBox(width: 8),
                          Expanded(
                              child: Image.asset("assets/Rectangle 823.png")),
                          SizedBox(width: 8),
                          Expanded(
                              child: Image.asset("assets/Rectangle 824.png")),
                          SizedBox(width: 8),
                          Expanded(
                              child: Image.asset("assets/Rectangle 825.png")),
                          SizedBox(width: 8),
                          Expanded(
                              child: Image.asset("assets/Rectangle 826.png")),
                        ],
                      ),
                      SizedBox(height: 20),
                      Text(
                        "About Destination",
                        style: GoogleFonts.poppins(
                          fontWeight: FontWeight.w500,
                          fontSize: 20,
                          color: const Color.fromRGBO(27, 30, 40, 1),
                        ),
                      ),
                      SizedBox(height: 14),
                      RichText(
                        text: TextSpan(
                          style: GoogleFonts.poppins(
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                            color: const Color.fromRGBO(125, 132, 141, 1),
                          ),
                          children: <InlineSpan>[
                            TextSpan(
                              text:
                                  'You will get a complete travel package on the beaches. Packages in the form of airline tickets, recommended Hotel rooms, Have you ever been on holiday to the Greek ETC...  ',
                            ),
                            WidgetSpan(
                              child: GestureDetector(
                                onTap: () {
                                  // Implement "Read More" action
                                },
                                child: Stack(
                                  alignment: Alignment.bottomCenter,
                                  children: [
                                    Text(
                                      'Read More',
                                      style: GoogleFonts.poppins(
                                        fontSize: 13,
                                        fontWeight: FontWeight.w400,
                                        color: const Color.fromRGBO(
                                            255, 112, 41, 1),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 50),
                      Align(
                        alignment: Alignment.center,
                        child: Container(
                          height: 65,
                          width: 335,
                          child: ElevatedButton(
                            onPressed: () {
                              Navigator.of(context).push(
                                MaterialPageRoute(
                                  builder: (context) {
                                    return const View_Screen();
                                  },
                                ),
                              );
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor:
                                  const Color.fromRGBO(13, 110, 253, 1),
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 50, vertical: 20),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(30.0),
                              ),
                            ),
                            child: Text(
                              'Book Now',
                              style: GoogleFonts.poppins(
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                                color: const Color.fromRGBO(255, 255, 255, 1),
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 20),
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
