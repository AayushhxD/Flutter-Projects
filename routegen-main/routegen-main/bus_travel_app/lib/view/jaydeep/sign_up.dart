import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:routegen/view/jaydeep/loginpage.dart';
import 'package:routegen/view/jaydeep/otppage.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  bool _isChecked = false;
  bool _isPasswordVisible = false;

  @override
  void dispose() {
    _usernameController.dispose();
    _passwordController.dispose();
    _phoneController.dispose();
    super.dispose();
  }

  bool _isFormValid() {
    return _usernameController.text.isNotEmpty &&
        _passwordController.text.isNotEmpty &&
        _phoneController.text.isNotEmpty &&
        _isChecked;
  }

  void _showErrorMessage() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text("Incomplete Information"),
        content: const Text("Please fill all fields and accept the terms to proceed."),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: const Text("OK"),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(255, 255, 255, 1),
      body: SingleChildScrollView(
        child: Stack(
          children: [
            Transform.scale(
              scale: 1.3,
              child: Image.asset(
                "asset/Group1.png",
                fit: BoxFit.contain,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 10, top: 122),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    "Account details",
                    style: GoogleFonts.raleway(
                      fontSize: 28,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(height: 20),
                  Text(
                    "Fill in some details about yourself to create your new account",
                    style: GoogleFonts.raleway(
                      fontSize: 15, fontWeight: FontWeight.w500),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 30.0, top: 300),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(right: 255),
                    child: Text(
                      "Username",
                      style: GoogleFonts.raleway(
                          fontSize: 14, fontWeight: FontWeight.w600),
                    ),
                  ),
                  const SizedBox(height: 5),
                  Padding(
                    padding: const EdgeInsets.only(right: 40.0),
                    child: TextField(
                      controller: _usernameController,
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.grey[100],
                        hintText: "Enter Username",
                        hintStyle: GoogleFonts.raleway(
                            fontSize: 15, fontWeight: FontWeight.w400),
                        prefixIcon: Padding(
                          padding: const EdgeInsets.only(left: 10.0),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              const Icon(Icons.person_outline_outlined),
                              Container(
                                height: 48,
                                width: 3,
                                color: Colors.white,
                                margin: const EdgeInsets.symmetric(horizontal: 8),
                              ),
                            ],
                          ),
                        ),
                        contentPadding:
                            const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                          borderSide: BorderSide.none,
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                          borderSide: BorderSide.none,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 30.0, top: 405),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(right: 260),
                    child: Text(
                      "Password",
                      style: GoogleFonts.raleway(
                          fontSize: 14, fontWeight: FontWeight.w600),
                    ),
                  ),
                  const SizedBox(height: 5),
                  Padding(
                    padding: const EdgeInsets.only(right: 40.0),
                    child: TextField(
                      controller: _passwordController,
                      obscureText: !_isPasswordVisible,
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.grey[100],
                        hintText: "Enter Password",
                        hintStyle: GoogleFonts.raleway(
                          fontSize: 15,
                          fontWeight: FontWeight.w400,
                        ),
                        suffixIcon: IconButton(
                          icon: Icon(
                            _isPasswordVisible
                                ? Icons.visibility
                                : Icons.visibility_off,
                          ),
                          onPressed: () {
                            setState(() {
                              _isPasswordVisible = !_isPasswordVisible;
                            });
                          },
                        ),
                        prefixIcon: Padding(
                          padding: const EdgeInsets.only(left: 10.0),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              const Icon(Icons.lock_outline),
                              Container(
                                height: 48,
                                width: 3,
                                color: Colors.white,
                                margin: const EdgeInsets.symmetric(horizontal: 8),
                              ),
                            ],
                          ),
                        ),
                        contentPadding:
                            const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                          borderSide: BorderSide.none,
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                          borderSide: BorderSide.none,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 30.0, top: 512),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(right: 225),
                    child: Text(
                      "Phone Number",
                      style: GoogleFonts.raleway(
                          fontSize: 14, fontWeight: FontWeight.w600),
                    ),
                  ),
                  const SizedBox(height: 5),
                  Padding(
                    padding: const EdgeInsets.only(right: 40.0),
                    child: TextField(
                      controller: _phoneController,
                      keyboardType: TextInputType.number, // Added this line
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.grey[100],
                        hintText: "Enter Phone number",
                        hintStyle: GoogleFonts.raleway(
                            fontSize: 15, fontWeight: FontWeight.w400),
                        prefixIcon: Padding(
                          padding: const EdgeInsets.only(left: 10.0),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              const Icon(Icons.smartphone_outlined),
                              Container(
                                height: 48,
                                width: 3,
                                color: Colors.white,
                                margin: const EdgeInsets.symmetric(horizontal: 8),
                              ),
                            ],
                          ),
                        ),
                        contentPadding:
                            const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                          borderSide: BorderSide.none,
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                          borderSide: BorderSide.none,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20.0, top: 615),
              child: Column(
                children: [
                  CheckboxListTile(
                    title: Text(
                      "I accept the Terms and Conditions and Privacy Policy",
                      style: GoogleFonts.raleway(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    value: _isChecked,
                    onChanged: (value) {
                      setState(() {
                        _isChecked = value!;
                      });
                    },
                    activeColor: const Color.fromRGBO(255, 136, 17, 1),
                    controlAffinity: ListTileControlAffinity.leading,
                  ),
                ],
              ),
            ),
            const SizedBox(height: 10,),
            
            Padding(
              padding: const EdgeInsets.only(top: 730),
              child: SizedBox(
                height: 55,
                width: double.infinity,
                child: Padding(
                  padding: const EdgeInsets.only(left: 19, right: 19),
                  child: SizedBox(
                    height: 50,
                    width: 70,
                    child: ElevatedButton(
                      onPressed: _isFormValid()
                          ? () async{
                            dynamic userCredentials = await firebaseAuth.createUserWithEmailAndPassword(email: _usernameController.text.trim(), password: _passwordController.text.trim());
                            // ignore: use_build_context_synchronously
                            Navigator.of(context).pushReplacement(
                              MaterialPageRoute(
                                builder: (context) => const OtpPage(),
                              ),
                            );
                            log(userCredentials);
                            }
                          : _showErrorMessage,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: _isFormValid()
                            ? const Color.fromARGB(255, 0, 0, 0)
                            : Colors.grey,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30.0),
                        ),
                      ),
                      child: Text(
                        "Carry on",
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
            ),
            Padding(
              padding: const EdgeInsets.only(top:820 ),
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 70),
                    child: Text("Already have an account?",
                    style: GoogleFonts.raleway(
                      fontSize: 17,
                      fontWeight: FontWeight.w500
                    ),
                    ),
                  ),
                  const SizedBox(width: 40,),
                  GestureDetector(
                    onTap: () => Navigator.of(context).pushReplacement(
                      MaterialPageRoute(builder: (context)=>const Loginpage())),
                    child: Text("Login",
                    style: GoogleFonts.raleway(
                      fontSize: 17,
                      fontWeight: FontWeight.w500,
                      color: Colors.blue[400]
                    ),
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}