import 'package:fitness_app/workoutscreen.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:fitness_app/bottombar.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(247, 246, 250, 1),
      body: Padding(
        padding: const EdgeInsets.only(left: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 60, left: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Good Morning",
                    style: GoogleFonts.lato(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                        color: const Color.fromRGBO(25, 33, 38, 1)),
                  ),
                  Text(
                    "Ayush Godse",
                    style: GoogleFonts.lato(
                        fontSize: 24,
                        fontWeight: FontWeight.w800,
                        color: const Color.fromRGBO(25, 33, 38, 1)),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20, right: 20),
              child: TextField(
                decoration: InputDecoration(
                  hintText: "Search",
                  hintStyle: GoogleFonts.lato(
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                    color: const Color.fromRGBO(25, 33, 38, 0.5),
                  ),
                  filled: true,
                  fillColor: const Color.fromRGBO(255, 255, 255, 1),
                  border: OutlineInputBorder(
                    borderSide: BorderSide.none,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  prefixIcon: const Icon(
                    Icons.search,
                    color: Color.fromRGBO(25, 33, 38, 0.5),
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20),
              child: Text(
                "Popular Workouts",
                style: GoogleFonts.lato(
                  fontSize: 18,
                  fontWeight: FontWeight.w700,
                  color: const Color.fromRGBO(25, 33, 38, 1),
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.of(context)
                          .push(MaterialPageRoute(builder: (context) {
                        return WorkoutScreen();
                      }));
                    },
                    child: Container(
                      height: 174,
                      width: 280,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(23),
                        gradient: const LinearGradient(
                          colors: [
                            Color.fromRGBO(0, 0, 0, 0.51),
                            Color.fromRGBO(0, 0, 0, 0),
                          ],
                        ),
                        image: const DecorationImage(
                          image: AssetImage(
                              "assets/young-athletic-woman-white-headphones-training-listening-music-street-outdoors-working-lower-body-out-mat-concept-healthy-lifestyle-open-air-sport-activity-weight-loss 1.png"),
                        ),
                      ),
                      child: Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(23),
                            gradient: const LinearGradient(colors: [
                              Color.fromRGBO(53, 53, 53, 1),
                              Color.fromRGBO(75, 75, 75, 0)
                            ])),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Lower Body",
                                  style: GoogleFonts.lato(
                                    fontSize: 24,
                                    fontWeight: FontWeight.w700,
                                    color:
                                        const Color.fromRGBO(255, 255, 255, 1),
                                  ),
                                ),
                                Text(
                                  "Training",
                                  style: GoogleFonts.lato(
                                    fontSize: 24,
                                    fontWeight: FontWeight.w700,
                                    color:
                                        const Color.fromRGBO(255, 255, 255, 1),
                                  ),
                                ),
                                Container(
                                  height: 20,
                                  width: 80,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(9),
                                    color: const Color.fromRGBO(
                                        255, 255, 255, 0.8),
                                  ),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: [
                                      const Icon(
                                        Icons.water_drop_outlined,
                                        size: 14,
                                      ),
                                      Text(
                                        "500 Kcal",
                                        style: GoogleFonts.lato(
                                          fontSize: 12,
                                          fontWeight: FontWeight.w400,
                                          color: const Color.fromRGBO(
                                              25, 33, 38, 1),
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                                Container(
                                  height: 26,
                                  width: 72,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(9),
                                    color: const Color.fromRGBO(
                                        255, 255, 255, 0.8),
                                  ),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: [
                                      const Icon(
                                        Icons.timer_outlined,
                                        size: 14,
                                      ),
                                      Text(
                                        "50 Min",
                                        style: GoogleFonts.lato(
                                          fontSize: 12,
                                          fontWeight: FontWeight.w400,
                                          color: const Color.fromRGBO(
                                              25, 33, 38, 1),
                                        ),
                                      )
                                    ],
                                  ),
                                )
                              ],
                            ),
                            Container(
                              height: 38,
                              width: 38,
                              decoration: const BoxDecoration(
                                shape: BoxShape.circle,
                                color: Color.fromRGBO(187, 242, 70, 1),
                              ),
                              child: const Icon(Icons.play_arrow),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  Container(
                    height: 174,
                    width: 260,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(23),
                      gradient: const LinearGradient(
                        colors: [
                          Color.fromRGBO(0, 0, 0, 0.51),
                          Color.fromRGBO(0, 0, 0, 0),
                        ],
                      ),
                      image: const DecorationImage(
                        image: AssetImage(
                            "assets/6659b929afb015ca0f0135e1947fdc01.jpeg"),
                      ),
                    ),
                    child: Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(23),
                          gradient: const LinearGradient(colors: [
                            Color.fromRGBO(53, 53, 53, 1),
                            Color.fromRGBO(75, 75, 75, 0)
                          ])),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Hand",
                                style: GoogleFonts.lato(
                                  fontSize: 24,
                                  fontWeight: FontWeight.w700,
                                  color: const Color.fromRGBO(255, 255, 255, 1),
                                ),
                              ),
                              Text(
                                "Training",
                                style: GoogleFonts.lato(
                                  fontSize: 24,
                                  fontWeight: FontWeight.w700,
                                  color: const Color.fromRGBO(255, 255, 255, 1),
                                ),
                              ),
                              Container(
                                height: 20,
                                width: 80,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(9),
                                  color:
                                      const Color.fromRGBO(255, 255, 255, 0.8),
                                ),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    const Icon(
                                      Icons.water_drop_outlined,
                                      size: 14,
                                    ),
                                    Text(
                                      "600 Kcal",
                                      style: GoogleFonts.lato(
                                        fontSize: 12,
                                        fontWeight: FontWeight.w400,
                                        color:
                                            const Color.fromRGBO(25, 33, 38, 1),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                              Container(
                                height: 26,
                                width: 72,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(9),
                                  color:
                                      const Color.fromRGBO(255, 255, 255, 0.8),
                                ),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    const Icon(
                                      Icons.timer_outlined,
                                      size: 14,
                                    ),
                                    Text(
                                      "40 Min",
                                      style: GoogleFonts.lato(
                                        fontSize: 12,
                                        fontWeight: FontWeight.w400,
                                        color:
                                            const Color.fromRGBO(25, 33, 38, 1),
                                      ),
                                    )
                                  ],
                                ),
                              )
                            ],
                          ),
                          Container(
                            height: 38,
                            width: 38,
                            decoration: const BoxDecoration(
                              shape: BoxShape.circle,
                              color: Color.fromRGBO(187, 242, 70, 1),
                            ),
                            child: const Icon(Icons.play_arrow),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20),
              child: Text(
                "Today Plan",
                style: GoogleFonts.lato(
                  fontSize: 18,
                  fontWeight: FontWeight.w700,
                  color: const Color.fromRGBO(25, 33, 38, 1),
                ),
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(right: 20),
                child: ListView(
                  children: [
                    Container(
                      height: 120,
                      width: 350,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(23),
                        color: Color.fromRGBO(255, 255, 255, 1),
                      ),
                      child: Expanded(
                        child: Stack(children: [
                          Positioned(
                            top: 10,
                            left: 10,
                            child: Image.asset(
                              "assets/Image (1).png",
                            ),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Positioned(
                            left: 120,
                            top: 20,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Text(
                                  "Push Up",
                                  style: GoogleFonts.lato(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w500,
                                    color: const Color.fromRGBO(25, 33, 38, 1),
                                  ),
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                                Text(
                                  "100 Push up a day",
                                  style: GoogleFonts.lato(
                                    fontSize: 13,
                                    fontWeight: FontWeight.w400,
                                    color:
                                        const Color.fromRGBO(25, 33, 38, 0.5),
                                  ),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                LinearPercentIndicator(
                                  width: 260,
                                  lineHeight: 16,
                                  percent: 0.4,
                                  backgroundColor:
                                      Color.fromRGBO(242, 242, 242, 1),
                                  progressColor:
                                      Color.fromRGBO(187, 242, 70, 1),
                                  center: Text(
                                    "45%",
                                  ),
                                  animation: true,
                                  animationDuration: 2000,
                                ),
                              ],
                            ),
                          ),
                          Positioned(
                            left: 280,
                            child: Column(
                              children: [
                                Container(
                                  height: 19,
                                  width: 81,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.only(
                                      bottomRight: Radius.circular(6),
                                      bottomLeft: Radius.circular(6),
                                    ),
                                    color: Color.fromRGBO(25, 33, 38, 1),
                                  ),
                                  child: Center(
                                    child: Text(
                                      "Intermediate",
                                      style: GoogleFonts.lato(
                                        fontSize: 10,
                                        fontWeight: FontWeight.w400,
                                        color: const Color.fromRGBO(
                                            255, 255, 255, 1),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ]),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Container(
                      height: 120,
                      width: 350,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(23),
                        color: Color.fromRGBO(255, 255, 255, 1),
                      ),
                      child: Expanded(
                        child: Stack(children: [
                          Positioned(
                            top: 10,
                            left: 10,
                            child: Image.asset(
                              "assets/Mask group (1).png",
                            ),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Positioned(
                            left: 120,
                            top: 20,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Text(
                                  "Sit Up",
                                  style: GoogleFonts.lato(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w500,
                                    color: const Color.fromRGBO(25, 33, 38, 1),
                                  ),
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                                Text(
                                  "20 Sit up a day",
                                  style: GoogleFonts.lato(
                                    fontSize: 13,
                                    fontWeight: FontWeight.w400,
                                    color:
                                        const Color.fromRGBO(25, 33, 38, 0.5),
                                  ),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                LinearPercentIndicator(
                                  width: 260,
                                  lineHeight: 16,
                                  percent: 0.65,
                                  backgroundColor:
                                      Color.fromRGBO(242, 242, 242, 1),
                                  progressColor:
                                      Color.fromRGBO(187, 242, 70, 1),
                                  center: Text(
                                    "75%",
                                  ),
                                  animation: true,
                                  animationDuration: 2000,
                                ),
                              ],
                            ),
                          ),
                          Positioned(
                            left: 280,
                            child: Column(
                              children: [
                                Container(
                                  height: 19,
                                  width: 81,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.only(
                                      bottomRight: Radius.circular(6),
                                      bottomLeft: Radius.circular(6),
                                    ),
                                    color: Color.fromRGBO(25, 33, 38, 1),
                                  ),
                                  child: Center(
                                    child: Text(
                                      "Beginner",
                                      style: GoogleFonts.lato(
                                        fontSize: 10,
                                        fontWeight: FontWeight.w400,
                                        color: const Color.fromRGBO(
                                            255, 255, 255, 1),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ]),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Container(
                      height: 120,
                      width: 350,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(23),
                        color: Color.fromRGBO(255, 255, 255, 1),
                      ),
                      child: Expanded(
                        child: Stack(children: [
                          Positioned(
                            top: 10,
                            left: 10,
                            child: Image.asset(
                              "assets/Mask group.png",
                            ),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Positioned(
                            left: 120,
                            top: 20,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Text(
                                  "Knee Push Up",
                                  style: GoogleFonts.lato(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w500,
                                    color: const Color.fromRGBO(25, 33, 38, 1),
                                  ),
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                                Text(
                                  "20 Sit up a day",
                                  style: GoogleFonts.lato(
                                    fontSize: 13,
                                    fontWeight: FontWeight.w400,
                                    color:
                                        const Color.fromRGBO(25, 33, 38, 0.5),
                                  ),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                LinearPercentIndicator(
                                  width: 260,
                                  lineHeight: 16,
                                  percent: 0.4,
                                  backgroundColor:
                                      Color.fromRGBO(242, 242, 242, 1),
                                  progressColor:
                                      Color.fromRGBO(187, 242, 70, 1),
                                  center: Text(
                                    "45%",
                                  ),
                                  animation: true,
                                  animationDuration: 2000,
                                ),
                              ],
                            ),
                          ),
                          Positioned(
                            left: 280,
                            child: Column(
                              children: [
                                Container(
                                  height: 19,
                                  width: 81,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.only(
                                      bottomRight: Radius.circular(6),
                                      bottomLeft: Radius.circular(6),
                                    ),
                                    color: Color.fromRGBO(25, 33, 38, 1),
                                  ),
                                  child: Center(
                                    child: Text(
                                      "Beginner",
                                      style: GoogleFonts.lato(
                                        fontSize: 10,
                                        fontWeight: FontWeight.w400,
                                        color: const Color.fromRGBO(
                                            255, 255, 255, 1),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ]),
                      ),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
