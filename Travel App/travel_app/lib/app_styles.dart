import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppStyles {
  // Method for text styles
  static TextStyle textStyle(
      {double fontSize = 14,
      Color color = Colors.black,
      FontWeight fontWeight = FontWeight.normal}) {
    return GoogleFonts.poppins(
      fontSize: fontSize,
      color: color,
      fontWeight: fontWeight,
    );
  }

  // Method for button styles
  static final ButtonStyle buttonStyle = ElevatedButton.styleFrom(
    backgroundColor:
        const Color.fromRGBO(13, 110, 253, 1), // Button background color
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(12), // Rounded corners
    ),
    padding: const EdgeInsets.symmetric(
        vertical: 12, horizontal: 24), // Button padding
  );
}
