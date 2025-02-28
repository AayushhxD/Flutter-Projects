import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

Widget buildRedButton({required String title}) {
  return GestureDetector(
    onTap: () {
      // Navigator.of(context).push(
      //   MaterialPageRoute(builder: (_)=>const HomeGallery())
      // );
    },
    child: Container(
      width: 200,
      // margin: EdgeInsets.only(left: 85,right: 85,top: 20),
      alignment: Alignment.center,
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 30),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),
        color: const Color.fromRGBO(255, 46, 0, 1),
      ),

      child: Text(
        // "Get started",
        title,

        style: GoogleFonts.inter(fontSize: 20, fontWeight: FontWeight.w600),
      ),
    ),
  );
}
