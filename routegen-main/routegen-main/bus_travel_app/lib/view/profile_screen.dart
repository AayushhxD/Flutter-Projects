import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

import 'package:routegen/view/onboarding_screen.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => ProfilePagestate();
}


class ProfilePagestate extends State<ProfilePage> {
  File? selectedImage; // To store the selected image

  final ImagePicker _picker = ImagePicker();

  // Method to pick an image from the gallery
  Future<void> _pickImage() async {
    final pickedFile = await _picker.pickImage(source: ImageSource.gallery);
    setState(() {
      if(pickedFile != null){
        selectedImage = File(pickedFile.path); // Update state with the new image
      }else{
        selectedImage = File('asset/Group1.png');
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          Transform.scale(
            scale: 1.3,
            child: Image.asset(
              "asset/Group1.png",
              fit: BoxFit.contain,
            ),
          ),

          /// This is Skip button at right bottom...
          Positioned(
            bottom: 25, right: 20,
            child: GestureDetector(
              onTap: (){
                selectedImage = File('asset/Group1.svg');
                Navigator.of(context).pushReplacement(
                  MaterialPageRoute(builder: (context)=> const OnBoarding())
                );
              },
              child: Container(
                alignment: Alignment.center,
                height: 30,width: 80,
                decoration: BoxDecoration(
                  border: Border.all(width: 0.5),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Text('Skip', style: GoogleFonts.raleway(
                  fontSize: 15,
                  color: Colors.black54,
                ))
                        ),
            ),),

          Padding(
            padding: const EdgeInsets.only(top: 140),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Center(
                  child: Text(
                    "Profile picture",
                    style: GoogleFonts.raleway(
                      fontSize: 28,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                const SizedBox(height: 30),
                Center(
                  child: Text(
                    "Fill in some details about yourself to create your new account.",
                    textAlign: TextAlign.center,
                    style: GoogleFonts.raleway(
                        fontSize: 16, fontWeight: FontWeight.w500),
                  ),
                ),
              ],
            ),
          ),
          Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 310.0),
                child: Container(
                  height: 300,
                  width: 300,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.white,
                    border: Border.all(
                      color: const Color.fromRGBO(255, 136, 17, 1),
                      width: 7,
                    ),
                  ),
                  child: Center(
                    child: Container(
                      height: 256,
                      width: 256,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: const Color.fromRGBO(245, 245, 245, 1),
                        border: Border.all(
                          color: Colors.white,
                          width: 7,
                        ),
                      ),
                      child: Center(
                        child: selectedImage == null
                            ? SvgPicture.asset("asset/Icons.svg")
                            : ClipOval(child: 
                              Image.file(selectedImage!, fit: BoxFit.cover,height: 256,width: 256,)
                            ),
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 30.0, left: 80),
                child: Row(
                  children: [
                    GestureDetector(
                      onTap:(){
                        Navigator.of(context).pushReplacement(
                          MaterialPageRoute(builder: (context)=> const OnBoarding())
                        );
                      },
                      child: Container(
                        height: 55,
                        width: 55,
                        decoration: const BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(15)),
                          color: Colors.black,
                        ),
                        child: Center(
                          child: SvgPicture.asset(
                            "asset/camera_Icon.svg",
                            height: 40,
                            width: 40,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(width: 20),
                    GestureDetector(
                      onTap: _pickImage, // Call the image picker on tap
                      child: Container(
                        height: 55,
                        width: 120,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          border: Border.all(
                            color: Colors.black,
                            width: 1.7,
                          ),
                          borderRadius: const BorderRadius.all(Radius.circular(15)),
                        ),
                        child: Center(
                          child: Text(
                            "Select Image",
                            style: GoogleFonts.raleway(
                                fontSize: 14,
                                fontWeight: FontWeight.w700,
                                color: Colors.black),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
