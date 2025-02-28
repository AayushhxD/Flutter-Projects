import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
// import 'package:flutter_svg/flutter_svg.dart';

class LandingPage extends StatefulWidget{
  const LandingPage({super.key});

  @override
  State<LandingPage> createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage>{
  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('This is LandingPage for main Application'),
      ),
      body: Text('', style: GoogleFonts.quicksand(fontSize: 35),),
      backgroundColor: const Color.fromRGBO(125, 125, 125, 0.5),
    );
  }
}