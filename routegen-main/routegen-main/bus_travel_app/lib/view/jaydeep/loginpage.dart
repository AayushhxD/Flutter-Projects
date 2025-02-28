import 'dart:developer';

import 'package:routegen/model/session.dart';
import 'package:routegen/view/conductor/conductor_screen1.dart';
import 'package:routegen/view/jaydeep/Welcome2.dart';
import 'package:routegen/view/jaydeep/admin_side/admin_screen1.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:routegen/view/jaydeep/sign_up.dart';

class Loginpage extends StatefulWidget {
  const Loginpage({super.key});

  @override
  State<Loginpage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<Loginpage> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  bool _isChecked = false;
  bool _isButtonEnabled = false;
  bool _isPasswordVisible = false;
  bool _isLoading = false;

  void _validateFields() {
    setState(() {
      _isButtonEnabled = _usernameController.text.isNotEmpty &&
          _passwordController.text.isNotEmpty;
    });
  }

  void _handleLogin() async {
    setState(() {
      _isLoading = true; // Show loader before making request
    });
    final String username = _usernameController.text.trim();
    final String password = _passwordController.text.trim();
    final List<String> parts = username.split('@');
    final String endParts = parts[1];

    if (username.isNotEmpty && password.isNotEmpty) {
      try {
        UserCredential userCredential =
            await firebaseAuth.signInWithEmailAndPassword(
                email: _usernameController.text.trim(),
                password: _passwordController.text.trim());

        log(userCredential.toString());

        await SessionData.storeSessionData(
            loginData: true, emailId: userCredential.user!.email!);
        if (endParts == 'routegen.com') {
          if (parts[0] == 'wizards') {
            Navigator.of(context).pushReplacement(
                MaterialPageRoute(builder: (context) => const AdminScreen1()));
          } else {
            Navigator.of(context).pushReplacement(
              MaterialPageRoute(
                builder: (context) => ConductorScreen1(
                  conductorId: _usernameController.text.trim(),
                ),
              ),
            );
          }
        } else {
          Navigator.of(context).pushReplacement(
            MaterialPageRoute(
              builder: (context) => const Welcome2Page(),
            ),
          );
        }
      } on FirebaseAuthException catch (error) {
        log(error.code);
        _showInvalidCredentialsError(false);
      } finally {
        setState(() {
          _isLoading = false;
        });
      }
    }
  }

  void _showInvalidCredentialsError(bool isAdmin) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Invalid Credentials'),
          content: Text(
            isAdmin
                ? 'The username or password you entered is incorrect.'
                : 'The email or password you entered is incorrect.',
            style: const TextStyle(color: Colors.red),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('OK'),
            ),
          ],
        );
      },
    );
  }

  void _showErrorMessage() {
    if (!_isButtonEnabled) {
      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: const Text('Error'),
            content: const Text(
                'Please fill all fields to enable the login button.'),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: const Text('OK'),
              ),
            ],
          );
        },
      );
    }
  }

  @override
  void initState() {
    super.initState();
    _usernameController.addListener(_validateFields);
    _passwordController.addListener(_validateFields);
  }

  @override
  void dispose() {
    _usernameController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(255, 255, 255, 1),
      body: SingleChildScrollView(
        child: Stack(
          children: [
            if (_isLoading)
              const Positioned(
                top: 300, // Adjust position as needed

                left: 300, // Adjust position as needed

                child: CircularProgressIndicator(),
              ),
            Transform.scale(
              scale: 1.3,
              child: Image.asset(
                "asset/Group1.png",
                fit: BoxFit.contain,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 138),
              child: Column(
                children: [
                  Text(
                    "Welcome Back",
                    style: GoogleFonts.raleway(
                      fontSize: 28,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(height: 20),
                  Center(
                    child: Text(
                      "Access your account",
                      style: GoogleFonts.raleway(
                        fontSize: 15,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 30.0, top: 300),
              child: Column(
                children: [
                  _buildLabel("Username"),
                  const SizedBox(height: 5),
                  _buildTextField(
                    controller: _usernameController,
                    hintText: "Enter Username",
                    icon: Icons.person_outline_outlined,
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 30.0, top: 420),
              child: Column(
                children: [
                  _buildLabel("Password"),
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
                                margin:
                                    const EdgeInsets.symmetric(horizontal: 8),
                              ),
                            ],
                          ),
                        ),
                        contentPadding: const EdgeInsets.symmetric(
                            horizontal: 16, vertical: 12),
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
              padding: const EdgeInsets.only(left: 15.0, top: 520),
              child: CheckboxListTile(
                title: Row(
                  children: [
                    Text(
                      "Remember Me",
                      style: GoogleFonts.raleway(
                        fontSize: 13,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    const Spacer(),
                    Text(
                      "Forgot password?",
                      style: GoogleFonts.raleway(
                        fontSize: 13,
                        fontWeight: FontWeight.w500,
                      ),
                    )
                  ],
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
            ),
            Padding(
              padding: const EdgeInsets.only(top: 650),
              child: SizedBox(
                height: 55,
                width: double.infinity,
                child: Padding(
                  padding: const EdgeInsets.only(left: 19, right: 19),
                  child: ElevatedButton(
                    onPressed:
                        _isButtonEnabled ? _handleLogin : _showErrorMessage,
                    style: ButtonStyle(
                      backgroundColor: WidgetStatePropertyAll(
                        _isButtonEnabled ? Colors.black : Colors.grey,
                      ),
                    ),
                    child: Text(
                      "Login",
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
            Padding(
              padding: const EdgeInsets.only(top: 750),
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 95),
                    child: Text(
                      "Dont have account?",
                      style: GoogleFonts.raleway(
                          fontSize: 17, fontWeight: FontWeight.w500),
                    ),
                  ),
                  const SizedBox(
                    width: 40,
                  ),
                  GestureDetector(
                    onTap: () => Navigator.of(context).pushReplacement(
                        MaterialPageRoute(
                            builder: (context) => const SignUpPage())),
                    child: Text(
                      "SignUp",
                      style: GoogleFonts.raleway(
                          fontSize: 17,
                          fontWeight: FontWeight.w500,
                          color: Colors.blue[400]),
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

  Widget _buildLabel(String text) {
    return Padding(
      padding: const EdgeInsets.only(right: 250),
      child: Text(
        text,
        style: GoogleFonts.raleway(fontSize: 14, fontWeight: FontWeight.w600),
      ),
    );
  }

  Widget _buildTextField({
    required TextEditingController controller,
    required String hintText,
    required IconData icon,
    bool obscureText = false,
  }) {
    return Padding(
      padding: const EdgeInsets.only(right: 40.0),
      child: TextField(
        controller: controller,
        obscureText: obscureText,
        decoration: InputDecoration(
          filled: true,
          fillColor: Colors.grey[100],
          hintText: hintText,
          hintStyle: GoogleFonts.raleway(
            fontSize: 15,
            fontWeight: FontWeight.w400,
          ),
          prefixIcon: Padding(
            padding: const EdgeInsets.only(left: 10.0),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(icon),
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
    );
  }
}
