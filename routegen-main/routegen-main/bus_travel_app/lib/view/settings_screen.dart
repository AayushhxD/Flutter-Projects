// import 'dart:developer';

// import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:routegen/view/alerts/delete_acc_abox.dart';
import 'package:routegen/view/common_appbar.dart';
import 'package:routegen/view/bottomnav.dart';
import 'package:routegen/view/bottomSheets/privacy_sheet.dart';
import 'package:routegen/view/bottomSheets/rate_sheet.dart';
// import 'package:routegen/view/about_us_screen.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});


  @override
  State<SettingsScreen> createState() => _SettingsState();
}

class _SettingsState extends State<SettingsScreen> {

    // @override
    // void initState() {

    //   log("INIT STATE");


    //   Future.delayed(const Duration(milliseconds: 100), () async{
    //       QuerySnapshot data = await FirebaseFirestore.instance.collection('Routes').get();
    //       // log("DATA ADDED $data");
    //   });
    //   super.initState();

    // }

  List<Map<String, dynamic>> widgetList = <Map<String, dynamic>>[
    {
      'title': 'Privacy',
      'icon': const Icon(Icons.verified_user, color: Colors.white70),
      'textColor': Colors.black,
      'description': 'Protect your personal information and control your data.',
    },
    {
      'title': 'Profile',
      'icon': const Icon(Icons.account_circle_outlined, color: Colors.white70),
      'textColor': Colors.black,
      'description': 'Manage your account details and preferences.',
    },
    {
      'title': 'About Us',
      'icon': const Icon(Icons.info_outlined, color: Colors.white70),
      'textColor': Colors.black,
      'description': 'Learn more about our mission and values.',
    },
    {
      'title': 'Rate Us',
      'icon': const Icon(Icons.star, color: Colors.amber),
      'textColor': Colors.black,
      'description': 'Share your feedback and help us improve.',
    },
    {
      'title': 'Delete Account',
      'icon': Icon(Icons.delete_sweep, color: Colors.red.shade600),
      'textColor': Colors.red,
      'description': 'Permanently remove your account and data.',
    },
    {
      'title': 'Logout',
      'icon': Icon(Icons.logout_rounded, color: Colors.red.shade600),
      'textColor': Colors.red,
      'description': 'Sign out of your account.',
    },
  ];

  @override
  Widget build(BuildContext context) {
    void handleTap(int index) {
      switch (index) {
        case 0:
          showModalBottomSheet(
            context: context,
            isScrollControlled: true,
            isDismissible: true,
            builder: (context) => privacybottomSheet(context),
          );
          break;
        case 1:
          // Navigator.push(
          //   context,
          //   MaterialPageRoute(builder: (context) => const ProfileScreen()),
          // );
          // break;
        case 2:
          // Navigator.push(
          //   context,
          //   MaterialPageRoute(builder: (context) => const AboutUsScreen()),
          // );
          // break;
        case 3:
          showModalBottomSheet(
            context: context,
            isScrollControlled: true,
            isDismissible: true,
            builder: (context) => ratingBottomSheet(context),
          );
          break;
        case 4:
          showDialog(context: context, builder: (BuildContext context){
            return deleteAlert(context);
          },);
          break;
        default:
          showDialog(context: context, builder: (BuildContext context){
            return logoutAlert(context);
          },);
          break;
      }
    }

    return Scaffold(
      appBar: const CommonAppbar(isNotificationOpen: false),
      body: Container(
        padding: const EdgeInsets.only(top: 15),
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: ListView.builder(
          itemCount: widgetList.length,
          itemBuilder: (BuildContext context, int index) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                GestureDetector(
                  onTap: () => handleTap(index),
                  child: Container(
                    margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                    padding: const EdgeInsets.all(5),
                    child: Row(
                      children: [
                        Container(
                          height: 50,
                          width: 50,
                          padding: const EdgeInsets.all(10),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            color: const Color.fromRGBO(21, 26, 40, 1),
                          ),
                          child: widgetList[index]['icon'],
                        ),
                        const SizedBox(width: 15),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Text(
                                widgetList[index]['title'],
                                style: GoogleFonts.raleway(
                                  fontWeight: FontWeight.w800,
                                  fontSize: 18,
                                  color: widgetList[index]['textColor'],
                                ),
                              ),
                              SizedBox(
                                height: 35,
                                child: Text(
                                  widgetList[index]['description'],
                                  style: GoogleFonts.raleway(
                                    fontWeight: FontWeight.w500,
                                    fontSize: 12,
                                    color: widgetList[index]['textColor'],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        // const Spacer(),
                        const Icon(Icons.arrow_forward_ios),
                      ],
                    ),
                  ),
                ),
              ],
            );
          },
        ),
      ),
      bottomNavigationBar: const OneBottomnav(),
    );
  }
}