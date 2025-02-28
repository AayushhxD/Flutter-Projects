import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Profile_Page extends StatefulWidget {
  const Profile_Page({super.key});

  @override
  State<Profile_Page> createState() => _Profile_PageState();
}

class _Profile_PageState extends State<Profile_Page> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(247, 247, 249, 1),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(left: 20, right: 20),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 70, left: 160, right: 30),
                child: Row(
                  children: [
                    Text(
                      "Profile",
                      style: GoogleFonts.poppins(
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                        color: const Color.fromRGBO(27, 30, 40, 1),
                      ),
                    ),
                    const Spacer(),
                    const Icon(
                      Icons.edit_outlined,
                      color: Color.fromRGBO(13, 110, 253, 1),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              CircleAvatar(
                maxRadius: 60,
                backgroundColor: const Color.fromRGBO(255, 223, 230, 1),
                child: Image.asset(
                  "assets/2.png",
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Text(
                "Ayush",
                style: GoogleFonts.poppins(
                  fontSize: 24,
                  fontWeight: FontWeight.w500,
                  color: const Color.fromRGBO(27, 30, 40, 1),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                "ayushgodse@gmail.com",
                style: GoogleFonts.poppins(
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                  color: const Color.fromRGBO(125, 132, 141, 1),
                ),
              ),
              const SizedBox(
                height: 40,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    height: 90,
                    width: 335,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16),
                      color: const Color.fromRGBO(255, 255, 255, 1),
                      boxShadow: const [
                        BoxShadow(
                          offset: Offset(0, 6),
                          blurRadius: 16,
                          color: Color.fromRGBO(189, 189, 211, 0.12),
                        ),
                      ],
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "Reward Points",
                              style: GoogleFonts.poppins(
                                fontSize: 13,
                                fontWeight: FontWeight.w500,
                                letterSpacing: 0.5,
                                color: const Color.fromRGBO(27, 30, 40, 1),
                              ),
                            ),
                            Text(
                              "360",
                              style: GoogleFonts.poppins(
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                                letterSpacing: 0.5,
                                color: const Color.fromRGBO(13, 110, 253, 1),
                              ),
                            ),
                          ],
                        ),
                        const Divider(
                          color: Color.fromRGBO(247, 247, 249, 1),
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "Travel Trips",
                              style: GoogleFonts.poppins(
                                fontSize: 13,
                                fontWeight: FontWeight.w500,
                                letterSpacing: 0.5,
                                color: const Color.fromRGBO(27, 30, 40, 1),
                              ),
                            ),
                            Text(
                              "238",
                              style: GoogleFonts.poppins(
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                                letterSpacing: 0.5,
                                color: const Color.fromRGBO(13, 110, 253, 1),
                              ),
                            ),
                          ],
                        ),
                        const Divider(
                          color: Color.fromRGBO(247, 247, 249, 1),
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "Bucket List",
                              style: GoogleFonts.poppins(
                                fontSize: 13,
                                fontWeight: FontWeight.w500,
                                letterSpacing: 0.5,
                                color: const Color.fromRGBO(27, 30, 40, 1),
                              ),
                            ),
                            Text(
                              "473",
                              style: GoogleFonts.poppins(
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                                letterSpacing: 0.5,
                                color: const Color.fromRGBO(13, 110, 253, 1),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 50),
              Container(
                height: 300,
                width: 335,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: const Color.fromRGBO(255, 255, 255, 1),
                  boxShadow: const [
                    BoxShadow(
                      offset: Offset(0, 6),
                      blurRadius: 16,
                      color: Color.fromRGBO(189, 189, 211, 0.12),
                    ),
                  ],
                ),
                child: Column(
                  children: [
                    ListTile(
                      leading: const Icon(
                        Icons.bookmark_outline,
                        color: Color.fromRGBO(125, 132, 141, 1),
                      ),
                      title: Text(
                        'Bookmarked',
                        style: GoogleFonts.poppins(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                          letterSpacing: 0.5,
                        ),
                      ),
                      trailing: const Icon(
                        Icons.chevron_right,
                        color: Color.fromRGBO(125, 132, 141, 1),
                      ),
                      onTap: () {},
                    ),
                    const Divider(
                      color: Color.fromRGBO(247, 247, 249, 1),
                    ),
                    ListTile(
                      leading: const Icon(
                        Icons.history,
                        color: Color.fromRGBO(125, 132, 141, 1),
                      ),
                      title: Text(
                        'Previous Trips',
                        style: GoogleFonts.poppins(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                          letterSpacing: 0.5,
                        ),
                      ),
                      trailing: const Icon(
                        Icons.chevron_right,
                        color: Color.fromRGBO(125, 132, 141, 1),
                      ),
                      onTap: () {},
                    ),
                    const Divider(
                      color: Color.fromRGBO(247, 247, 249, 1),
                    ),
                    ListTile(
                      leading: const Icon(
                        Icons.settings,
                        color: Color.fromRGBO(125, 132, 141, 1),
                      ),
                      title: Text(
                        'Settings',
                        style: GoogleFonts.poppins(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                          letterSpacing: 0.5,
                        ),
                      ),
                      trailing: const Icon(
                        Icons.chevron_right,
                        color: Color.fromRGBO(125, 132, 141, 1),
                      ),
                      onTap: () {},
                    ),
                    const Divider(
                      color: Color.fromRGBO(247, 247, 249, 1),
                    ),
                    ListTile(
                      leading: const Icon(
                        Icons.info_outline,
                        color: Color.fromRGBO(125, 132, 141, 1),
                      ),
                      title: Text(
                        'Version',
                        style: GoogleFonts.poppins(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                          letterSpacing: 0.5,
                        ),
                      ),
                      trailing: const Icon(
                        Icons.chevron_right,
                        color: Color.fromRGBO(125, 132, 141, 1),
                      ),
                      onTap: () {},
                    ),
                    const Divider(
                      color: Color.fromRGBO(247, 247, 249, 1),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
