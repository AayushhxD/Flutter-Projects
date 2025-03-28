import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ProfileSettingScreen extends StatefulWidget {
  const ProfileSettingScreen({super.key});

  @override
  State<ProfileSettingScreen> createState() => _ProfileSettingScreenState();
}

class _ProfileSettingScreenState extends State<ProfileSettingScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(255, 255, 255, 1),
      appBar: AppBar(
        backgroundColor: const Color.fromRGBO(255, 255, 255, 1),
        leading: GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: Row(
            children: [
              const SizedBox(
                width: 10,
              ),
              const Icon(
                Icons.arrow_back_ios,
                size: 12,
                color: Color.fromRGBO(29, 98, 202, 1),
              ),
              Text(
                "Back",
                style: GoogleFonts.sora(
                  fontWeight: FontWeight.w600,
                  fontSize: 16,
                  color: const Color.fromRGBO(29, 98, 202, 1),
                ),
              ),
            ],
          ),
        ),
        leadingWidth: 70,
        centerTitle: true,
        title: Text(
          "Profile Settings",
          style: GoogleFonts.sora(
            fontWeight: FontWeight.w600,
            fontSize: 16,
            color: const Color.fromRGBO(25, 25, 25, 1),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 16, right: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(
              height: 50,
            ),
            Stack(
              children: [
                Container(
                  height: 100,
                  width: 100,
                  decoration: BoxDecoration(
                      image: const DecorationImage(
                          image:
                              AssetImage("assets/profile_pic/profile_pic.png"),
                          fit: BoxFit.fill),
                      shape: BoxShape.circle,
                      border: Border.all(
                          width: 2,
                          color: const Color.fromRGBO(79, 188, 168, 1))),
                ),
                const Positioned(
                  right: 0,
                  bottom: 0,
                  child: Image(
                    image: AssetImage("assets/shield.png"),
                    height: 24,
                    width: 24,
                    fit: BoxFit.fill,
                  ),
                )
              ],
            ),
            const SizedBox(
              height: 8,
            ),
            Text(
              "Ayush Godse",
              style: GoogleFonts.sora(
                fontWeight: FontWeight.w600,
                fontSize: 14,
                color: const Color.fromRGBO(25, 25, 25, 1),
              ),
            ),
            Text(
              "Joined 1 years ago",
              style: GoogleFonts.sora(
                fontWeight: FontWeight.w400,
                fontSize: 12,
                color: const Color.fromRGBO(120, 131, 141, 1),
              ),
            ),
            const SizedBox(
              height: 40,
            ),
            Row(
              children: [
                Container(
                  height: 32,
                  width: 32,
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage("assets/profile.png"),
                        fit: BoxFit.fill),
                  ),
                ),
                const SizedBox(
                  width: 8,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Full name",
                      style: GoogleFonts.sora(
                        fontWeight: FontWeight.w400,
                        fontSize: 12,
                        color: const Color.fromRGBO(120, 131, 141, 1),
                      ),
                    ),
                    Text(
                      "Ayush Godse",
                      style: GoogleFonts.sora(
                        fontWeight: FontWeight.w600,
                        fontSize: 12,
                        color: const Color.fromRGBO(25, 25, 25, 1),
                      ),
                    ),
                  ],
                ),
                const Spacer(),
                GestureDetector(
                  onTap: () {},
                  child: Text(
                    "Edit",
                    style: GoogleFonts.sora(
                      fontWeight: FontWeight.w400,
                      fontSize: 12,
                      color: const Color.fromRGBO(29, 98, 202, 1),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 12,
            ),
            const Divider(
              thickness: 1,
              color: Color.fromRGBO(237, 239, 246, 1),
            ),
            const SizedBox(
              height: 12,
            ),
            Row(
              children: [
                Container(
                  height: 32,
                  width: 32,
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage("assets/mobile.png"),
                        fit: BoxFit.fill),
                  ),
                ),
                const SizedBox(
                  width: 8,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Mobile",
                      style: GoogleFonts.sora(
                        fontWeight: FontWeight.w400,
                        fontSize: 12,
                        color: const Color.fromRGBO(120, 131, 141, 1),
                      ),
                    ),
                    Text(
                      "+91 9823455567",
                      style: GoogleFonts.sora(
                        fontWeight: FontWeight.w600,
                        fontSize: 12,
                        color: const Color.fromRGBO(25, 25, 25, 1),
                      ),
                    ),
                  ],
                ),
                const Spacer(),
                GestureDetector(
                  onTap: () {},
                  child: Text(
                    "Edit",
                    style: GoogleFonts.sora(
                      fontWeight: FontWeight.w400,
                      fontSize: 12,
                      color: const Color.fromRGBO(29, 98, 202, 1),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 12,
            ),
            const Divider(
              thickness: 1,
              color: Color.fromRGBO(237, 239, 246, 1),
            ),
            Row(
              children: [
                Container(
                  height: 32,
                  width: 32,
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage("assets/email.png"),
                        fit: BoxFit.fill),
                  ),
                ),
                const SizedBox(
                  width: 8,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Email",
                      style: GoogleFonts.sora(
                        fontWeight: FontWeight.w400,
                        fontSize: 12,
                        color: const Color.fromRGBO(120, 131, 141, 1),
                      ),
                    ),
                    Text(
                      "abcd@gmail.com",
                      style: GoogleFonts.sora(
                        fontWeight: FontWeight.w600,
                        fontSize: 12,
                        color: const Color.fromRGBO(25, 25, 25, 1),
                      ),
                    ),
                  ],
                ),
                const Spacer(),
                GestureDetector(
                  onTap: () {},
                  child: Text(
                    "Edit",
                    style: GoogleFonts.sora(
                      fontWeight: FontWeight.w400,
                      fontSize: 12,
                      color: const Color.fromRGBO(29, 98, 202, 1),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 12,
            ),
            const Divider(
              thickness: 1,
              color: Color.fromRGBO(237, 239, 246, 1),
            ),
            const SizedBox(
              height: 12,
            ),
            Row(
              children: [
                Container(
                  height: 32,
                  width: 32,
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage("assets/password.png"),
                        fit: BoxFit.fill),
                  ),
                ),
                const SizedBox(
                  width: 8,
                ),
                Text(
                  "Change password",
                  style: GoogleFonts.sora(
                    fontWeight: FontWeight.w600,
                    fontSize: 12,
                    color: const Color.fromRGBO(25, 25, 25, 1),
                  ),
                ),
                const Spacer(),
                GestureDetector(
                  onTap: () {},
                  child: const Icon(
                    Icons.arrow_forward_ios_rounded,
                    color: Color.fromRGBO(83, 93, 102, 1),
                    size: 15,
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 12,
            ),
          ],
        ),
      ),
    );
  }
}
