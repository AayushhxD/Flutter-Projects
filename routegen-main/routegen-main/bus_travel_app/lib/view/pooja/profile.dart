import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:routegen/view/common_appbar.dart';
import 'package:routegen/view/bottomnav.dart';


class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  // Controllers to capture user input
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _fullnameController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CommonAppbar(isNotificationOpen: false),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Profile edit section with camera icon
            Container(
              color: const Color.fromRGBO(255, 206, 72, 1),
              padding: const EdgeInsets.symmetric(vertical: 8.0,
               horizontal: 138.0),
              height: 300,
              child: const Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CircleAvatar(
                    radius: 60,
                    backgroundColor: Colors.white,
                    child: Icon(Icons.image, size: 30, color: Colors.black),
                  ),
                  SizedBox(height: 10),
                  Text(
                    "Edit your profile below",
                    style: TextStyle(
                      color: Colors.black,
                     fontSize: 13),
                  ),
                ],
              ),
            ),
            // Profile fields section
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Field for "Username"
                   Text(
                    "Username",
                    style: GoogleFonts.raleway(
                      color: Colors.black54,
                      fontSize: 14,
                    ),
                  ),
                  const SizedBox(height: 8),
                  TextField(
                    controller: _usernameController,
                    decoration: InputDecoration(
                      prefixIcon: const Icon(Icons.person, color: Colors.black54),
                      hintText: "Enter your username",
                      filled: true,
                      fillColor: Colors.grey[100],
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: BorderSide.none,
                      ),
                    ),
                  ),
                  const SizedBox(height: 16),
        
                  // Field for "Full Name"
                   Text(
                    "Full Name",
                    style: GoogleFonts.raleway(
                      color: Colors.black54,
                      fontSize: 14,
                    ),
                  ),
                  const SizedBox(height: 8),
                  TextField(
                    controller: _fullnameController,
                    decoration: InputDecoration(
                      prefixIcon: const Icon(Icons.person, color: Colors.black54),
                      hintText: "Enter your full name",
                      filled: true,
                      fillColor: Colors.grey[100],
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: BorderSide.none,
                      ),
                    ),
                  ),
                  const SizedBox(height: 16),
        
                  // Field for "Telephone Number"
                   Text(
                    "Telephone Number",
                    style: GoogleFonts.raleway(
                      color: Colors.black54,
                      fontSize: 14,
                    ),
                  ),
                  const SizedBox(height: 8),
                  TextField(
                    controller: _phoneController,
                    keyboardType: TextInputType.phone,
                    decoration: InputDecoration(
                      prefixIcon: const Icon(Icons.phone, color: Colors.black54),
                      hintText: "Enter your phone number",
                      filled: true,
                      fillColor: Colors.grey[100],
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: BorderSide.none,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      // Bottom navigation bar
      bottomNavigationBar: const OneBottomnav(),
    );
  }

  
}
