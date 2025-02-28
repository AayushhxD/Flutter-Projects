import 'package:expensemanager/home_screen.dart';
import 'package:flutter/material.dart';
import 'signup_screen.dart';

class Login_Screen extends StatefulWidget {
  const Login_Screen({super.key});

  @override
  State createState() => _LoginScreenState();
}

class _LoginScreenState extends State {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(255, 255, 255, 1),
      body: SingleChildScrollView(
        child: Container(
          height: 800,
          child: Column(
            children: [
              const SizedBox(
                height: 60,
              ),
              Container(
                alignment: Alignment.topCenter,
                margin: const EdgeInsets.all(20),
                child: Center(
                  child: Image.asset(
                    "assets/Images/logo.png",
                    height: 85,
                    width: 90,
                  ),
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              Container(
                alignment: Alignment.center,
                child: const Text(
                  "Login Your Account",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: Colors.black,
                  ),
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              //Username  Text Filed
              Container(
                height: 49,
                width: 280,
                decoration: const BoxDecoration(
                    borderRadius: BorderRadius.all(
                      Radius.circular(9),
                    ),
                    color: Color.fromRGBO(255, 255, 255, 1),
                    boxShadow: [
                      BoxShadow(
                          color: Color.fromRGBO(0, 0, 0, 0.15),
                          blurRadius: 10,
                          spreadRadius: 3)
                    ]),
                child: TextFormField(
                  //controller: r,
                  decoration: InputDecoration(
                      hintText: "Username",
                      border: OutlineInputBorder(
                        borderSide: const BorderSide(
                            color: Color.fromRGBO(255, 255, 255, 1)),
                        borderRadius: BorderRadius.circular(9),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: const BorderSide(
                            color: Color.fromRGBO(255, 255, 255, 1)),
                        borderRadius: BorderRadius.circular(9),
                      ),
                      focusedBorder: const OutlineInputBorder(
                        borderSide:
                            BorderSide(color: Color.fromRGBO(255, 255, 255, 1)),
                      )),
                  //  validator: (value) {
                  //    if(usernameController==null){
                  //      return "Enter Valid Name";
                  //    }
                  //  },
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Container(
                height: 49,
                width: 280,
                decoration: const BoxDecoration(
                    borderRadius: BorderRadius.all(
                      Radius.circular(9),
                    ),
                    color: Color.fromRGBO(255, 255, 255, 1),
                    boxShadow: [
                      BoxShadow(
                          color: Color.fromRGBO(0, 0, 0, 0.15),
                          blurRadius: 10,
                          spreadRadius: 3)
                    ]),
                child: TextFormField(
                  //  controller: passwordController,
                  obscureText: true,
                  obscuringCharacter: "*",
                  decoration: InputDecoration(
                      hintText: "Password",
                      border: OutlineInputBorder(
                        borderSide: const BorderSide(
                            color: Color.fromRGBO(255, 255, 255, 1)),
                        borderRadius: BorderRadius.circular(9),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: const BorderSide(
                            color: Color.fromRGBO(255, 255, 255, 1)),
                        borderRadius: BorderRadius.circular(9),
                      ),
                      focusedBorder: const OutlineInputBorder(
                        borderSide:
                            BorderSide(color: Color.fromRGBO(255, 255, 255, 1)),
                      )),
                  //  validator: (value) {
                  //    if(passwordController==null){
                  //      return "Enter Valid Name";
                  //    }
                  //  },
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const home_screen()),
                  );
                },
                child: Container(
                  height: 49,
                  width: 280,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(9),
                    color: const Color.fromRGBO(14, 161, 125, 1),
                  ),
                  child: const Center(
                    child: Text("Sign In",
                        style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w600,
                            color: Colors.white)),
                  ),
                ),
              ),
              const Spacer(),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    "Don’t have an account? ",
                    style: TextStyle(
                      fontSize: 13,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const Signup_Screen()));
                    },
                    child: const Text(
                      "Sign Up",
                      style: TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.w400,
                        color: Color.fromRGBO(14, 161, 125, 1),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 40,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
