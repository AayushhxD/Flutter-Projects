
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:routegen/model/session.dart';
import 'package:routegen/view/onboarding_screen.dart';
// import 'package:flutter_svg/flutter_svg.dart';

class Welcome2Page extends StatefulWidget{
  const Welcome2Page({super.key});

  @override
  State<Welcome2Page> createState() => _LandingPageState();
}

class _LandingPageState extends State<Welcome2Page>{
  
  @override
  Widget build(BuildContext context){
      log("------------${SessionData.isLogin}------------");

    return Scaffold(
      backgroundColor: const Color.fromRGBO(255, 206, 72, 1),
      body: Padding(
        padding: const EdgeInsets.only(top: 260),
        child: Column(
          children: [
            Image.asset("asset/RG_logo.png",
            height: 80,
            width: 80,
            ),
            const SizedBox(height: 20,),
            Text("Welcome",
            style: GoogleFonts.raleway(
              fontSize: 48,
              fontWeight: FontWeight.w700,
            ),
            ),
            const SizedBox(height: 18,),
            Center(child: Text("We are now with you all the way regardless of where you are travelling in India",
            style: GoogleFonts.raleway(
              fontSize: 16,
              fontWeight: FontWeight.w500
            ),
            textAlign: TextAlign.center,
            )
            ),
            Padding(
            padding: const EdgeInsets.only(top: 210),
            child: SizedBox(
              height: 55,
              //color: Colors.red,
              width: double.infinity,
              child: Padding(
                padding: const EdgeInsets.only(left: 19, right: 19),
                child: SizedBox(
                  height: 50,
                  width: 70,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).pushReplacement(
                        MaterialPageRoute(builder: (context)=> const OnBoarding())
                      );
                    },
                    style: const ButtonStyle(
                      backgroundColor: WidgetStatePropertyAll(Colors.black),
                    ),
                    child: Text(
                      "Plan your Journey",
                      style: GoogleFonts.raleway(
                        fontSize: 22.0,
                        fontWeight: FontWeight.w600,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          )
          ],
        ),
      ),
    );
  }
}