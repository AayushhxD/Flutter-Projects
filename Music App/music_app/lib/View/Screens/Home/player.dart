import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:music_app/Constants/dummy_data.dart';
import 'package:music_app/Utils/navigation_bar.dart';

class PlayerScreen extends StatefulWidget {
  final int index;
  const PlayerScreen({super.key, required this.index});

  @override
  State<PlayerScreen> createState() => _PlayerScreenState();
}

class _PlayerScreenState extends State<PlayerScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(19, 19, 19, 1),
      bottomNavigationBar: buildBottomNavigationBar(),
      body: Column(
        children: [
          SizedBox(
            child: Stack(
              children: [
                Container(
                  height: 600,
                  width: double.infinity,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          fit: BoxFit.cover,
                          image: AssetImage(
                            discographyCardList[widget.index]["image"],
                          ))),
                ),
                Flexible(
                  child: Container(
                    margin: const EdgeInsets.only(top: 420),
                    height: 350,
                    width: double.infinity,
                    decoration: const BoxDecoration(
                        image: DecorationImage(
                            fit: BoxFit.fill,
                            image: AssetImage("lib/Assets/img/Ellipse.png"))),
                  ),
                ),
                Container(
                  width: double.infinity,
                  alignment: Alignment.center,
                  margin: const EdgeInsets.only(top: 550),
                  child: Column(
                    children: [
                      Text(
                        textAlign: TextAlign.center,
                        "${discographyCardList[widget.index]["title"]} in the Abyss",
                        style: GoogleFonts.inter(
                            color: const Color.fromRGBO(230, 154, 21, 1),
                            fontSize: 23),
                      ),
                      Text(
                        textAlign: TextAlign.center,
                        "Youlakou",
                        style: GoogleFonts.inter(color: Colors.white),
                      ),
                    ],
                  ),
                ),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  margin: const EdgeInsets.only(top: 630),
                  width: double.infinity,
                  child: Column(
                    children: [
                      Container(
                        width: double.infinity,
                        alignment: Alignment.centerRight,
                        child: SvgPicture.asset(
                            "lib/Assets/icons/svg/radix-icons_share-2.svg"),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("Dynamic Warmup | ",
                              style: GoogleFonts.cabin(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w400,
                                  fontSize: 14)),
                          Text("4 min",
                              style: GoogleFonts.cabin(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w400,
                                  fontSize: 14))
                        ],
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      const LinearProgressIndicator(
                        color: Color.fromRGBO(230, 154, 21, 1),
                      ),
                      Container(
                        margin: const EdgeInsets.only(top: 10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            SvgPicture.asset(
                                "lib/Assets/icons/player icons/repeat_mode.svg"),
                            SvgPicture.asset(
                                "lib/Assets/icons/player icons/previous.svg"),
                            SvgPicture.asset(
                                "lib/Assets/icons/player icons/stop_play.svg"),
                            SvgPicture.asset(
                                "lib/Assets/icons/player icons/next.svg"),
                            SvgPicture.asset(
                                "lib/Assets/icons/player icons/mingcute_volume-fill.svg"),
                          ],
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
