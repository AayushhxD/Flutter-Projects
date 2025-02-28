import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'description.dart';

class Choosebike extends StatefulWidget {
  const Choosebike({super.key});

  @override
  State<Choosebike> createState() => _ChoosebikeState();
}

class _ChoosebikeState extends State<Choosebike> {
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
            top: 340,
            child: Transform.rotate(
              angle: 90 * 3.1415926535897931 / 180,
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
          Positioned(
            top: 50,
            left: 18,
            child: Row(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Choose Your",
                      style: GoogleFonts.poppins(
                        fontSize: 30,
                        fontWeight: FontWeight.w500,
                        color: const Color.fromRGBO(255, 255, 255, 1),
                      ),
                    ),
                    Text(
                      "Bicycle",
                      style: GoogleFonts.poppins(
                        fontSize: 30,
                        fontWeight: FontWeight.w500,
                        color: const Color.fromRGBO(255, 255, 255, 1),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  width: 150,
                ),
                GestureDetector(
                  onTap: () {
                    // Add functionality for search icon tap
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
                )
              ],
            ),
          ),
          Positioned(
            top: 170,
            left: 20,
            child: Container(
              height: 250,
              width: 390,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                gradient: LinearGradient(
                  colors: [
                    const Color.fromRGBO(53, 63, 84, 0.5).withOpacity(1),
                    const Color.fromRGBO(34, 40, 52, 0.5).withOpacity(1),
                  ],
                ),
                boxShadow: const [
                  BoxShadow(
                    offset: Offset(4, 7),
                    blurRadius: 10,
                    color: Color.fromRGBO(0, 0, 0, 0.5),
                  ),
                ],
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset("assets/pngwing (1).png"),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "EXTREME",
                        style: GoogleFonts.allertaStencil(
                          fontSize: 32,
                          fontWeight: FontWeight.w400,
                          color: const Color.fromRGBO(255, 255, 255, 1),
                        ),
                      ),
                      Text(
                        "30% OFF",
                        style: GoogleFonts.allertaStencil(
                          fontSize: 32,
                          fontWeight: FontWeight.w400,
                          color: const Color.fromRGBO(255, 255, 255, 1),
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
          ),
          Positioned(
            top: 430,
            left: 20,
            child: SizedBox(
              height: 50,
              width: 282,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap: () {
                      // Add functionality for first icon tap
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
                      child: Center(
                        child: Image.asset(
                          "assets/image 2 (1).png",
                          height: 28,
                          width: 37,
                        ),
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      // Add functionality for second icon tap
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
                            Color.fromRGBO(255, 255, 255, 1),
                            Color.fromRGBO(161, 161, 161, 1),
                          ],
                        ),
                      ),
                      child: Center(
                        child: Image.asset(
                          "assets/image 1.png",
                          height: 28,
                          width: 37,
                        ),
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      // Add functionality for third icon tap
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
                            Color.fromRGBO(255, 255, 255, 1),
                            Color.fromRGBO(161, 161, 161, 1),
                          ],
                        ),
                      ),
                      child: Center(
                        child: Image.asset(
                          "assets/image 3.png",
                          height: 28,
                          width: 37,
                        ),
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      // Add functionality for fourth icon tap
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
                            Color.fromRGBO(255, 255, 255, 1),
                            Color.fromRGBO(161, 161, 161, 1),
                          ],
                        ),
                      ),
                      child: Center(
                        child: Image.asset(
                          "assets/image 4.png",
                          height: 28,
                          width: 37,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            top: 450,
            left: 20,
            right: 20,
            child: Container(
              height: 1000,
              child: GridView(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 20,
                    mainAxisSpacing: 20,
                    mainAxisExtent: 240),
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.of(context)
                          .push(MaterialPageRoute(builder: (context) {
                        return const Description();
                      }));
                    },
                    child: Container(
                      height: 230,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        gradient: const LinearGradient(
                          colors: [
                            Color.fromRGBO(53, 63, 84, 0.6),
                            Color.fromRGBO(34, 40, 52, 0.6)
                          ],
                        ),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.only(left: 10, right: 10),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                                height: 140,
                                child: Image.asset("assets/pngwing (3).png")),
                            const SizedBox(
                              height: 10,
                            ),
                            Text(
                              "Road Bicycle",
                              style: GoogleFonts.poppins(
                                fontSize: 20,
                                fontWeight: FontWeight.w600,
                                color: const Color.fromRGBO(255, 255, 255, 1),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.of(context)
                          .push(MaterialPageRoute(builder: (context) {
                        return const Description();
                      }));
                    },
                    child: Container(
                      height: 230,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        gradient: const LinearGradient(
                          colors: [
                            Color.fromRGBO(53, 63, 84, 0.6),
                            Color.fromRGBO(34, 40, 52, 0.6)
                          ],
                        ),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.only(left: 10, right: 10),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                                height: 140,
                                child: Image.asset("assets/pngwing (5).png")),
                            const SizedBox(
                              height: 10,
                            ),
                            Text(
                              "Mountain Bicycle",
                              style: GoogleFonts.poppins(
                                fontSize: 20,
                                fontWeight: FontWeight.w600,
                                color: const Color.fromRGBO(255, 255, 255, 1),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.of(context)
                          .push(MaterialPageRoute(builder: (context) {
                        return const Description();
                      }));
                    },
                    child: Container(
                      height: 230,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        gradient: const LinearGradient(
                          colors: [
                            Color.fromRGBO(53, 63, 84, 0.6),
                            Color.fromRGBO(34, 40, 52, 0.6)
                          ],
                        ),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.only(left: 10, right: 10),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                                height: 140,
                                child: Image.asset("assets/pngwing (4).png")),
                            const SizedBox(
                              height: 10,
                            ),
                            Text(
                              "Hybrid Bicycle",
                              style: GoogleFonts.poppins(
                                fontSize: 20,
                                fontWeight: FontWeight.w600,
                                color: const Color.fromRGBO(255, 255, 255, 1),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.of(context)
                          .push(MaterialPageRoute(builder: (context) {
                        return const Description();
                      }));
                    },
                    child: Container(
                      height: 230,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        gradient: const LinearGradient(
                          colors: [
                            Color.fromRGBO(53, 63, 84, 0.6),
                            Color.fromRGBO(34, 40, 52, 0.6)
                          ],
                        ),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.only(left: 10, right: 10),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                                height: 140,
                                child: Image.asset("assets/pngwing (1).png")),
                            const SizedBox(
                              height: 10,
                            ),
                            Text(
                              "Folding Bicycle",
                              style: GoogleFonts.poppins(
                                fontSize: 20,
                                fontWeight: FontWeight.w600,
                                color: const Color.fromRGBO(255, 255, 255, 1),
                              ),
                            ),
                          ],
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
