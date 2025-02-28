import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:table_calendar/table_calendar.dart';

class Calendar_Page extends StatefulWidget {
  const Calendar_Page({super.key});

  @override
  State<Calendar_Page> createState() => _Calendar_PageState();
}

class _Calendar_PageState extends State<Calendar_Page> {
  DateTime today = DateTime.now();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(247, 247, 249, 1),
      body: Padding(
        padding: const EdgeInsets.only(left: 20, right: 20),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 67, left: 141),
              child: Row(
                children: [
                  Text(
                    "Schedule",
                    style: GoogleFonts.poppins(
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                      color: const Color.fromRGBO(27, 30, 40, 1),
                    ),
                  ),
                  Spacer(),
                  Container(
                      height: 44,
                      width: 44,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Color.fromRGBO(255, 255, 255, 1),
                      ),
                      child: Icon(Icons.notifications_outlined)),
                ],
              ),
            ),
            SizedBox(
              height: 30,
            ),
            Container(
              height: 148,
              width: 400,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                color: Color.fromRGBO(255, 255, 255, 1),
                boxShadow: const [
                  BoxShadow(
                    offset: Offset(0, 6),
                    blurRadius: 16,
                    color: Color.fromRGBO(180, 188, 201, 0.12),
                  ),
                ],
              ),
              child: TableCalendar(
                  headerStyle: HeaderStyle(
                    formatButtonVisible: false,
                  ),
                  calendarFormat: CalendarFormat.week,
                  focusedDay: today,
                  firstDay: DateTime(2000),
                  lastDay: DateTime(2030)),
            ),
            SizedBox(
              height: 40,
            ),
            Row(
              children: [
                Text(
                  "My Schedule",
                  style: GoogleFonts.poppins(
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                    color: const Color.fromRGBO(27, 30, 40, 1),
                  ),
                ),
                const Spacer(),
                Text(
                  "View all",
                  style: GoogleFonts.poppins(
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                    color: const Color.fromRGBO(13, 110, 253, 1),
                  ),
                ),
              ],
            ),
            Expanded(
              child: ListView(
                children: [
                  Container(
                    height: 100,
                    width: 335,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16),
                      color: Color.fromRGBO(255, 255, 255, 1),
                      boxShadow: const [
                        BoxShadow(
                          offset: Offset(0, 6),
                          blurRadius: 16,
                          color: Color.fromRGBO(180, 188, 201, 0.12),
                        ),
                      ],
                      image: DecorationImage(
                        alignment: Alignment.centerLeft,
                        image: AssetImage(
                          "assets/Rectangle 29 (2).png",
                        ),
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: [
                          SizedBox(
                            width: 100,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  Icon(
                                    Icons.calendar_month_outlined,
                                    color:
                                        const Color.fromRGBO(125, 132, 141, 1),
                                  ),
                                  Text(
                                    " 26 Januray 2022",
                                    style: GoogleFonts.poppins(
                                      fontSize: 13,
                                      fontWeight: FontWeight.w400,
                                      color: const Color.fromRGBO(
                                          125, 132, 141, 1),
                                    ),
                                  ),
                                ],
                              ),
                              Text(
                                "Niladri Reservoir",
                                style: GoogleFonts.poppins(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500,
                                  color: const Color.fromRGBO(27, 30, 40, 1),
                                ),
                              ),
                              Row(
                                children: [
                                  Icon(
                                    Icons.location_on_outlined,
                                    color:
                                        const Color.fromRGBO(125, 132, 141, 1),
                                  ),
                                  Text(
                                    "Tekergat, Sunamgnj",
                                    style: GoogleFonts.poppins(
                                      fontSize: 13,
                                      fontWeight: FontWeight.w400,
                                      color: const Color.fromRGBO(
                                          125, 132, 141, 1),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          Spacer(),
                          Icon(
                            Icons.chevron_right_outlined,
                            color: const Color.fromRGBO(125, 132, 141, 1),
                          )
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    height: 100,
                    width: 335,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16),
                      color: Color.fromRGBO(255, 255, 255, 1),
                      boxShadow: const [
                        BoxShadow(
                          offset: Offset(0, 6),
                          blurRadius: 16,
                          color: Color.fromRGBO(180, 188, 201, 0.12),
                        ),
                      ],
                      image: DecorationImage(
                        alignment: Alignment.centerLeft,
                        image: AssetImage(
                          "assets/Rectangle 29.png",
                        ),
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: [
                          SizedBox(
                            width: 100,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  Icon(
                                    Icons.calendar_month_outlined,
                                    color:
                                        const Color.fromRGBO(125, 132, 141, 1),
                                  ),
                                  Text(
                                    " 26 Januray 2022",
                                    style: GoogleFonts.poppins(
                                      fontSize: 13,
                                      fontWeight: FontWeight.w400,
                                      color: const Color.fromRGBO(
                                          125, 132, 141, 1),
                                    ),
                                  ),
                                ],
                              ),
                              Text(
                                "High Rech Park",
                                style: GoogleFonts.poppins(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500,
                                  color: const Color.fromRGBO(27, 30, 40, 1),
                                ),
                              ),
                              Row(
                                children: [
                                  Icon(
                                    Icons.location_on_outlined,
                                    color:
                                        const Color.fromRGBO(125, 132, 141, 1),
                                  ),
                                  Text(
                                    "Zeero Point, Sylhet",
                                    style: GoogleFonts.poppins(
                                      fontSize: 13,
                                      fontWeight: FontWeight.w400,
                                      color: const Color.fromRGBO(
                                          125, 132, 141, 1),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          Spacer(),
                          Icon(
                            Icons.chevron_right_outlined,
                            color: const Color.fromRGBO(125, 132, 141, 1),
                          )
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    height: 100,
                    width: 335,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16),
                      color: Color.fromRGBO(255, 255, 255, 1),
                      boxShadow: const [
                        BoxShadow(
                          offset: Offset(0, 6),
                          blurRadius: 16,
                          color: Color.fromRGBO(180, 188, 201, 0.12),
                        ),
                      ],
                      image: DecorationImage(
                        alignment: Alignment.centerLeft,
                        image: AssetImage(
                          "assets/Rectangle 29 (1).png",
                        ),
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: [
                          SizedBox(
                            width: 100,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  Icon(
                                    Icons.calendar_month_outlined,
                                    color:
                                        const Color.fromRGBO(125, 132, 141, 1),
                                  ),
                                  Text(
                                    " 26 Januray 2022",
                                    style: GoogleFonts.poppins(
                                      fontSize: 13,
                                      fontWeight: FontWeight.w400,
                                      color: const Color.fromRGBO(
                                          125, 132, 141, 1),
                                    ),
                                  ),
                                ],
                              ),
                              Text(
                                "Darma Reservoir",
                                style: GoogleFonts.poppins(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500,
                                  color: const Color.fromRGBO(27, 30, 40, 1),
                                ),
                              ),
                              Row(
                                children: [
                                  Icon(
                                    Icons.location_on_outlined,
                                    color:
                                        const Color.fromRGBO(125, 132, 141, 1),
                                  ),
                                  Text(
                                    "Darma, Kuningan",
                                    style: GoogleFonts.poppins(
                                      fontSize: 13,
                                      fontWeight: FontWeight.w400,
                                      color: const Color.fromRGBO(
                                          125, 132, 141, 1),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          Spacer(),
                          Icon(
                            Icons.chevron_right_outlined,
                            color: const Color.fromRGBO(125, 132, 141, 1),
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
