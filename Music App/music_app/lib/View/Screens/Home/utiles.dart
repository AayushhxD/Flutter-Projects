import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:music_app/View/Screens/Home/player.dart';

Row buildTopSeeAll({required String title, required Color color}) {
  return Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
    Text(
      title,
      style: GoogleFonts.inter(
          color: color, fontWeight: FontWeight.w600, fontSize: 16),
    ),
    Text(
      "See all",
      style: GoogleFonts.inter(
          color: const Color.fromRGBO(248, 162, 69, 1),
          fontWeight: FontWeight.w400,
          fontSize: 14),
    )
  ]);
}

Container buildDiscographyCard(
    {required List discographyCardList,
    required index,
    required BuildContext context}) {
  return Container(
    margin: const EdgeInsets.only(top: 15),
    child: GestureDetector(
      onTap: () {
        Navigator.of(context).push(
            MaterialPageRoute(builder: (_) => PlayerScreen(index: index)));
      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: const EdgeInsets.only(right: 15, bottom: 10),
            height: 140,
            width: 118,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                image: DecorationImage(
                    fit: BoxFit.cover,
                    image: AssetImage(discographyCardList[index]["image"]))),
          ),
          Text(
            discographyCardList[index]["title"],
            style: GoogleFonts.inter(
                color: Colors.white, fontSize: 12, fontWeight: FontWeight.w600),
          ),
          Text(
            "${discographyCardList[index]["date"]}",
            style: GoogleFonts.inter(
                color: const Color.fromRGBO(132, 125, 125, 1),
                fontSize: 10,
                fontWeight: FontWeight.w400),
          )
        ],
      ),
    ),
  );
}

Container buildPopularCads(
    {required List popular_singlesList, required int index}) {
  return Container(
    margin: const EdgeInsets.only(bottom: 10),
    child: Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          height: 75,
          width: 70,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              image: DecorationImage(
                  fit: BoxFit.cover,
                  image: AssetImage(popular_singlesList[index]["image"]))),
        ),
        const SizedBox(
          width: 20,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(
              popular_singlesList[index]["title"],
              style: GoogleFonts.inter(
                  color: Colors.white,
                  fontSize: 12,
                  fontWeight: FontWeight.w600),
            ),
            Row(
              children: [
                Text(
                  popular_singlesList[index]["title"],
                  style: GoogleFonts.inter(
                      color: const Color.fromRGBO(132, 125, 125, 1),
                      fontSize: 10,
                      fontWeight: FontWeight.w400),
                ),
                Text(
                  " * ",
                  style: GoogleFonts.inter(
                      color: Colors.white,
                      fontSize: 12,
                      fontWeight: FontWeight.w600),
                ),
                Text(
                  popular_singlesList[index]["title"],
                  style: GoogleFonts.inter(
                      color: const Color.fromRGBO(132, 125, 125, 1),
                      fontSize: 10,
                      fontWeight: FontWeight.w400),
                ),
              ],
            )
          ],
        ),
        const Spacer(),
        IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.more_vert,
              color: Colors.white,
              weight: 800,
            ))
      ],
    ),
  );
}
