import 'package:bicycle_app/cart.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Description extends StatefulWidget {
  const Description({super.key});

  @override
  State<Description> createState() => _DescriptionState();
}

class _DescriptionState extends State<Description> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.center,
                end: Alignment.bottomRight,
                stops: [0.1, 0.0],
                colors: [
                  Color.fromRGBO(36, 44, 59, 1),
                  Color.fromRGBO(75, 76, 237, 1),
                ],
              ),
            ),
          ),
          Positioned(
            top: 400,
            child: Transform.rotate(
              angle: 90 * 3.1415926535897931 / 180,
              child: GestureDetector(
                onTap: () {
                  // Add your onTap functionality here
                  print("EXTREME text tapped");
                },
                child: Text(
                  "EXTREME",
                  style: GoogleFonts.allertaStencil(
                    fontSize: 150,
                    fontWeight: FontWeight.w400,
                    color: const Color.fromRGBO(255, 255, 255, 0.2),
                  ),
                ),
              ),
            ),
          ),
          Positioned(
            top: 170,
            left: -15,
            child: Center(
              child: GestureDetector(
                onTap: () {
                  // Add your onTap functionality here
                  print("Image tapped");
                },
                child: Image.asset(
                  "assets/pngwing (3).png",
                  height: 391,
                  width: 425,
                ),
              ),
            ),
          ),
          Positioned(
            top: 550,
            left: 197,
            child: GestureDetector(
              onTap: () {
                // Add your onTap functionality here
                print("Dots row tapped");
              },
              child: Row(
                children: [
                  Container(
                    height: 10,
                    width: 10,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(100),
                      color: const Color.fromRGBO(0, 0, 0, 1),
                    ),
                  ),
                  const SizedBox(width: 5),
                  Container(
                    height: 10,
                    width: 10,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(100),
                      color: const Color.fromRGBO(255, 255, 255, 1),
                    ),
                  ),
                  const SizedBox(width: 5),
                  Container(
                    height: 10,
                    width: 10,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(100),
                      color: const Color.fromRGBO(255, 255, 255, 1),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            top: 60,
            left: 17,
            child: Row(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    GestureDetector(
                      onTap: () {
                        // Add your onTap functionality here
                        print("GT BIKE text tapped");
                      },
                      child: Text(
                        "GT BIKE",
                        style: GoogleFonts.poppins(
                          fontSize: 30,
                          fontWeight: FontWeight.w500,
                          color: const Color.fromRGBO(255, 255, 255, 1),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  width: 220,
                ),
                GestureDetector(
                  onTap: () {
                    // Add your onTap functionality here
                    print("Search icon tapped");
                  },
                  child: Container(
                    height: 50,
                    width: 50,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      gradient: const LinearGradient(
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                        colors: [
                          Color.fromRGBO(55, 182, 233, 1),
                          Color.fromRGBO(72, 92, 236, 1),
                          Color.fromRGBO(75, 76, 237, 1),
                        ],
                      ),
                    ),
                    child: const Icon(
                      Icons.search,
                      size: 30,
                      color: Color.fromRGBO(255, 255, 255, 1),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            top: 600,
            child: GestureDetector(
              onTap: () {
                // Add your onTap functionality here
                print("Description/Specification container tapped");
              },
              child: Container(
                height: 354,
                width: MediaQuery.of(context).size.width,
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      Color.fromRGBO(53, 63, 84, 0.8),
                      Color.fromRGBO(34, 40, 52, 0.8),
                    ],
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.only(left: 20, right: 20),
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            GestureDetector(
                              onTap: () {
                                // Add your onTap functionality here
                                print("Description button tapped");
                              },
                              child: Container(
                                height: 35,
                                width: 106,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  border: Border.all(
                                    color: const Color.fromRGBO(
                                        255, 255, 255, 0.5),
                                  ),
                                  color: const Color.fromRGBO(36, 44, 59, 1),
                                ),
                                child: Center(
                                  child: Text(
                                    "Description",
                                    style: GoogleFonts.poppins(
                                      fontSize: 15,
                                      fontWeight: FontWeight.w500,
                                      color: const Color.fromRGBO(
                                          255, 255, 255, 1),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            GestureDetector(
                              onTap: () {
                                // Add your onTap functionality here
                                print("Specification button tapped");
                              },
                              child: Container(
                                height: 35,
                                width: 106,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  border: Border.all(
                                    color: const Color.fromRGBO(
                                        255, 255, 255, 0.5),
                                  ),
                                  color: const Color.fromRGBO(72, 92, 236, 1),
                                ),
                                child: Center(
                                  child: Text(
                                    "Specification",
                                    style: GoogleFonts.poppins(
                                      fontSize: 15,
                                      fontWeight: FontWeight.w500,
                                      color: const Color.fromRGBO(
                                          255, 255, 255, 1),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Expanded(
                        child: Text(
                          "Lorem ipsum dolor sit amet. Ab tenetur molestias vel rerum cupiditate qui dolores consequatur et asperiores sunt ea magnam dolorem qui consectetur omnis. Ut error voluptas qui tempora provident aut necessitatibus voluptas rem eveniet nulla ut accusantium dignissimos aut facilis perspiciatis a natus quia.",
                          style: GoogleFonts.poppins(
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                            color: const Color.fromRGBO(255, 255, 255, 1),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          Positioned(
            top: 818,
            child: Container(
              height: 116,
              width: 449,
              decoration: const BoxDecoration(
                color: Color.fromRGBO(36, 44, 59, 1),
                boxShadow: [
                  BoxShadow(
                    offset: Offset(0, -8),
                    blurRadius: 20,
                    color: Color.fromRGBO(0, 0, 0, 0.4),
                  ),
                ],
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text(
                    "\$2,599.99",
                    style: GoogleFonts.poppins(
                      fontSize: 30,
                      fontWeight: FontWeight.w500,
                      color: const Color.fromRGBO(255, 255, 255, 1),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) {
                            return const Cart();
                          },
                        ),
                      );
                    },
                    child: Container(
                      alignment: const Alignment(0, 0),
                      height: 50,
                      width: 187,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(
                          color:const  Color.fromRGBO(255, 251, 251, 0.5),
                        ),
                        gradient: const LinearGradient(
                          colors: [
                            Color.fromRGBO(55, 182, 233, 1),
                            Color.fromRGBO(75, 76, 237, 1),
                          ],
                        ),
                      ),
                      child: Text(
                        "Buy Now",
                        style: GoogleFonts.poppins(
                          fontSize: 30,
                          fontWeight: FontWeight.w500,
                          color: const Color.fromRGBO(255, 255, 255, 1),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
