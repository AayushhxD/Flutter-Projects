import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:project/view/payment_succesful.dart';
import 'package:project/view/product_details.dart';
import 'package:slider_button/slider_button.dart';

class Payment extends StatefulWidget {
  const Payment({super.key});

  @override
  State<Payment> createState() => _PaymentState();
}

class _PaymentState extends State<Payment> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: GestureDetector(
          onTap: () {
            // Navigator.of(context).push(MaterialPageRoute(builder: (context) {
            //   return Productscreen(
            //     fetchdata: [],
            //   );
            // }));
          },
          child: const Icon(
            Icons.arrow_back_ios,
            size: 35,
            color: Colors.white,
          ),
        ),
        toolbarHeight: 80.0,
        flexibleSpace: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.centerLeft, // Start from the left
              end: Alignment.centerRight, // End at the right
              colors: [
                Color.fromRGBO(6, 40, 30, 1),
                Color.fromRGBO(12, 81, 61, 1),
              ],
            ),
          ),
        ),
        title: Text(
          "Payment",
          style: GoogleFonts.quicksand(
            fontSize: 27,
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),
      body: Center(
          child: SliderButton(
              action: () async {
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (context) {
                  return const PaymentSuccesful();
                }));

                ///Do something here OnSlide
                return true;
              },
              label: Center(
                child: Text(
                  "Slide to Pay",
                  style: TextStyle(
                      color: Color(0xff4a4a4a),
                      fontWeight: FontWeight.w500,
                      fontSize: 17),
                ),
              ),
              icon: Icon(Icons.arrow_forward_ios))),
    );
  }
}
