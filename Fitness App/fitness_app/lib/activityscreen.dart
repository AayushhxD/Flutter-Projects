import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

class ActivityScreen extends StatefulWidget {
  const ActivityScreen({super.key});

  @override
  State<ActivityScreen> createState() => _ActivityScreenState();
}

class _ActivityScreenState extends State<ActivityScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(247, 246, 250, 1),
      body: Padding(
        padding: const EdgeInsets.only(left: 40, top: 80),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "July 2022",
              style: GoogleFonts.lato(
                fontSize: 18,
                fontWeight: FontWeight.w700,
                color: Color.fromRGBO(25, 33, 38, 1),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  Container(
                    height: 46,
                    width: 45,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      color: Color.fromRGBO(187, 242, 70, 1),
                    ),
                    child: Column(
                      children: [
                        Text(
                          "S",
                          style: GoogleFonts.lato(
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                            color: Color.fromRGBO(25, 33, 38, 1),
                          ),
                        ),
                        Text(
                          "10",
                          style: GoogleFonts.lato(
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                            color: Color.fromRGBO(25, 33, 38, 1),
                          ),
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  Container(
                    height: 46,
                    width: 45,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      color: Color.fromRGBO(187, 242, 70, 1),
                    ),
                    child: Column(
                      children: [
                        Text(
                          "M",
                          style: GoogleFonts.lato(
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                            color: Color.fromRGBO(25, 33, 38, 1),
                          ),
                        ),
                        Text(
                          "11",
                          style: GoogleFonts.lato(
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                            color: Color.fromRGBO(25, 33, 38, 1),
                          ),
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  Container(
                    height: 46,
                    width: 45,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      color: Color.fromRGBO(25, 33, 38, 1),
                    ),
                    child: Column(
                      children: [
                        Text(
                          "T",
                          style: GoogleFonts.lato(
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                            color: Color.fromRGBO(255, 255, 255, 1),
                          ),
                        ),
                        Text(
                          "12",
                          style: GoogleFonts.lato(
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                            color: Color.fromRGBO(255, 255, 255, 1),
                          ),
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  Container(
                    height: 46,
                    width: 45,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      color: Color.fromRGBO(187, 242, 70, 1),
                    ),
                    child: Column(
                      children: [
                        Text(
                          "W",
                          style: GoogleFonts.lato(
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                            color: Color.fromRGBO(25, 33, 38, 1),
                          ),
                        ),
                        Text(
                          "13",
                          style: GoogleFonts.lato(
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                            color: Color.fromRGBO(25, 33, 38, 1),
                          ),
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  Container(
                    height: 46,
                    width: 45,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      color: Color.fromRGBO(187, 242, 70, 1),
                    ),
                    child: Column(
                      children: [
                        Text(
                          "T",
                          style: GoogleFonts.lato(
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                            color: Color.fromRGBO(25, 33, 38, 1),
                          ),
                        ),
                        Text(
                          "14",
                          style: GoogleFonts.lato(
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                            color: Color.fromRGBO(25, 33, 38, 1),
                          ),
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  Container(
                    height: 46,
                    width: 45,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      color: Color.fromRGBO(187, 242, 70, 1),
                    ),
                    child: Column(
                      children: [
                        Text(
                          "F",
                          style: GoogleFonts.lato(
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                            color: Color.fromRGBO(25, 33, 38, 1),
                          ),
                        ),
                        Text(
                          "15",
                          style: GoogleFonts.lato(
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                            color: Color.fromRGBO(25, 33, 38, 1),
                          ),
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  Container(
                    height: 46,
                    width: 45,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      color: Color.fromRGBO(187, 242, 70, 1),
                    ),
                    child: Column(
                      children: [
                        Text(
                          "S",
                          style: GoogleFonts.lato(
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                            color: Color.fromRGBO(25, 33, 38, 1),
                          ),
                        ),
                        Text(
                          "17",
                          style: GoogleFonts.lato(
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                            color: Color.fromRGBO(25, 33, 38, 1),
                          ),
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  Container(
                    height: 46,
                    width: 45,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      color: Color.fromRGBO(187, 242, 70, 1),
                    ),
                    child: Column(
                      children: [
                        Text(
                          "S",
                          style: GoogleFonts.lato(
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                            color: Color.fromRGBO(25, 33, 38, 1),
                          ),
                        ),
                        Text(
                          "18",
                          style: GoogleFonts.lato(
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                            color: Color.fromRGBO(25, 33, 38, 1),
                          ),
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  Container(
                    height: 46,
                    width: 45,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      color: Color.fromRGBO(187, 242, 70, 1),
                    ),
                    child: Column(
                      children: [
                        Text(
                          "M",
                          style: GoogleFonts.lato(
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                            color: Color.fromRGBO(25, 33, 38, 1),
                          ),
                        ),
                        Text(
                          "19",
                          style: GoogleFonts.lato(
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                            color: Color.fromRGBO(25, 33, 38, 1),
                          ),
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  Container(
                    height: 46,
                    width: 45,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      color: Color.fromRGBO(187, 242, 70, 1),
                    ),
                    child: Column(
                      children: [
                        Text(
                          "T",
                          style: GoogleFonts.lato(
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                            color: Color.fromRGBO(25, 33, 38, 1),
                          ),
                        ),
                        Text(
                          "20",
                          style: GoogleFonts.lato(
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                            color: Color.fromRGBO(25, 33, 38, 1),
                          ),
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
            SizedBox(
              height: 40,
            ),
            Text(
              "Today Report",
              style: GoogleFonts.lato(
                fontSize: 18,
                fontWeight: FontWeight.w700,
                color: Color.fromRGBO(25, 33, 38, 1),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Row(
              children: [
                Column(
                  children: [
                    Container(
                      height: 70,
                      width: 112,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(
                          width: 1,
                          color: Color.fromRGBO(25, 33, 38, 0.1),
                        ),
                        color: Color.fromRGBO(250, 251, 249, 1),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Active calories",
                              style: GoogleFonts.lato(
                                fontSize: 13,
                                fontWeight: FontWeight.w500,
                                color: Color.fromRGBO(25, 33, 38, 0.5),
                              ),
                            ),
                            Text(
                              "645 Cal",
                              style: GoogleFonts.lato(
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                                color: Color.fromRGBO(25, 33, 38, 1),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Container(
                      height: 132,
                      width: 112,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        color: Color.fromRGBO(234, 236, 255, 1),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Training time",
                              style: GoogleFonts.lato(
                                fontSize: 13,
                                fontWeight: FontWeight.w500,
                                color: Color.fromRGBO(25, 33, 38, 1),
                              ),
                            ),
                            CircularPercentIndicator(
                              radius: 40,
                              lineWidth: 10,
                              circularStrokeCap: CircularStrokeCap.round,
                              progressColor: Color.fromRGBO(164, 138, 237, 1),
                              backgroundColor: Color.fromRGBO(255, 255, 255, 1),
                              percent: 0.8,
                              animation: true,
                              animationDuration: 2000,
                              center: Text(
                                "80%",
                                style: GoogleFonts.lato(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w600,
                                  color: Color.fromRGBO(25, 33, 38, 1),
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  width: 15,
                ),
                Container(
                  height: 218,
                  width: 222,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: Color.fromRGBO(25, 33, 38, 1),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 10),
                        child: Row(
                          children: [
                            Container(
                              height: 28,
                              width: 28,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(3),
                                  color: Color.fromRGBO(250, 251, 249, 1),
                                  image: DecorationImage(
                                      image: AssetImage("assets/Group 4.png"))),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Text(
                              "Cycling",
                              style: GoogleFonts.lato(
                                fontSize: 18,
                                fontWeight: FontWeight.w700,
                                color: Color.fromRGBO(255, 255, 255, 1),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Image.asset("assets/Map.png"),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 20,
            ),
            Row(
              children: [
                Container(
                  height: 167,
                  width: 199,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: Color.fromRGBO(255, 235, 235, 1),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 10),
                        child: Row(
                          children: [
                            Container(
                              height: 28,
                              width: 28,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(3),
                                  color: Color.fromRGBO(249, 185, 185, 1),
                                  image: DecorationImage(
                                      image: AssetImage("assets/icon.png"))),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Text(
                              "Hearth Rate",
                              style: GoogleFonts.lato(
                                fontSize: 18,
                                fontWeight: FontWeight.w700,
                                color: Color.fromRGBO(25, 33, 38, 1),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Image.asset("assets/graph.png"),
                    ],
                  ),
                ),
                SizedBox(
                  width: 15,
                ),
                Column(
                  children: [
                    Container(
                      height: 100,
                      width: 135,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        color: Color.fromRGBO(255, 232, 198, 1),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Container(
                                  height: 28,
                                  width: 28,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(3),
                                    color: Color.fromRGBO(248, 211, 157, 1),
                                    image: DecorationImage(
                                      image: AssetImage("assets/icon (1).png"),
                                    ),
                                  ),
                                ),
                                Text(
                                  "Steps",
                                  style: GoogleFonts.lato(
                                    fontSize: 18,
                                    fontWeight: FontWeight.w700,
                                    color: Color.fromRGBO(25, 33, 38, 1),
                                  ),
                                ),
                              ],
                            ),
                            Center(
                              child: Text(
                                "999/2000",
                                style: GoogleFonts.lato(
                                  fontSize: 13,
                                  fontWeight: FontWeight.w600,
                                  color: Color.fromRGBO(25, 33, 38, 1),
                                ),
                              ),
                            ),
                            LinearPercentIndicator(
                              width: 115,
                              lineHeight: 10,
                              percent: 0.5,
                              backgroundColor: Color.fromRGBO(255, 237, 209, 1),
                              progressColor: Color.fromRGBO(252, 196, 111, 1),
                              animation: true,
                              animationDuration: 2000,
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Container(
                      height: 51,
                      width: 135,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        color: Color.fromRGBO(246, 207, 207, 1),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Keep it Up! 💪",
                              style: GoogleFonts.lato(
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                                color: Color.fromRGBO(25, 33, 38, 1),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(
              height: 20,
            ),
            Row(
              children: [
                Container(
                  height: 128,
                  width: 178,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: Color.fromRGBO(239, 226, 255, 1),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 10),
                        child: Row(
                          children: [
                            Container(
                              height: 28,
                              width: 28,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(3),
                                  color: Color.fromRGBO(214, 187, 248, 1),
                                  image: DecorationImage(
                                      image: AssetImage("assets/Vector.png"))),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Text(
                              "Sleep",
                              style: GoogleFonts.lato(
                                fontSize: 18,
                                fontWeight: FontWeight.w700,
                                color: Color.fromRGBO(25, 33, 38, 1),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Image.asset("assets/Group 26.png"),
                    ],
                  ),
                ),
                SizedBox(
                  width: 15,
                ),
                Container(
                  height: 128,
                  width: 156,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: Color.fromRGBO(216, 230, 236, 1),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 10),
                        child: Row(
                          children: [
                            Container(
                              height: 28,
                              width: 28,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(3),
                                  color: Color.fromRGBO(214, 187, 248, 1),
                                  image: DecorationImage(
                                      image:
                                          AssetImage("assets/ic_water.png"))),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Text(
                              "Water",
                              style: GoogleFonts.lato(
                                fontSize: 18,
                                fontWeight: FontWeight.w700,
                                color: Color.fromRGBO(25, 33, 38, 1),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Image.asset("assets/Group 36951.png"),
                    ],
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
