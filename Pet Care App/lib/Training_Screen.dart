import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pet_care_app/Dashboard.dart';

class Training_Screen extends StatefulWidget {
  const Training_Screen({super.key});

  @override
  State<Training_Screen> createState() => _Training_ScreenState();
}

class _Training_ScreenState extends State<Training_Screen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(245, 245, 247, 1),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(
                  top: 55, bottom: 15, left: 24, right: 24),
              child: Row(
                children: [
                  Container(
                    height: 26,
                    width: 26,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: const Color.fromRGBO(245, 146, 69, 1),
                      boxShadow: const [
                        BoxShadow(
                          offset: Offset(0, 8),
                          blurRadius: 18,
                          spreadRadius: -4,
                          color: Color.fromRGBO(22, 34, 51, 0.08),
                        ),
                      ],
                    ),
                    child: Center(
                      child: GestureDetector(
                        onTap: () {
                          Navigator.of(context)
                              .push(MaterialPageRoute(builder: (context) {
                            return const Dashboard();
                          }));
                        },
                        child: const Icon(
                          Icons.arrow_back_ios_new,
                          color: Color.fromRGBO(255, 255, 255, 1),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 120,
                  ),
                  Text(
                    "Training",
                    style: GoogleFonts.poppins(
                      fontWeight: FontWeight.w500,
                      fontSize: 16,
                      color: const Color.fromRGBO(31, 32, 41, 1),
                    ),
                  ),
                ],
              ),
            ),
            Column(
              children: [
                Container(
                  width: 390,
                  height: 120,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                    color: const Color.fromRGBO(255, 255, 255, 1),
                    boxShadow: const [
                      BoxShadow(
                        offset: Offset(0, 8),
                        blurRadius: 16,
                        spreadRadius: -4,
                        color: Color.fromRGBO(22, 34, 51, 0.08),
                      ),
                    ],
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Container(
                          height: 90,
                          width: 90,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            boxShadow: const [
                              BoxShadow(
                                offset: Offset(0, 8),
                                blurRadius: 16,
                                spreadRadius: -4,
                                color: Color.fromRGBO(22, 34, 51, 0.08),
                              ),
                            ],
                            image: const DecorationImage(
                                image: AssetImage(
                                    "assets/fd6cf35dddb3adb35961cb24b70a32e7.jpeg"),
                                fit: BoxFit.cover),
                          ),
                          child: const Center(
                            child: Icon(
                              Icons.play_circle_outline_rounded,
                              size: 30,
                              color: Color.fromRGBO(255, 255, 255, 1),
                            ),
                          ),
                        ),
                        const SizedBox(
                          width: 15,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "Obedience Courses",
                              style: GoogleFonts.poppins(
                                fontWeight: FontWeight.w500,
                                fontSize: 14,
                                color: const Color.fromRGBO(0, 0, 0, 1),
                              ),
                            ),
                            Text(
                              "By Jhon Smith ",
                              style: GoogleFonts.poppins(
                                fontWeight: FontWeight.w400,
                                fontSize: 12,
                                color: const Color.fromRGBO(31, 32, 41, 1),
                              ),
                            ),
                            Row(
                              children: [
                                const Icon(
                                  Icons.star_border_outlined,
                                  color: Color.fromRGBO(245, 146, 69, 1),
                                ),
                                Text(
                                  "4.9 (335)",
                                  style: GoogleFonts.poppins(
                                    fontWeight: FontWeight.w400,
                                    fontSize: 12,
                                    color:
                                        const Color.fromRGBO(194, 195, 204, 1),
                                  ),
                                ),
                              ],
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(
                  height: 25,
                ),
                Container(
                  width: 390,
                  height: 120,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                    color: const Color.fromRGBO(255, 255, 255, 1),
                    boxShadow: const [
                      BoxShadow(
                        offset: Offset(0, 8),
                        blurRadius: 16,
                        spreadRadius: -4,
                        color: Color.fromRGBO(22, 34, 51, 0.08),
                      ),
                    ],
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Container(
                          height: 90,
                          width: 90,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            boxShadow: const [
                              BoxShadow(
                                offset: Offset(0, 8),
                                blurRadius: 16,
                                spreadRadius: -4,
                                color: Color.fromRGBO(22, 34, 51, 0.08),
                              ),
                            ],
                            image: const DecorationImage(
                                image: AssetImage(
                                    "assets/4e85b64112706e2f07fb23d7c22bbc3b.jpeg"),
                                fit: BoxFit.cover),
                          ),
                          child: const Center(
                            child: Icon(
                              Icons.play_circle_outline_rounded,
                              size: 30,
                              color: Color.fromRGBO(255, 255, 255, 1),
                            ),
                          ),
                        ),
                        const SizedBox(
                          width: 15,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "Specialty Classes & Workshops",
                              style: GoogleFonts.poppins(
                                fontWeight: FontWeight.w500,
                                fontSize: 14,
                                color: const Color.fromRGBO(0, 0, 0, 1),
                              ),
                            ),
                            Text(
                              "By Duke Fuzzington ",
                              style: GoogleFonts.poppins(
                                fontWeight: FontWeight.w400,
                                fontSize: 12,
                                color: const Color.fromRGBO(31, 32, 41, 1),
                              ),
                            ),
                            Row(
                              children: [
                                const Icon(
                                  Icons.star_border_outlined,
                                  color: Color.fromRGBO(245, 146, 69, 1),
                                ),
                                Text(
                                  "5.0 (500)",
                                  style: GoogleFonts.poppins(
                                    fontWeight: FontWeight.w400,
                                    fontSize: 12,
                                    color:
                                        const Color.fromRGBO(194, 195, 204, 1),
                                  ),
                                ),
                              ],
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(
                  height: 25,
                ),
                Container(
                  width: 390,
                  height: 120,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                    color: const Color.fromRGBO(255, 255, 255, 1),
                    boxShadow: const [
                      BoxShadow(
                        offset: Offset(0, 8),
                        blurRadius: 16,
                        spreadRadius: -4,
                        color: Color.fromRGBO(22, 34, 51, 0.08),
                      ),
                    ],
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Container(
                          height: 90,
                          width: 90,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            boxShadow: const [
                              BoxShadow(
                                offset: Offset(0, 8),
                                blurRadius: 16,
                                spreadRadius: -4,
                                color: Color.fromRGBO(22, 34, 51, 0.08),
                              ),
                            ],
                            image: const DecorationImage(
                                image: AssetImage(
                                    "assets/08da81d0849d42dada82fb903f5ffe1b.jpeg"),
                                fit: BoxFit.cover),
                          ),
                          child: const Center(
                            child: Icon(
                              Icons.play_circle_outline_rounded,
                              size: 30,
                              color: Color.fromRGBO(255, 255, 255, 1),
                            ),
                          ),
                        ),
                        const SizedBox(
                          width: 15,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              '''Puppy Kinderganten 
and Playgroups''',
                              style: GoogleFonts.poppins(
                                fontWeight: FontWeight.w500,
                                fontSize: 14,
                                color: const Color.fromRGBO(0, 0, 0, 1),
                              ),
                            ),
                            Text(
                              "By Sir Fluffington ",
                              style: GoogleFonts.poppins(
                                fontWeight: FontWeight.w400,
                                fontSize: 12,
                                color: const Color.fromRGBO(31, 32, 41, 1),
                              ),
                            ),
                            Row(
                              children: [
                                const Icon(
                                  Icons.star_border_outlined,
                                  color: Color.fromRGBO(245, 146, 69, 1),
                                ),
                                Text(
                                  "5.0 (500)",
                                  style: GoogleFonts.poppins(
                                    fontWeight: FontWeight.w400,
                                    fontSize: 12,
                                    color:
                                        const Color.fromRGBO(194, 195, 204, 1),
                                  ),
                                ),
                              ],
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(
                  height: 25,
                ),
                Container(
                  width: 390,
                  height: 120,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                    color: const Color.fromRGBO(255, 255, 255, 1),
                    boxShadow: const [
                      BoxShadow(
                        offset: Offset(0, 8),
                        blurRadius: 16,
                        spreadRadius: -4,
                        color: Color.fromRGBO(22, 34, 51, 0.08),
                      ),
                    ],
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Container(
                          height: 90,
                          width: 90,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            boxShadow: const [
                              BoxShadow(
                                offset: Offset(0, 8),
                                blurRadius: 16,
                                spreadRadius: -4,
                                color: Color.fromRGBO(22, 34, 51, 0.08),
                              ),
                            ],
                            image: const DecorationImage(
                                image: AssetImage(
                                    "assets/bcb7370091eeae8a5125162ac1992688.jpeg"),
                                fit: BoxFit.cover),
                          ),
                          child: const Center(
                            child: Icon(
                              Icons.play_circle_outline_rounded,
                              size: 30,
                              color: Color.fromRGBO(255, 255, 255, 1),
                            ),
                          ),
                        ),
                        const SizedBox(
                          width: 15,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "Canine Good Citizen Test",
                              style: GoogleFonts.poppins(
                                fontWeight: FontWeight.w500,
                                fontSize: 14,
                                color: const Color.fromRGBO(0, 0, 0, 1),
                              ),
                            ),
                            Text(
                              "By Baron Fuzzypaws ",
                              style: GoogleFonts.poppins(
                                fontWeight: FontWeight.w400,
                                fontSize: 12,
                                color: const Color.fromRGBO(31, 32, 41, 1),
                              ),
                            ),
                            Row(
                              children: [
                                const Icon(
                                  Icons.star_border_outlined,
                                  color: Color.fromRGBO(245, 146, 69, 1),
                                ),
                                Text(
                                  "4.8 (220)",
                                  style: GoogleFonts.poppins(
                                    fontWeight: FontWeight.w400,
                                    fontSize: 12,
                                    color:
                                        const Color.fromRGBO(194, 195, 204, 1),
                                  ),
                                ),
                              ],
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(
                  height: 25,
                ),
                Container(
                  width: 390,
                  height: 120,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                    color: const Color.fromRGBO(255, 255, 255, 1),
                    boxShadow: const [
                      BoxShadow(
                        offset: Offset(0, 8),
                        blurRadius: 16,
                        spreadRadius: -4,
                        color: Color.fromRGBO(22, 34, 51, 0.08),
                      ),
                    ],
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Container(
                          height: 90,
                          width: 90,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            boxShadow: const [
                              BoxShadow(
                                offset: Offset(0, 8),
                                blurRadius: 16,
                                spreadRadius: -4,
                                color: Color.fromRGBO(22, 34, 51, 0.08),
                              ),
                            ],
                            image: const DecorationImage(
                                image: AssetImage(
                                    "assets/6b353775af9c135014e27d72db6acf95.jpeg"),
                                fit: BoxFit.cover),
                          ),
                          child: const Center(
                            child: Icon(
                              Icons.play_circle_outline_rounded,
                              size: 30,
                              color: Color.fromRGBO(255, 255, 255, 1),
                            ),
                          ),
                        ),
                        const SizedBox(
                          width: 15,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "Theraphy Dogs",
                              style: GoogleFonts.poppins(
                                fontWeight: FontWeight.w500,
                                fontSize: 14,
                                color: const Color.fromRGBO(0, 0, 0, 1),
                              ),
                            ),
                            Text(
                              "By Duke Fuzzington ",
                              style: GoogleFonts.poppins(
                                fontWeight: FontWeight.w400,
                                fontSize: 12,
                                color: const Color.fromRGBO(31, 32, 41, 1),
                              ),
                            ),
                            Row(
                              children: [
                                const Icon(
                                  Icons.star_border_outlined,
                                  color: Color.fromRGBO(245, 146, 69, 1),
                                ),
                                Text(
                                  "5.0 (500)",
                                  style: GoogleFonts.poppins(
                                    fontWeight: FontWeight.w400,
                                    fontSize: 12,
                                    color:
                                        const Color.fromRGBO(194, 195, 204, 1),
                                  ),
                                ),
                              ],
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(
                  height: 25,
                ),
                Container(
                  width: 390,
                  height: 120,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                    color: const Color.fromRGBO(255, 255, 255, 1),
                    boxShadow: const [
                      BoxShadow(
                        offset: Offset(0, 8),
                        blurRadius: 16,
                        spreadRadius: -4,
                        color: Color.fromRGBO(22, 34, 51, 0.08),
                      ),
                    ],
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Container(
                          height: 90,
                          width: 90,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            boxShadow: const [
                              BoxShadow(
                                offset: Offset(0, 8),
                                blurRadius: 16,
                                spreadRadius: -4,
                                color: Color.fromRGBO(22, 34, 51, 0.08),
                              ),
                            ],
                            image: const DecorationImage(
                                image: AssetImage(
                                    "assets/2b5f027d582118fb1b827dae9b766599.jpeg"),
                                fit: BoxFit.cover),
                          ),
                          child: const Center(
                            child: Icon(
                              Icons.play_circle_outline_rounded,
                              size: 30,
                              color: Color.fromRGBO(255, 255, 255, 1),
                            ),
                          ),
                        ),
                        const SizedBox(
                          width: 15,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "Obedience Courses",
                              style: GoogleFonts.poppins(
                                fontWeight: FontWeight.w500,
                                fontSize: 14,
                                color: const Color.fromRGBO(0, 0, 0, 1),
                              ),
                            ),
                            Text(
                              "By Baron Fuzzypaws ",
                              style: GoogleFonts.poppins(
                                fontWeight: FontWeight.w400,
                                fontSize: 12,
                                color: const Color.fromRGBO(31, 32, 41, 1),
                              ),
                            ),
                            Row(
                              children: [
                                const Icon(
                                  Icons.star_border_outlined,
                                  color: Color.fromRGBO(245, 146, 69, 1),
                                ),
                                Text(
                                  "4.9 (440)",
                                  style: GoogleFonts.poppins(
                                    fontWeight: FontWeight.w400,
                                    fontSize: 12,
                                    color:
                                        const Color.fromRGBO(194, 195, 204, 1),
                                  ),
                                ),
                              ],
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
