import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:travel_app/chatscreen.dart';

class Message_Page extends StatefulWidget {
  const Message_Page({super.key});

  @override
  State<Message_Page> createState() => _Message_PageState();
}

class _Message_PageState extends State<Message_Page> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(247, 247, 249, 1),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 67, left: 141),
              child: Row(
                children: [
                  Text(
                    "Messages",
                    style: GoogleFonts.poppins(
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                      color: const Color.fromRGBO(27, 30, 40, 1),
                    ),
                  ),
                  const Spacer(),
                  const Icon(Icons.more_vert),
                ],
              ),
            ),
            const SizedBox(
              height: 50,
            ),
            Row(
              children: [
                Text(
                  "Messages",
                  style: GoogleFonts.poppins(
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                    color: const Color.fromRGBO(27, 30, 40, 1),
                  ),
                ),
                const Spacer(),
                const Icon(Icons.edit_square)
              ],
            ),
            const SizedBox(
              height: 30,
            ),
            TextField(
              decoration: InputDecoration(
                prefixIcon: const Icon(Icons.search),
                prefixIconColor: const Color.fromRGBO(125, 132, 141, 1),
                hintText: "Search for chats & messages",
                hintStyle: GoogleFonts.poppins(
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                  color: const Color.fromRGBO(125, 132, 141, 1),
                ),
                border: InputBorder.none,
                focusedErrorBorder:
                    OutlineInputBorder(borderRadius: BorderRadius.circular(16)),
                filled: true,
                fillColor: const Color.fromRGBO(255, 255, 255, 1),
              ),
            ),
            Expanded(
              child: ListView(
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) {
                            return const ChatScreen();
                          },
                        ),
                      );
                    },
                    child: Container(
                      height: 70,
                      width: 335,
                      child: Row(
                        children: [
                          Image.asset("assets/Group 184.png"),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Text(
                                "Sajib Rahman",
                                style: GoogleFonts.poppins(
                                  fontSize: 18,
                                  fontWeight: FontWeight.w500,
                                  color: const Color.fromRGBO(27, 30, 40, 1),
                                ),
                              ),
                              Text(
                                "Hi, John! 👋 How are you doing?",
                                style: GoogleFonts.poppins(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400,
                                  color: const Color.fromRGBO(125, 132, 141, 1),
                                ),
                              )
                            ],
                          ),
                          const Spacer(),
                          const Icon(
                            Icons.done,
                            size: 15,
                            color: Color.fromRGBO(125, 132, 141, 1),
                          ),
                          Text(
                            "09.46",
                            style: GoogleFonts.poppins(
                              fontSize: 11,
                              fontWeight: FontWeight.w400,
                              color: const Color.fromRGBO(125, 132, 141, 1),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Container(
                    height: 70,
                    width: 335,
                    child: Row(
                      children: [
                        Image.asset("assets/Group 185.png"),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Text(
                              "Adom Shafi ",
                              style: GoogleFonts.poppins(
                                fontSize: 18,
                                fontWeight: FontWeight.w500,
                                color: const Color.fromRGBO(27, 30, 40, 1),
                              ),
                            ),
                            Text(
                              "Typing...",
                              style: GoogleFonts.poppins(
                                fontSize: 14,
                                fontWeight: FontWeight.w400,
                                color: const Color.fromRGBO(13, 110, 253, 1),
                              ),
                            )
                          ],
                        ),
                        const Spacer(),
                        const Icon(
                          Icons.done_all,
                          size: 15,
                          color: Color.fromRGBO(25, 176, 0, 1),
                        ),
                        Text(
                          "09.46",
                          style: GoogleFonts.poppins(
                            fontSize: 11,
                            fontWeight: FontWeight.w400,
                            color: const Color.fromRGBO(125, 132, 141, 1),
                          ),
                        )
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Container(
                    height: 70,
                    width: 335,
                    child: Row(
                      children: [
                        Image.asset("assets/Group 186.png"),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Text(
                              "HR Rumen ",
                              style: GoogleFonts.poppins(
                                fontSize: 18,
                                fontWeight: FontWeight.w500,
                                color: const Color.fromRGBO(27, 30, 40, 1),
                              ),
                            ),
                            Text(
                              '''You: Cool! ☺️ Let’s meet at 18:00 
near the traveling!''',
                              style: GoogleFonts.poppins(
                                fontSize: 14,
                                fontWeight: FontWeight.w400,
                                color: const Color.fromRGBO(125, 132, 141, 1),
                              ),
                            )
                          ],
                        ),
                        const Spacer(),
                        const Icon(
                          Icons.done_all,
                          size: 15,
                          color: Color.fromRGBO(125, 132, 141, 1),
                        ),
                        Text(
                          "Yesterday",
                          style: GoogleFonts.poppins(
                            fontSize: 11,
                            fontWeight: FontWeight.w400,
                            color: const Color.fromRGBO(125, 132, 141, 1),
                          ),
                        )
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Container(
                    height: 70,
                    width: 335,
                    child: Row(
                      children: [
                        Image.asset("assets/Group 187.png"),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Text(
                              "Anjelina ",
                              style: GoogleFonts.poppins(
                                fontSize: 18,
                                fontWeight: FontWeight.w500,
                                color: const Color.fromRGBO(27, 30, 40, 1),
                              ),
                            ),
                            Text(
                              '''You: Hey, will you come to the 
party on Saturday?''',
                              style: GoogleFonts.poppins(
                                fontSize: 14,
                                fontWeight: FontWeight.w400,
                                color: const Color.fromRGBO(125, 132, 141, 1),
                              ),
                            )
                          ],
                        ),
                        const Spacer(),
                        const Icon(
                          Icons.done,
                          size: 15,
                          color: Color.fromRGBO(125, 132, 141, 1),
                        ),
                        Text(
                          "07.56",
                          style: GoogleFonts.poppins(
                            fontSize: 11,
                            fontWeight: FontWeight.w400,
                            color: const Color.fromRGBO(125, 132, 141, 1),
                          ),
                        )
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Container(
                    height: 70,
                    width: 335,
                    child: Row(
                      children: [
                        Image.asset("assets/Group 188.png"),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Text(
                              "Anjelina ",
                              style: GoogleFonts.poppins(
                                fontSize: 18,
                                fontWeight: FontWeight.w500,
                                color: const Color.fromRGBO(27, 30, 40, 1),
                              ),
                            ),
                            Text(
                              '''Thank you for coming! Your or...''',
                              style: GoogleFonts.poppins(
                                fontSize: 14,
                                fontWeight: FontWeight.w400,
                                color: const Color.fromRGBO(125, 132, 141, 1),
                              ),
                            )
                          ],
                        ),
                        const Spacer(),
                        const Icon(
                          Icons.done_all,
                          size: 15,
                          color: Color.fromRGBO(25, 176, 0, 1),
                        ),
                        Text(
                          "05.52",
                          style: GoogleFonts.poppins(
                            fontSize: 11,
                            fontWeight: FontWeight.w400,
                            color: const Color.fromRGBO(125, 132, 141, 1),
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
