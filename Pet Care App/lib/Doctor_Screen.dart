import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pet_care_app/Dashboard.dart';

class Doctor_Screen extends StatefulWidget {
  const Doctor_Screen({super.key});

  @override
  State<Doctor_Screen> createState() => _Doctor_ScreenState();
}

class _Doctor_ScreenState extends State<Doctor_Screen> {
  String selectedDate = '';
  String selectedTime = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(245, 146, 69, 1),
      body: Column(
        children: [
          Padding(
            padding:
                const EdgeInsets.only(top: 55, bottom: 15, left: 24, right: 24),
            child: Row(
              children: [
                Container(
                  height: 26,
                  width: 26,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: Color.fromRGBO(225, 255, 255, 1),
                    boxShadow: const [
                      BoxShadow(
                        offset: Offset(0, 8),
                        blurRadius: 18,
                        spreadRadius: -4,
                        color: Color.fromRGBO(22, 34, 51, 0.08),
                      ),
                    ],
                  ),
                  child: Center(
                    child: GestureDetector(
                      onTap: () {
                        Navigator.of(context)
                            .push(MaterialPageRoute(builder: (context) {
                          return Dashboard();
                        }));
                      },
                      child: Icon(
                        Icons.arrow_back_ios_new,
                        color: Color.fromRGBO(245, 146, 69, 1),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  width: 120,
                ),
                Text(
                  "Veterinary",
                  style: GoogleFonts.poppins(
                    fontWeight: FontWeight.w500,
                    fontSize: 16,
                    color: Color.fromRGBO(225, 255, 255, 1),
                  ),
                ),
              ],
            ),
          ),
          Container(
            decoration: BoxDecoration(boxShadow: [
              BoxShadow(
                  offset: Offset(0, 10),
                  blurRadius: 10,
                  spreadRadius: 0,
                  color: Color.fromRGBO(22, 34, 51, 0.04))
            ]),
            child: Image.asset("assets/image (12).png"),
          ),
          Container(
            height: 635,
            width: double.infinity,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(32),
                topRight: Radius.circular(32),
              ),
              color: Color.fromRGBO(255, 255, 255, 1),
            ),
            child: Padding(
              padding: const EdgeInsets.only(top: 30, left: 24, right: 24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(
                    "Dr.Anna Jhonason",
                    style: GoogleFonts.poppins(
                      fontWeight: FontWeight.w500,
                      fontSize: 24,
                      color: Color.fromRGBO(0, 0, 0, 1),
                    ),
                  ),
                  Text(
                    "Veterinary Behavioral",
                    style: GoogleFonts.poppins(
                      fontWeight: FontWeight.w400,
                      fontSize: 12,
                      color: Color.fromRGBO(194, 195, 204, 1),
                    ),
                  ),
                  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(
                            top: 8, left: 16, right: 16, bottom: 8),
                        child: Container(
                          height: 62,
                          width: 85,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              boxShadow: [
                                BoxShadow(
                                  offset: Offset(0, 11),
                                  blurRadius: 25,
                                  spreadRadius: 0,
                                  color: Color.fromRGBO(
                                    22,
                                    34,
                                    51,
                                    0.08,
                                  ),
                                ),
                              ],
                              color: Color.fromRGBO(255, 255, 255, 1)),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "Experience",
                                style: GoogleFonts.poppins(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 12,
                                  color: Color.fromRGBO(31, 32, 41, 1),
                                ),
                              ),
                              Text(
                                "11 Years",
                                style: GoogleFonts.poppins(
                                  fontWeight: FontWeight.w600,
                                  fontSize: 16,
                                  color: Color.fromRGBO(245, 146, 69, 1),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                            top: 8, left: 16, right: 16, bottom: 8),
                        child: Container(
                          height: 62,
                          width: 98.67,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              boxShadow: [
                                BoxShadow(
                                  offset: Offset(0, 11),
                                  blurRadius: 25,
                                  spreadRadius: 0,
                                  color: Color.fromRGBO(
                                    22,
                                    34,
                                    51,
                                    0.08,
                                  ),
                                ),
                              ],
                              color: Color.fromRGBO(255, 255, 255, 1)),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "Price",
                                style: GoogleFonts.poppins(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 12,
                                  color: Color.fromRGBO(31, 32, 41, 1),
                                ),
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(
                                    Icons.attach_money_sharp,
                                    size: 20,
                                    color: Color.fromRGBO(245, 146, 69, 1),
                                  ),
                                  Text(
                                    "250",
                                    style: GoogleFonts.poppins(
                                      fontWeight: FontWeight.w600,
                                      fontSize: 16,
                                      color: Color.fromRGBO(245, 146, 69, 1),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                            top: 8, left: 16, right: 16, bottom: 8),
                        child: Container(
                          height: 62,
                          width: 98.67,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              boxShadow: [
                                BoxShadow(
                                  offset: Offset(0, 11),
                                  blurRadius: 25,
                                  spreadRadius: 0,
                                  color: Color.fromRGBO(
                                    22,
                                    34,
                                    51,
                                    0.08,
                                  ),
                                ),
                              ],
                              color: Color.fromRGBO(255, 255, 255, 1)),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "Location",
                                style: GoogleFonts.poppins(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 12,
                                  color: Color.fromRGBO(31, 32, 41, 1),
                                ),
                              ),
                              Text(
                                "2.5 Km ",
                                style: GoogleFonts.poppins(
                                  fontWeight: FontWeight.w600,
                                  fontSize: 16,
                                  color: Color.fromRGBO(245, 146, 69, 1),
                                ),
                              ),
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                  Text(
                    "About",
                    style: GoogleFonts.poppins(
                      fontWeight: FontWeight.w500,
                      fontSize: 14,
                      color: Color.fromRGBO(0, 0, 0, 1),
                    ),
                  ),
                  Text(
                    "Dr. Anna Jhonason is a highly experienced Veterinarian with years of dedicated practice, showcasing a pro... ",
                    style: GoogleFonts.poppins(
                      fontWeight: FontWeight.w400,
                      fontSize: 12,
                      color: Color.fromRGBO(194, 195, 204, 1),
                    ),
                  ),
                  Text(
                    "Available Days",
                    style: GoogleFonts.poppins(
                      fontWeight: FontWeight.w500,
                      fontSize: 14,
                      color: Color.fromRGBO(0, 0, 0, 1),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            selectedDate = "Fri, 6";
                          });
                        },
                        child: Container(
                          height: 36,
                          width: 60,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(100),
                            border: Border.all(
                              color: selectedDate == "Fri, 6"
                                  ? Color.fromRGBO(245, 146, 69, 1)
                                  : Color.fromRGBO(225, 225, 225, 1),
                            ),
                          ),
                          child: Center(
                            child: Text(
                              "Fri, 6",
                              style: GoogleFonts.poppins(
                                fontWeight: FontWeight.w400,
                                fontSize: 12,
                                color: selectedDate == "Fri, 6"
                                    ? Color.fromRGBO(245, 146, 69, 1)
                                    : Color.fromRGBO(194, 195, 204, 1),
                              ),
                            ),
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            selectedDate = "Sat, 7";
                          });
                        },
                        child: Container(
                          height: 36,
                          width: 60,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(100),
                            border: Border.all(
                              color: selectedDate == "Sat, 7"
                                  ? Color.fromRGBO(245, 146, 69, 1)
                                  : Color.fromRGBO(225, 225, 225, 1),
                            ),
                          ),
                          child: Center(
                            child: Text(
                              "Sat, 7",
                              style: GoogleFonts.poppins(
                                fontWeight: FontWeight.w400,
                                fontSize: 12,
                                color: selectedDate == "Sat, 7"
                                    ? Color.fromRGBO(245, 146, 69, 1)
                                    : Color.fromRGBO(194, 195, 204, 1),
                              ),
                            ),
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            selectedDate = "Sun, 8";
                          });
                        },
                        child: Container(
                          height: 36,
                          width: 60,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(100),
                            border: Border.all(
                              color: selectedDate == "Sun, 8"
                                  ? Color.fromRGBO(245, 146, 69, 1)
                                  : Color.fromRGBO(225, 225, 225, 1),
                            ),
                          ),
                          child: Center(
                            child: Text(
                              "Sun, 8",
                              style: GoogleFonts.poppins(
                                fontWeight: FontWeight.w400,
                                fontSize: 12,
                                color: selectedDate == "Sun, 8"
                                    ? Color.fromRGBO(245, 146, 69, 1)
                                    : Color.fromRGBO(194, 195, 204, 1),
                              ),
                            ),
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            selectedDate = "Mon, 9";
                          });
                        },
                        child: Container(
                          height: 36,
                          width: 60,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(100),
                            border: Border.all(
                              color: selectedDate == "Mon, 9"
                                  ? Color.fromRGBO(245, 146, 69, 1)
                                  : Color.fromRGBO(225, 225, 225, 1),
                            ),
                          ),
                          child: Center(
                            child: Text(
                              "Mon, 9",
                              style: GoogleFonts.poppins(
                                fontWeight: FontWeight.w400,
                                fontSize: 12,
                                color: selectedDate == "Mon, 9"
                                    ? Color.fromRGBO(245, 146, 69, 1)
                                    : Color.fromRGBO(194, 195, 204, 1),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Text(
                    "Available Time",
                    style: GoogleFonts.poppins(
                      fontWeight: FontWeight.w500,
                      fontSize: 14,
                      color: Color.fromRGBO(0, 0, 0, 1),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            selectedTime = "9:00 AM";
                          });
                        },
                        child: Container(
                          height: 36,
                          width: 60,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(100),
                            border: Border.all(
                              color: selectedTime == "9:00 AM"
                                  ? Color.fromRGBO(245, 146, 69, 1)
                                  : Color.fromRGBO(225, 225, 225, 1),
                            ),
                          ),
                          child: Center(
                            child: Text(
                              "9:00 AM",
                              style: GoogleFonts.poppins(
                                fontWeight: FontWeight.w400,
                                fontSize: 12,
                                color: selectedTime == "9:00 AM"
                                    ? Color.fromRGBO(245, 146, 69, 1)
                                    : Color.fromRGBO(194, 195, 204, 1),
                              ),
                            ),
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            selectedTime = "11:00 AM";
                          });
                        },
                        child: Container(
                          height: 36,
                          width: 60,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(100),
                            border: Border.all(
                              color: selectedTime == "11:00 AM"
                                  ? Color.fromRGBO(245, 146, 69, 1)
                                  : Color.fromRGBO(225, 225, 225, 1),
                            ),
                          ),
                          child: Center(
                            child: Text(
                              "11:00 AM",
                              style: GoogleFonts.poppins(
                                fontWeight: FontWeight.w400,
                                fontSize: 12,
                                color: selectedTime == "11:00 AM"
                                    ? Color.fromRGBO(245, 146, 69, 1)
                                    : Color.fromRGBO(194, 195, 204, 1),
                              ),
                            ),
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            selectedTime = "1:00 PM";
                          });
                        },
                        child: Container(
                          height: 36,
                          width: 60,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(100),
                            border: Border.all(
                              color: selectedTime == "1:00 PM"
                                  ? Color.fromRGBO(245, 146, 69, 1)
                                  : Color.fromRGBO(225, 225, 225, 1),
                            ),
                          ),
                          child: Center(
                            child: Text(
                              "1:00 PM",
                              style: GoogleFonts.poppins(
                                fontWeight: FontWeight.w400,
                                fontSize: 12,
                                color: selectedTime == "1:00 PM"
                                    ? Color.fromRGBO(245, 146, 69, 1)
                                    : Color.fromRGBO(194, 195, 204, 1),
                              ),
                            ),
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            selectedTime = "3:00 PM";
                          });
                        },
                        child: Container(
                          height: 36,
                          width: 60,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(100),
                            border: Border.all(
                              color: selectedTime == "3:00 PM"
                                  ? Color.fromRGBO(245, 146, 69, 1)
                                  : Color.fromRGBO(225, 225, 225, 1),
                            ),
                          ),
                          child: Center(
                            child: Text(
                              "3:00 PM",
                              style: GoogleFonts.poppins(
                                fontWeight: FontWeight.w400,
                                fontSize: 12,
                                color: selectedTime == "3:00 PM"
                                    ? Color.fromRGBO(245, 146, 69, 1)
                                    : Color.fromRGBO(194, 195, 204, 1),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  GestureDetector(
                    onTap: () {
                      if (selectedDate.isNotEmpty && selectedTime.isNotEmpty) {
                        showDialog(
                          context: context,
                          builder: (context) {
                            return AlertDialog(
                              title: Text(
                                'Booking Confirmed',
                                style: GoogleFonts.poppins(),
                              ),
                              content: Text(
                                'Your appointment with Dr. Anna Jhonason is booked for $selectedDate at $selectedTime.',
                                style: GoogleFonts.poppins(),
                              ),
                              actions: [
                                TextButton(
                                  onPressed: () {
                                    Navigator.of(context).pop();
                                  },
                                  child: Text(
                                    'OK',
                                    style: GoogleFonts.poppins(),
                                  ),
                                ),
                              ],
                            );
                          },
                        );
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text(
                                'Please select both a date and time for booking.'),
                          ),
                        );
                      }
                    },
                    child: Container(
                      height: 52,
                      width: 380,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(24),
                        color: Color.fromRGBO(245, 146, 69, 1),
                      ),
                      child: Center(
                        child: Text(
                          "Book Now",
                          style: GoogleFonts.poppins(
                            fontWeight: FontWeight.w500,
                            fontSize: 14,
                            color: Color.fromRGBO(255, 255, 255, 1),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
