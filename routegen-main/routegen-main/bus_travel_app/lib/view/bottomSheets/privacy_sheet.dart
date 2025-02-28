import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

Widget privacybottomSheet(context){
  return Padding(
    padding: const EdgeInsets.all(5),
    child: Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        SizedBox(
          height: 5, width: MediaQuery.of(context).size.width,
        ),
        Container(
          margin: const EdgeInsets.only(top: 10, bottom: 15),
          height: 3, width: 30,
          decoration: BoxDecoration(
            color: Colors.black26,
            borderRadius: BorderRadius.circular(5),
          ),
        ),
        Text(
          'Privacy Policy',
          style: GoogleFonts.raleway(
            fontSize: 22,
            fontWeight: FontWeight.w700,
          ),
        ),
        const SizedBox(height: 50),
      ],),
  );
}