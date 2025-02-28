import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HandTrainingScreen extends StatelessWidget {
  const HandTrainingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Hand Training',
          style: GoogleFonts.lato(
            fontSize: 20,
            fontWeight: FontWeight.w800,
          ),
        ),
      ),
      body: Center(
        child: Text(
          'Hand Training Exercises Here',
          style: GoogleFonts.lato(
            fontSize: 24,
            fontWeight: FontWeight.w800,
          ),
        ),
      ),
    );
  }
}
