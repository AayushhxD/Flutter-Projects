import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:routegen/model/session.dart';
import 'package:routegen/view/jaydeep/loginpage.dart';
import 'package:routegen/view/jaydeep/sign_up.dart';

Widget deleteAlert(BuildContext context){
  return AlertDialog(
    title: Text(
      'Confirm!',
      textAlign: TextAlign.center,
      style: GoogleFonts.raleway(
        fontWeight: FontWeight.w700,
        color: Colors.red,
      ),
    ),
    content: Text(
      'Delete account and leave app?, this may delete your data from servers.',
      style: GoogleFonts.raleway(),
    ),
    actions: [
      TextButton(
        onPressed: () => Navigator.pop(context),
        child: Text(
          'Cancle',
          style: GoogleFonts.raleway(color: Colors.black54),
        ),
      ),
      TextButton(
        onPressed: (){
          /// DELETE ALL THE ACCOUNT DETAILS
          /// FROM DATABASE...
          Navigator.of(context).pushAndRemoveUntil(
            MaterialPageRoute(builder:(context) => const SignUpPage()),
            (Route<dynamic> route)=>false,
          );
        },
        child: Text(
          'Delete',
          style: GoogleFonts.raleway(fontWeight: FontWeight.w800),
        ),
      ),
    ],
  );
}

Widget logoutAlert(context){
  return AlertDialog(
    title: Text(
      'Logout?',
      textAlign: TextAlign.center,
      style: GoogleFonts.raleway(
        fontWeight: FontWeight.w700,
        color: Colors.red,
      ),
    ),
    content: Text(
      'Confirm your Logout action...',
      style: GoogleFonts.raleway(),
    ),
    actions: [
      TextButton(
        onPressed: () => Navigator.pop(context),
        child: Text(
          'Cancle',
          style: GoogleFonts.raleway(color: Colors.black54),
        ),
      ),
      TextButton(
        onPressed: (){
          /// JUST LOGOUT AND REMOVE ALL RUNNING 
          /// SCREENS FROM BACKGROUND
          SessionData.isLogin = false;
          Navigator.of(context).pushAndRemoveUntil(
            MaterialPageRoute(builder:(context) => const Loginpage()),
            (Route<dynamic> route)=> false,
          );
        },
        child: Text(
          'Logout',
          style: GoogleFonts.raleway(fontWeight: FontWeight.w600,
          fontSize: 15,
          color: Colors.red,
          ),
        ),
      ),
    ],
  );
}