import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:music_app/Constants/dummy_data.dart';
import 'package:music_app/Utils/buttons.dart';
import 'package:music_app/Utils/navigation_bar.dart';
import 'package:music_app/View/Screens/Home/utiles.dart';

class Gallery extends StatefulWidget {
  const Gallery({super.key});

  @override
  State<Gallery> createState() => _GalleryState();
}

class _GalleryState extends State<Gallery> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        bottomNavigationBar: buildBottomNavigationBar(),
        backgroundColor: const Color.fromRGBO(19, 19, 19, 1),
        body: Column(
          children: [
            Expanded(
              flex: 4,
              child: Stack(
                children: [
                  Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            fit: BoxFit.cover,
                            image:
                                AssetImage("lib/Assets/img/home screen.png"))),
                  ),
                  Container(
                      margin: EdgeInsets.only(top: 250, left: 19),
                      child: Column(
                        children: [
                          Text(
                            "A.L.O.N.E",
                            style: GoogleFonts.inter(
                                fontSize: 36,
                                fontWeight: FontWeight.w600,
                                color: Colors.white),
                          ),
                          buildRedButton(title: "Subscribe"),
                        ],
                      ))
                ],
              ),
            ),
            Expanded(
              flex: 5,
              child: Container(
                margin: EdgeInsets.only(top: 10, left: 20, right: 20),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    buildTopSeeAll(
                        title: "Discography",
                        color: Color.fromRGBO(255, 46, 0, 1)),
                    SizedBox(
                      height: 200,
                      child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: discographyCardList.length,
                          itemBuilder: (context, index) {
                            return buildDiscographyCard(
                                context: context,
                                discographyCardList: discographyCardList,
                                index: index);
                          }),
                    ),
                    buildTopSeeAll(
                        title: "Popular Singles", color: Colors.white),
                    Flexible(
                      child: Container(
                        alignment: Alignment.topCenter,
                        child: ListView.builder(
                            itemCount: 4,
                            itemBuilder: (context, index) {
                              return buildPopularCads(
                                  popular_singlesList: popular_singlesList,
                                  index: index);
                            }),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ],
        ));
  }
}
