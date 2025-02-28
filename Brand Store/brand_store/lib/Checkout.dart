import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Checkout extends StatefulWidget {
  const Checkout({super.key});

  @override
  State<Checkout> createState() => _CheckoutState();
}

class _CheckoutState extends State<Checkout> {
  void _showSuccessDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(
            "Order Successful",
            style: GoogleFonts.imprima(
              fontWeight: FontWeight.w600,
              fontSize: 20,
              color: const Color.fromRGBO(13, 13, 14, 1),
            ),
          ),
          content: Text(
            "Your order has been placed successfully!",
            style: GoogleFonts.imprima(
              fontWeight: FontWeight.w400,
              fontSize: 16,
              color: const Color.fromRGBO(13, 13, 14, 1),
            ),
          ),
          actions: [
            TextButton(
              child: Text(
                "OK",
                style: GoogleFonts.imprima(
                  fontWeight: FontWeight.w400,
                  fontSize: 16,
                  color: const Color.fromRGBO(255, 122, 0, 1),
                ),
              ),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(
          top: 50,
          left: 30,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.of(context).pop();
                  },
                  child: const Icon(
                    Icons.arrow_back_ios,
                    size: 30,
                    color: Color.fromRGBO(13, 13, 14, 1),
                  ),
                ),
                const SizedBox(
                  width: 130,
                ),
                Text(
                  "Checkout",
                  style: GoogleFonts.imprima(
                    fontWeight: FontWeight.w400,
                    fontSize: 18,
                    color: const Color.fromRGBO(13, 13, 14, 1),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 40,
            ),
            Text(
              "Delivery Address",
              style: GoogleFonts.imprima(
                fontWeight: FontWeight.w400,
                fontSize: 14,
                color: const Color.fromRGBO(121, 119, 128, 1),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.only(right: 30),
              child: Row(
                children: [
                  Image.asset("assets/Rectangle 121.png"),
                  const SizedBox(
                    width: 10,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "25/3 Housing Estate,",
                        style: GoogleFonts.imprima(
                          fontWeight: FontWeight.w400,
                          fontSize: 16,
                          color: const Color.fromRGBO(13, 13, 14, 1),
                        ),
                      ),
                      Text(
                        "Sylhet",
                        style: GoogleFonts.imprima(
                          fontWeight: FontWeight.w400,
                          fontSize: 16,
                          color: const Color.fromRGBO(13, 13, 14, 1),
                        ),
                      ),
                    ],
                  ),
                  const Spacer(),
                  Text(
                    "Change",
                    style: GoogleFonts.imprima(
                      fontWeight: FontWeight.w400,
                      fontSize: 14,
                      color: const Color.fromRGBO(121, 119, 128, 1),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            Row(
              children: [
                const Icon(
                  Icons.access_time,
                  size: 18,
                ),
                const SizedBox(
                  width: 10,
                ),
                Text(
                  "Delivered in next 7 days",
                  style: GoogleFonts.imprima(
                    fontWeight: FontWeight.w400,
                    fontSize: 16,
                    color: const Color.fromRGBO(13, 13, 14, 1),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 30,
            ),
            Text(
              "Payment Method",
              style: GoogleFonts.imprima(
                fontWeight: FontWeight.w400,
                fontSize: 15,
                color: const Color.fromRGBO(121, 119, 128, 1),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.only(right: 30),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Image.asset("assets/visa.png"),
                  Image.asset(
                      "assets/kisspng-logo-american-express-membership-rewards-organizat-2017-tigernu-brand-waterproof-15-6inch-laptop-back-5b65d997414970 1.png"),
                  Image.asset("assets/g13.png"),
                  Image.asset("assets/Group 10.png"),
                  Image.asset("assets/Vector (3).png"),
                ],
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.all(30.0),
              child: Container(
                width: 315,
                height: 54,
                decoration: const BoxDecoration(
                  color: Color.fromRGBO(252, 252, 252, 1),
                ),
                child: Center(
                  child: Text(
                    "Add Voucher",
                    style: GoogleFonts.imprima(
                      fontWeight: FontWeight.w400,
                      fontSize: 14,
                      color: const Color.fromRGBO(121, 119, 128, 1),
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.only(right: 30),
              child: Expanded(
                child: Column(
                  children: [
                    Text.rich(
                      TextSpan(
                        children: [
                          TextSpan(
                            text: "Note : ",
                            style: GoogleFonts.imprima(
                              fontWeight: FontWeight.w400,
                              fontSize: 15,
                              color: const Color.fromRGBO(255, 0, 0, 1),
                            ),
                          ),
                          TextSpan(
                            text: "Use your order id at the payment.Your Id ",
                            style: GoogleFonts.imprima(
                              fontWeight: FontWeight.w400,
                              fontSize: 15,
                              color: const Color.fromRGBO(121, 119, 128, 1),
                            ),
                          ),
                          TextSpan(
                            text: "#154619 ",
                            style: GoogleFonts.imprima(
                              fontWeight: FontWeight.w400,
                              fontSize: 15,
                              color: const Color.fromRGBO(22, 22, 38, 1),
                            ),
                          ),
                          TextSpan(
                            text:
                                "if you forget to put your order id we can't confirm the payment ",
                            style: GoogleFonts.imprima(
                              fontWeight: FontWeight.w400,
                              fontSize: 15,
                              color: const Color.fromRGBO(121, 119, 128, 1),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            Padding(
              padding: const EdgeInsets.only(right: 30),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Total Items (3)",
                        style: GoogleFonts.imprima(
                          fontWeight: FontWeight.w400,
                          fontSize: 18,
                          color: const Color.fromRGBO(121, 119, 128, 1),
                        ),
                      ),
                      Text(
                        "\$ 116.00",
                        style: GoogleFonts.imprima(
                          fontWeight: FontWeight.w400,
                          fontSize: 18,
                          color: const Color.fromRGBO(13, 13, 14, 1),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Standard Delivery",
                        style: GoogleFonts.imprima(
                          fontWeight: FontWeight.w400,
                          fontSize: 18,
                          color: const Color.fromRGBO(121, 119, 128, 1),
                        ),
                      ),
                      Text(
                        "\$ 12.00",
                        style: GoogleFonts.imprima(
                          fontWeight: FontWeight.w400,
                          fontSize: 18,
                          color: const Color.fromRGBO(13, 13, 14, 1),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Total Payment",
                        style: GoogleFonts.imprima(
                          fontWeight: FontWeight.w400,
                          fontSize: 18,
                          color: const Color.fromRGBO(121, 119, 128, 1),
                        ),
                      ),
                      Text(
                        "\$ 126.00",
                        style: GoogleFonts.imprima(
                          fontWeight: FontWeight.w400,
                          fontSize: 18,
                          color: const Color.fromRGBO(13, 13, 14, 1),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 50,
                  ),
                  GestureDetector(
                    onTap: _showSuccessDialog,
                    child: Container(
                      height: 62,
                      width: 190,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(90),
                        color: const Color.fromRGBO(255, 122, 0, 1),
                      ),
                      child: Center(
                        child: Text(
                          "Pay Now",
                          style: GoogleFonts.imprima(
                            fontWeight: FontWeight.w400,
                            fontSize: 18,
                            color: const Color.fromRGBO(255, 255, 255, 1),
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 60,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
