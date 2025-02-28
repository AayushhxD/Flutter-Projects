import 'package:bicycle_app/ChooseBike.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Screen1(),
    );
  }
}

class Screen1 extends StatefulWidget {
  const Screen1({super.key});

  @override
  State<Screen1> createState() => _Screen1State();
}

class _Screen1State extends State<Screen1> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.center,
                end: Alignment.bottomRight,
                stops: [0.1, 0.0],
                colors: [
                  Color.fromRGBO(36, 44, 59, 1),
                  Color.fromRGBO(75, 76, 237, 1),
                ],
              ),
            ),
          ),
          Positioned(
            top: 815,
            left: 163,
            child: GestureDetector(
              onTap: () {
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (context) {
                  return const Choosebike();
                }));
              },
              child: Container(
                height: 76,
                width: 315,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(38),
                  color: const Color.fromRGBO(36, 44, 59, 1),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Container(
                        height: 70,
                        width: 70,
                        decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                            color: Color.fromRGBO(
                              75,
                              76,
                              237,
                              1,
                            ),
                            boxShadow: [
                              BoxShadow(
                                color: Color.fromRGBO(239, 186, 51, 1),
                                blurRadius: 10,
                                spreadRadius: 6,
                              ),
                            ]),
                        child: const Center(
                          child: Icon(
                            Icons.arrow_forward_ios,
                            size: 30,
                            color: Color.fromRGBO(255, 255, 255, 1),
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 30,
                      ),
                      Text(
                        "Get Start ",
                        style: GoogleFonts.poppins(
                            fontSize: 25,
                            fontWeight: FontWeight.w500,
                            color:const  Color.fromRGBO(255, 255, 255, 1)),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          Positioned(
            top: 340,
            child: Transform.rotate(
              angle: 90 * 3.1415926535897931 / 180,
              child: Text(
                "EXTREME",
                style: GoogleFonts.allertaStencil(
                  fontSize: 150,
                  fontWeight: FontWeight.w400,
                  color: const Color.fromRGBO(255, 255, 255, 0.2),
                ),
              ),
            ),
          ),
          Positioned(
            top: 275,
            left: 20,
            child: Center(
              child: Image.asset("assets/pngwing.png"),
            ),
          ),
          Positioned(
              top: 60, left: 176, child: Image.asset("assets/image 6.png")),
        ],
      ),
    );
  }
}
