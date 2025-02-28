import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pet_care_app/Dashboard.dart';

class Notification_Screen extends StatefulWidget {
  const Notification_Screen({super.key});

  @override
  State<Notification_Screen> createState() => _Notification_ScreenState();
}

class _Notification_ScreenState extends State<Notification_Screen> {
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
                    "Notifications",
                    style: GoogleFonts.poppins(
                      fontWeight: FontWeight.w500,
                      fontSize: 16,
                      color: const Color.fromRGBO(31, 32, 41, 1),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                  top: 15, bottom: 15, left: 24, right: 24),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Today",
                    style: GoogleFonts.poppins(
                      fontWeight: FontWeight.w500,
                      fontSize: 14,
                      color: const Color.fromRGBO(31, 32, 41, 1),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 15, bottom: 15),
              child: Container(
                width: 390,
                height: 150,
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
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Container(
                            height: 40,
                            width: 40,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                              color: const Color.fromRGBO(252, 219, 193, 1),
                              boxShadow: const [
                                BoxShadow(
                                  offset: Offset(0, 8),
                                  blurRadius: 18,
                                  spreadRadius: -4,
                                  color: Color.fromRGBO(22, 34, 51, 0.08),
                                ),
                              ],
                            ),
                            child: const Center(
                              child: Icon(
                                Icons.shopping_bag_outlined,
                                color: Color.fromRGBO(245, 146, 69, 1),
                              ),
                            ),
                          ),
                          const SizedBox(
                            width: 5,
                          ),
                          Expanded(
                              child: Text(
                            "Your Checkout is successfull,product is on the way",
                            style: GoogleFonts.poppins(
                              fontWeight: FontWeight.w400,
                              fontSize: 14,
                              color: const Color.fromRGBO(31, 32, 41, 1),
                            ),
                          ))
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Container(
                            height: 40,
                            width: 40,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                              color: const Color.fromRGBO(252, 219, 193, 1),
                              boxShadow: const [
                                BoxShadow(
                                  offset: Offset(0, 8),
                                  blurRadius: 18,
                                  spreadRadius: -4,
                                  color: Color.fromRGBO(22, 34, 51, 0.08),
                                ),
                              ],
                            ),
                            child: const Center(
                              child: Icon(
                                Icons.check,
                                color: Color.fromRGBO(245, 146, 69, 1),
                              ),
                            ),
                          ),
                          const SizedBox(
                            width: 5,
                          ),
                          Expanded(
                              child: Text(
                            "Appointment request accepted",
                            style: GoogleFonts.poppins(
                              fontWeight: FontWeight.w400,
                              fontSize: 14,
                              color: const Color.fromRGBO(31, 32, 41, 1),
                            ),
                          ))
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                  top: 15, bottom: 15, left: 24, right: 24),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "25 September",
                    style: GoogleFonts.poppins(
                      fontWeight: FontWeight.w500,
                      fontSize: 14,
                      color: const Color.fromRGBO(31, 32, 41, 1),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 15, bottom: 15),
              child: Container(
                width: 390,
                height: 150,
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
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Container(
                            height: 40,
                            width: 40,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                              color: const Color.fromRGBO(252, 219, 193, 1),
                              boxShadow: const [
                                BoxShadow(
                                  offset: Offset(0, 8),
                                  blurRadius: 18,
                                  spreadRadius: -4,
                                  color: Color.fromRGBO(22, 34, 51, 0.08),
                                ),
                              ],
                            ),
                            child: const Center(
                              child: Icon(
                                Icons.shopping_bag_outlined,
                                color: Color.fromRGBO(245, 146, 69, 1),
                              ),
                            ),
                          ),
                          const SizedBox(
                            width: 5,
                          ),
                          Expanded(
                              child: Text(
                            "Your Checkout is successfull,product is on the way",
                            style: GoogleFonts.poppins(
                              fontWeight: FontWeight.w400,
                              fontSize: 14,
                              color: const Color.fromRGBO(31, 32, 41, 1),
                            ),
                          ))
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Container(
                            height: 40,
                            width: 40,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                              color: const Color.fromRGBO(252, 219, 193, 1),
                              boxShadow: const [
                                BoxShadow(
                                  offset: Offset(0, 8),
                                  blurRadius: 18,
                                  spreadRadius: -4,
                                  color: Color.fromRGBO(22, 34, 51, 0.08),
                                ),
                              ],
                            ),
                            child: const Center(
                              child: Icon(
                                Icons.check,
                                color: Color.fromRGBO(245, 146, 69, 1),
                              ),
                            ),
                          ),
                          const SizedBox(
                            width: 5,
                          ),
                          Expanded(
                              child: Text(
                            "Appointment request accepted",
                            style: GoogleFonts.poppins(
                              fontWeight: FontWeight.w400,
                              fontSize: 14,
                              color: const Color.fromRGBO(31, 32, 41, 1),
                            ),
                          ))
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Container(
                            height: 40,
                            width: 40,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                              color: const Color.fromRGBO(252, 219, 193, 1),
                              boxShadow: const [
                                BoxShadow(
                                  offset: Offset(0, 8),
                                  blurRadius: 18,
                                  spreadRadius: -4,
                                  color: Color.fromRGBO(22, 34, 51, 0.08),
                                ),
                              ],
                            ),
                            child: const Center(
                              child: Icon(
                                Icons.favorite_border,
                                color: Color.fromRGBO(245, 146, 69, 1),
                              ),
                            ),
                          ),
                          const SizedBox(
                            width: 5,
                          ),
                          Expanded(
                              child: Text(
                            "Vaccinate your pet timely ",
                            style: GoogleFonts.poppins(
                              fontWeight: FontWeight.w400,
                              fontSize: 14,
                              color: const Color.fromRGBO(31, 32, 41, 1),
                            ),
                          ))
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                  top: 15, bottom: 15, left: 24, right: 24),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "15 September",
                    style: GoogleFonts.poppins(
                      fontWeight: FontWeight.w500,
                      fontSize: 14,
                      color: const Color.fromRGBO(31, 32, 41, 1),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 15, bottom: 15),
              child: Container(
                width: 390,
                height: 150,
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
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Container(
                            height: 40,
                            width: 40,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                              color: const Color.fromRGBO(252, 219, 193, 1),
                              boxShadow: const [
                                BoxShadow(
                                  offset: Offset(0, 8),
                                  blurRadius: 18,
                                  spreadRadius: -4,
                                  color: Color.fromRGBO(22, 34, 51, 0.08),
                                ),
                              ],
                            ),
                            child: const Center(
                              child: Icon(
                                Icons.shopping_bag_outlined,
                                color: Color.fromRGBO(245, 146, 69, 1),
                              ),
                            ),
                          ),
                          const SizedBox(
                            width: 5,
                          ),
                          Expanded(
                              child: Text(
                            "Your Checkout is successfull,product is on the way",
                            style: GoogleFonts.poppins(
                              fontWeight: FontWeight.w400,
                              fontSize: 14,
                              color: const Color.fromRGBO(31, 32, 41, 1),
                            ),
                          ))
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Container(
                            height: 40,
                            width: 40,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                              color: const Color.fromRGBO(252, 219, 193, 1),
                              boxShadow: const [
                                BoxShadow(
                                  offset: Offset(0, 8),
                                  blurRadius: 18,
                                  spreadRadius: -4,
                                  color: Color.fromRGBO(22, 34, 51, 0.08),
                                ),
                              ],
                            ),
                            child: const Center(
                              child: Icon(
                                Icons.check,
                                color: Color.fromRGBO(245, 146, 69, 1),
                              ),
                            ),
                          ),
                          const SizedBox(
                            width: 5,
                          ),
                          Expanded(
                              child: Text(
                            "Appointment request accepted",
                            style: GoogleFonts.poppins(
                              fontWeight: FontWeight.w400,
                              fontSize: 14,
                              color: const Color.fromRGBO(31, 32, 41, 1),
                            ),
                          ))
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Container(
                            height: 40,
                            width: 40,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                              color: const Color.fromRGBO(252, 219, 193, 1),
                              boxShadow: const [
                                BoxShadow(
                                  offset: Offset(0, 8),
                                  blurRadius: 18,
                                  spreadRadius: -4,
                                  color: Color.fromRGBO(22, 34, 51, 0.08),
                                ),
                              ],
                            ),
                            child: const Center(
                              child: Icon(
                                Icons.favorite_border,
                                color: Color.fromRGBO(245, 146, 69, 1),
                              ),
                            ),
                          ),
                          const SizedBox(
                            width: 5,
                          ),
                          Expanded(
                              child: Text(
                            "Vaccinate your pet timely ",
                            style: GoogleFonts.poppins(
                              fontWeight: FontWeight.w400,
                              fontSize: 14,
                              color: const Color.fromRGBO(31, 32, 41, 1),
                            ),
                          ))
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                  top: 15, bottom: 15, left: 24, right: 24),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "21 October",
                    style: GoogleFonts.poppins(
                      fontWeight: FontWeight.w500,
                      fontSize: 14,
                      color: const Color.fromRGBO(31, 32, 41, 1),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 15, bottom: 15),
              child: Container(
                width: 390,
                height: 150,
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
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Container(
                            height: 40,
                            width: 40,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                              color: const Color.fromRGBO(252, 219, 193, 1),
                              boxShadow: const [
                                BoxShadow(
                                  offset: Offset(0, 8),
                                  blurRadius: 18,
                                  spreadRadius: -4,
                                  color: Color.fromRGBO(22, 34, 51, 0.08),
                                ),
                              ],
                            ),
                            child: const Center(
                              child: Icon(
                                Icons.shopping_bag_outlined,
                                color: Color.fromRGBO(245, 146, 69, 1),
                              ),
                            ),
                          ),
                          const SizedBox(
                            width: 5,
                          ),
                          Expanded(
                              child: Text(
                            "Your Checkout is successfull,product is on the way",
                            style: GoogleFonts.poppins(
                              fontWeight: FontWeight.w400,
                              fontSize: 14,
                              color: const Color.fromRGBO(31, 32, 41, 1),
                            ),
                          ))
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Container(
                            height: 40,
                            width: 40,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                              color: const Color.fromRGBO(252, 219, 193, 1),
                              boxShadow: const [
                                BoxShadow(
                                  offset: Offset(0, 8),
                                  blurRadius: 18,
                                  spreadRadius: -4,
                                  color: Color.fromRGBO(22, 34, 51, 0.08),
                                ),
                              ],
                            ),
                            child: const Center(
                              child: Icon(
                                Icons.check,
                                color: Color.fromRGBO(245, 146, 69, 1),
                              ),
                            ),
                          ),
                          const SizedBox(
                            width: 5,
                          ),
                          Expanded(
                              child: Text(
                            "Appointment request accepted",
                            style: GoogleFonts.poppins(
                              fontWeight: FontWeight.w400,
                              fontSize: 14,
                              color: const Color.fromRGBO(31, 32, 41, 1),
                            ),
                          ))
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Container(
                            height: 40,
                            width: 40,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                              color: const Color.fromRGBO(252, 219, 193, 1),
                              boxShadow: const [
                                BoxShadow(
                                  offset: Offset(0, 8),
                                  blurRadius: 18,
                                  spreadRadius: -4,
                                  color: Color.fromRGBO(22, 34, 51, 0.08),
                                ),
                              ],
                            ),
                            child: const Center(
                              child: Icon(
                                Icons.favorite_border,
                                color: Color.fromRGBO(245, 146, 69, 1),
                              ),
                            ),
                          ),
                          const SizedBox(
                            width: 5,
                          ),
                          Expanded(
                              child: Text(
                            "Vaccinate your pet timely ",
                            style: GoogleFonts.poppins(
                              fontWeight: FontWeight.w400,
                              fontSize: 14,
                              color: const Color.fromRGBO(31, 32, 41, 1),
                            ),
                          ))
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
