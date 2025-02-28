import "package:expensemanager/login_screen.dart";
import "package:flutter/material.dart";

class Signup_Screen extends StatefulWidget {
  const Signup_Screen({super.key});

  @override
  State createState() => _Signup_ScreenState();
}

class _Signup_ScreenState extends State {

  //Controllers 
  final TextEditingController nameController = TextEditingController();
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmpasswordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(255, 255, 255, 1),
      body: SingleChildScrollView(
        child: Container(
          height: 800,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(
                height: 60,
              ),
              // Image contaner
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
                  "Create Your Account",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: Colors.black,
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),

              ///Name text Field
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
                  controller: nameController,
                  cursorColor: Colors.black,
                  decoration: InputDecoration(
                      hintText: "Name",
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
                  validator: (value) {
                    if (nameController.text.isEmpty) {
                      return "Enter Valid Name";
                    }
                    else{
                      return null;
                    }
                  },
                ),
              ),
              const SizedBox(
                height: 20,
              ),

              ///UserName TextField
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
                  controller: usernameController,
                  cursorColor: Colors.black,
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
                  validator: (value) {
                    if (nameController.text.isEmpty) {
                      return "Enter Valid Name";
                    }
                    else{
                      return null;
                    }
                  },
                ),
              ),
              //
              const SizedBox(
                height: 20,
              ),

              ///Password TextField
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
                  controller: passwordController,
                  cursorColor: Colors.black,
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
                  validator: (value) {
                    if (passwordController.text.isEmpty) {
                      return "Enter Valid Name";
                    }else{
                      return null;
                    }
                  },
                ),
              ),
              const SizedBox(
                height: 20,
              ),

              ///Coonfirm password
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
                  controller: confirmpasswordController,
                  cursorColor: Colors.black,
                  decoration: InputDecoration(
                      hintText: "Confirm Password",
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
                  validator: (value) {
                    if (nameController.text.isEmpty) {
                      return "Enter Valid Name";
                    }
                    else{
                      return null;
                    }
                  },
                ),
              ),
              const SizedBox(
                height: 20,
              ),

              /// Singn Up button
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const Login_Screen()),
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
                    child: Text("Sign Up",
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
                    "Already have an account? ",
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
                            builder: (context) => const Login_Screen(),
                          ));
                    },
                    child: const Text(
                      "Sign In",
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
                height: 30,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
