import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Cart extends StatefulWidget {
  const Cart({super.key});

  @override
  State<Cart> createState() => _CartState();
}

class _CartState extends State<Cart> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 5.0, sigmaY: 5.0),
            child: Container(
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.center,
                  end: Alignment.bottomRight,
                  stops: [0.2, 0.1],
                  colors: [
                    const Color.fromRGBO(36, 44, 59, 1),
                    Color.fromRGBO(75, 76, 237, 1),
                  ],
                ),
              ),
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 5.0, sigmaY: 5.0),
                child: Container(
                  color: Colors.black.withOpacity(0.4),
                ),
              ),
            ),
          ),
          Positioned(
            top: 360,
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
            top: 141,
            left: 20,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Container(
                  height: 108,
                  width: 130,
                  decoration: BoxDecoration(
                    color: const Color.fromRGBO(36, 44, 59, 1),
                    borderRadius: BorderRadius.circular(15),
                    gradient: const LinearGradient(
                      colors: [
                        Color.fromRGBO(53, 63, 84, 0.6),
                        Color.fromRGBO(34, 40, 52, 0),
                      ],
                    ),
                    border: Border.all(
                      color: const Color.fromRGBO(255, 255, 255, 1),
                      width: 2,
                    ),
                    boxShadow: const [
                      BoxShadow(
                        offset: Offset(5, 6),
                        blurRadius: 10,
                        spreadRadius: 1,
                        color: Color.fromRGBO(0, 0, 0, 0.05),
                      ),
                      BoxShadow(
                        offset: Offset(6, 6),
                        blurRadius: 5,
                        spreadRadius: 1,
                        color: Color.fromRGBO(0, 0, 0, 0.25),
                      ),
                    ],
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Image.asset("assets/pngwing (3).png"),
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Text(
                          "GT Bike",
                          style: GoogleFonts.poppins(
                            fontSize: 25,
                            fontWeight: FontWeight.w500,
                            color: const Color.fromRGBO(255, 255, 255, 1),
                          ),
                        )
                      ],
                    ),
                    Row(
                      children: [
                        Text(
                          "2,599.99",
                          style: GoogleFonts.poppins(
                            fontSize: 18,
                            fontWeight: FontWeight.w500,
                            color: const Color.fromRGBO(55, 182, 233, 1),
                          ),
                        ),
                        const SizedBox(
                          width: 90,
                        ),
                        Container(
                          height: 31,
                          width: 67,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(6),
                            color: const Color.fromRGBO(30, 30, 30, 0.8),
                          ),
                          child: Row(
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(5.0),
                                child: Container(
                                    alignment: const Alignment(0, 0),
                                    height: 23,
                                    width: 20,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(5),
                                      gradient: const LinearGradient(
                                        colors: [
                                          Color.fromRGBO(55, 182, 233, 1),
                                          Color.fromRGBO(75, 76, 237, 1)
                                        ],
                                      ),
                                    ),
                                    child: Text(
                                      "+",
                                      style: GoogleFonts.poppins(
                                        fontSize: 15,
                                        fontWeight: FontWeight.w600,
                                        color: const Color.fromRGBO(
                                            255, 255, 255, 1),
                                      ),
                                    )),
                              ),
                              Text(
                                "1",
                                style: GoogleFonts.poppins(
                                  fontSize: 10,
                                  fontWeight: FontWeight.w400,
                                  color: const Color.fromRGBO(255, 255, 255, 1),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(5.0),
                                child: Container(
                                  alignment: const Alignment(0, 0),
                                  height: 23,
                                  width: 20,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(5),
                                    gradient: const LinearGradient(
                                      colors: [
                                        Color.fromRGBO(255, 255, 255, 0.8),
                                        Color.fromRGBO(195, 195, 195, 0.2)
                                      ],
                                    ),
                                  ),
                                  child: Text(
                                    "-",
                                    style: GoogleFonts.poppins(
                                      fontSize: 15,
                                      fontWeight: FontWeight.w600,
                                      color: const Color.fromRGBO(
                                          255, 255, 255, 1),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ],
                )
              ],
            ),
          ),
          Positioned(
            top: 284,
            child: Container(
              width: 430,
              height: 1,
              decoration: BoxDecoration(
                border: Border.all(
                  width: 2,
                  color: const Color.fromRGBO(255, 255, 255, 1),
                ),
              ),
            ),
          ),
          Positioned(
            top: 457,
            child: Container(
              width: 430,
              height: 1,
              decoration: BoxDecoration(
                border: Border.all(
                  width: 2,
                  color: const Color.fromRGBO(255, 255, 255, 1),
                ),
              ),
            ),
          ),
          Positioned(
            top: 630,
            child: Container(
              width: 430,
              height: 1,
              decoration: BoxDecoration(
                border: Border.all(
                  width: 2,
                  color: const Color.fromRGBO(255, 255, 255, 1),
                ),
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
                    Text(
                      "My Shopping Cart ",
                      style: GoogleFonts.poppins(
                        fontSize: 30,
                        fontWeight: FontWeight.w600,
                        color: const Color.fromRGBO(255, 255, 255, 1),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  width: 50,
                ),
                Container(
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
                    Icons.arrow_back_ios_new,
                    size: 30,
                    color: Color.fromRGBO(255, 255, 255, 1),
                  ),
                )
              ],
            ),
          ),
          Positioned(
            top: 314,
            left: 20,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Container(
                  height: 108,
                  width: 130,
                  decoration: BoxDecoration(
                    color: const Color.fromRGBO(36, 44, 59, 1),
                    borderRadius: BorderRadius.circular(15),
                    gradient: const LinearGradient(
                      colors: [
                        Color.fromRGBO(53, 63, 84, 0.6),
                        Color.fromRGBO(34, 40, 52, 0),
                      ],
                    ),
                    border: Border.all(
                      color: const Color.fromRGBO(255, 255, 255, 1),
                      width: 2,
                    ),
                    boxShadow: const [
                      BoxShadow(
                        offset: Offset(5, 6),
                        blurRadius: 10,
                        spreadRadius: 1,
                        color: Color.fromRGBO(0, 0, 0, 0.05),
                      ),
                      BoxShadow(
                        offset: Offset(6, 6),
                        blurRadius: 5,
                        spreadRadius: 1,
                        color: Color.fromRGBO(0, 0, 0, 0.25),
                      ),
                    ],
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Image.asset("assets/image 3 (1).png"),
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Text(
                          "Helmet",
                          style: GoogleFonts.poppins(
                            fontSize: 25,
                            fontWeight: FontWeight.w500,
                            color: const Color.fromRGBO(255, 255, 255, 1),
                          ),
                        )
                      ],
                    ),
                    Row(
                      children: [
                        Text(
                          "\$125.99",
                          style: GoogleFonts.poppins(
                            fontSize: 18,
                            fontWeight: FontWeight.w500,
                            color: const Color.fromRGBO(55, 182, 233, 1),
                          ),
                        ),
                        const SizedBox(
                          width: 90,
                        ),
                        Container(
                          height: 31,
                          width: 67,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(6),
                            color: const Color.fromRGBO(30, 30, 30, 0.8),
                          ),
                          child: Row(
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(5.0),
                                child: Container(
                                    alignment: const Alignment(0, 0),
                                    height: 23,
                                    width: 20,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(5),
                                      gradient: const LinearGradient(
                                        colors: [
                                          Color.fromRGBO(55, 182, 233, 1),
                                          Color.fromRGBO(75, 76, 237, 1)
                                        ],
                                      ),
                                    ),
                                    child: Text(
                                      "+",
                                      style: GoogleFonts.poppins(
                                        fontSize: 15,
                                        fontWeight: FontWeight.w600,
                                        color: const Color.fromRGBO(
                                            255, 255, 255, 1),
                                      ),
                                    )),
                              ),
                              Text(
                                "1",
                                style: GoogleFonts.poppins(
                                  fontSize: 10,
                                  fontWeight: FontWeight.w400,
                                  color: const Color.fromRGBO(255, 255, 255, 1),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(5.0),
                                child: Container(
                                  alignment: const Alignment(0, 0),
                                  height: 23,
                                  width: 20,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(5),
                                    gradient: const LinearGradient(
                                      colors: [
                                        Color.fromRGBO(255, 255, 255, 0.8),
                                        Color.fromRGBO(195, 195, 195, 0.2)
                                      ],
                                    ),
                                  ),
                                  child: Text(
                                    "-",
                                    style: GoogleFonts.poppins(
                                      fontSize: 15,
                                      fontWeight: FontWeight.w600,
                                      color: const Color.fromRGBO(
                                          255, 255, 255, 1),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ],
                )
              ],
            ),
          ),
          Positioned(
            top: 487,
            left: 20,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Container(
                  height: 108,
                  width: 130,
                  decoration: BoxDecoration(
                    color: const Color.fromRGBO(36, 44, 59, 1),
                    borderRadius: BorderRadius.circular(15),
                    gradient: const LinearGradient(
                      colors: [
                        Color.fromRGBO(53, 63, 84, 0.6),
                        Color.fromRGBO(34, 40, 52, 0),
                      ],
                    ),
                    border: Border.all(
                      color: const Color.fromRGBO(255, 255, 255, 1),
                      width: 2,
                    ),
                    boxShadow: const [
                      BoxShadow(
                        offset: Offset(5, 6),
                        blurRadius: 10,
                        spreadRadius: 1,
                        color: Color.fromRGBO(0, 0, 0, 0.05),
                      ),
                      BoxShadow(
                        offset: Offset(6, 6),
                        blurRadius: 5,
                        spreadRadius: 1,
                        color: Color.fromRGBO(0, 0, 0, 0.25),
                      ),
                    ],
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Image.asset("assets/image 6 (1).png"),
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Text(
                          "Bottle",
                          style: GoogleFonts.poppins(
                            fontSize: 25,
                            fontWeight: FontWeight.w500,
                            color: const Color.fromRGBO(255, 255, 255, 1),
                          ),
                        )
                      ],
                    ),
                    Row(
                      children: [
                        Text(
                          "\$115.99",
                          style: GoogleFonts.poppins(
                            fontSize: 18,
                            fontWeight: FontWeight.w500,
                            color: const Color.fromRGBO(55, 182, 233, 1),
                          ),
                        ),
                        const SizedBox(
                          width: 90,
                        ),
                        Container(
                          height: 31,
                          width: 67,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(6),
                            color: const Color.fromRGBO(30, 30, 30, 0.8),
                          ),
                          child: Row(
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(5.0),
                                child: Container(
                                    alignment: const Alignment(0, 0),
                                    height: 23,
                                    width: 20,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(5),
                                      gradient: const LinearGradient(
                                        colors: [
                                          Color.fromRGBO(55, 182, 233, 1),
                                          Color.fromRGBO(75, 76, 237, 1)
                                        ],
                                      ),
                                    ),
                                    child: Text(
                                      "+",
                                      style: GoogleFonts.poppins(
                                        fontSize: 15,
                                        fontWeight: FontWeight.w600,
                                        color: const Color.fromRGBO(
                                            255, 255, 255, 1),
                                      ),
                                    )),
                              ),
                              Text(
                                "1",
                                style: GoogleFonts.poppins(
                                  fontSize: 10,
                                  fontWeight: FontWeight.w400,
                                  color: const Color.fromRGBO(255, 255, 255, 1),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(5.0),
                                child: Container(
                                  alignment: const Alignment(0, 0),
                                  height: 23,
                                  width: 20,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(5),
                                    gradient: const LinearGradient(
                                      colors: [
                                        Color.fromRGBO(255, 255, 255, 0.8),
                                        Color.fromRGBO(195, 195, 195, 0.2)
                                      ],
                                    ),
                                  ),
                                  child: Text(
                                    "-",
                                    style: GoogleFonts.poppins(
                                      fontSize: 15,
                                      fontWeight: FontWeight.w600,
                                      color: const Color.fromRGBO(
                                          255, 255, 255, 1),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ],
                )
              ],
            ),
          ),
          Positioned(
            top: 640,
            left: 90,
            child: Row(
              children: [
                Text(
                  "Your Bag Qualifies for Free Shipping ",
                  style: GoogleFonts.poppins(
                    fontSize: 15,
                    fontWeight: FontWeight.w300,
                    color: const Color.fromRGBO(255, 255, 255, 1),
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            top: 675,
            left: 10,
            child: Row(
              children: [
                Container(
                  height: 50,
                  width: 410,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: const Color.fromRGBO(36, 44, 59, 0.8),
                    border: Border.all(
                      width: 2,
                      color: const Color.fromRGBO(0, 0, 0, 0.3),
                    ),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "6Affg5",
                        style: GoogleFonts.poppins(
                          fontSize: 22,
                          fontWeight: FontWeight.w500,
                          color: const Color.fromRGBO(142, 142, 142, 1),
                        ),
                      ),
                      Container(
                        alignment: const Alignment(0, 0),
                        height: 44,
                        width: 137,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          gradient: const LinearGradient(
                            colors: [
                              Color.fromRGBO(55, 182, 233, 1),
                              Color.fromRGBO(75, 76, 237, 1)
                            ],
                          ),
                        ),
                        child: Text(
                          "Apply",
                          style: GoogleFonts.poppins(
                            fontSize: 22,
                            fontWeight: FontWeight.w600,
                            color: const Color.fromRGBO(255, 255, 255, 1),
                          ),
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
          Positioned(
            top: 735,
            left: 20,
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Subtotal",
                        style: GoogleFonts.poppins(
                          fontSize: 20,
                          fontWeight: FontWeight.w600,
                          color: const Color.fromRGBO(255, 255, 255, 1),
                        ),
                      ),
                      SizedBox(
                        width: 210,
                      ),
                      Text(
                        "\$2,841.99",
                        style: GoogleFonts.poppins(
                          fontSize: 18,
                          fontWeight: FontWeight.w500,
                          color: const Color.fromRGBO(55, 182, 233, 1),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Delivery fee",
                        style: GoogleFonts.poppins(
                          fontSize: 20,
                          fontWeight: FontWeight.w600,
                          color: const Color.fromRGBO(255, 255, 255, 1),
                        ),
                      ),
                      SizedBox(
                        width: 240,
                      ),
                      Text(
                        "\$0",
                        style: GoogleFonts.poppins(
                          fontSize: 18,
                          fontWeight: FontWeight.w500,
                          color: const Color.fromRGBO(55, 182, 233, 1),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Discount",
                        style: GoogleFonts.poppins(
                          fontSize: 20,
                          fontWeight: FontWeight.w600,
                          color: const Color.fromRGBO(255, 255, 255, 1),
                        ),
                      ),
                      SizedBox(
                        width: 260,
                      ),
                      Text(
                        "30%",
                        style: GoogleFonts.poppins(
                          fontSize: 18,
                          fontWeight: FontWeight.w500,
                          color: const Color.fromRGBO(55, 182, 233, 1),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Total",
                        style: GoogleFonts.poppins(
                          fontSize: 20,
                          fontWeight: FontWeight.w600,
                          color: const Color.fromRGBO(255, 255, 255, 1),
                        ),
                      ),
                      SizedBox(
                        width: 250,
                      ),
                      Text(
                        "\$1,989.37",
                        style: GoogleFonts.poppins(
                          fontSize: 18,
                          fontWeight: FontWeight.w500,
                          color: const Color.fromRGBO(55, 182, 233, 1),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            top: 880,
            left: 164,
            child: Row(
              children: [
                Container(
                  height: 21,
                  width: 21,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    gradient: const LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      colors: [
                        Color.fromRGBO(55, 182, 233, 1),
                        Color.fromRGBO(72, 92, 236, 1),
                      ],
                    ),
                  ),
                  child: const Icon(
                    Icons.arrow_back_ios_new,
                    size: 16,
                    color: Color.fromRGBO(255, 255, 255, 1),
                  ),
                ),
                SizedBox(
                  width: 10,
                ),
                Text(
                  "Check Out",
                  style: GoogleFonts.poppins(
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                    color: const Color.fromRGBO(255, 255, 255, 1),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
