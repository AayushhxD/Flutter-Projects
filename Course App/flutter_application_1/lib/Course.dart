import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Educourse extends StatefulWidget {
  const Educourse({super.key});
  @override
  State createState() => _EducourseState();
}

List lecturList = [
  {
    "title": "Introduction",
    "description": "Lorem Ipsum is simply dummy text ...",
    "icon": "./assets/svg/video icon.svg",
  },
  {
    "title": "Introduction",
    "description": "Lorem Ipsum is simply dummy text ...",
    "icon": "./assets/svg/video icon.svg",
  },
  {
    "title": "Introduction",
    "description": "Lorem Ipsum is simply dummy text ...",
    "icon": "./assets/svg/video icon.svg",
  },
  {
    "title": "Introduction",
    "description": "Lorem Ipsum is simply dummy text ...",
    "icon": "./assets/svg/video icon.svg",
  },
  {
    "title": "Introduction",
    "description": "Lorem Ipsum is simply dummy text ...",
    "icon": "./assets/svg/video icon.svg",
  },
  {
    "title": "Introduction",
    "description": "Lorem Ipsum is simply dummy text ...",
    "icon": "./assets/svg/video icon.svg",
  },
  {
    "title": "Introduction",
    "description": "Lorem Ipsum is simply dummy text ...",
    "icon": "./assets/svg/video icon.svg",
  },
  {
    "title": "Introduction",
    "description": "Lorem Ipsum is simply dummy text ...",
    "icon": "./assets/svg/video icon.svg",
  },
];

class _EducourseState extends State {
  TextEditingController searchTextController = TextEditingController();

  bool isOpenUxCource = false;
  Scaffold isCourceScreen() {
    if (isOpenUxCource == false) {
      return Scaffold(
        appBar: AppBar(
          backgroundColor: const Color.fromRGBO(205, 218, 218, 1),
          leading: const Icon(Icons.menu_outlined, size: 30),
          actions: const [
            Icon(
              Icons.notifications_outlined,
              size: 35,
            ),
            SizedBox(width: 10),
          ],
        ),
        backgroundColor: const Color.fromRGBO(205, 218, 218, 1),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Welcome to new",
                    style: GoogleFonts.jost(
                      fontWeight: FontWeight.w300,
                      fontSize: 28,
                    ),
                  ),
                  Text(
                    "Educourse",
                    style: GoogleFonts.jost(
                      fontWeight: FontWeight.w700,
                      fontSize: 38,
                    ),
                  )
                ],
              ),
            ),
            Container(
              padding: const EdgeInsets.all(20),
              child: TextField(
                controller: searchTextController,
                decoration: const InputDecoration(
                  filled: true,
                  fillColor: Colors.white,
                  suffixIcon: Icon(
                    Icons.search_outlined,
                    size: 30,
                  ),
                  hintText: "Enter you keyword",
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(28),
                      ),
                      borderSide: BorderSide(color: Colors.white)),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(28),
                    ),
                    borderSide: BorderSide(color: Colors.white),
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            Expanded(
              child: Container(
                width: double.infinity,
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(
                      40,
                    ),
                    topRight: Radius.circular(
                      40,
                    ),
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      padding: const EdgeInsets.all(20),
                      child: Text(
                        'Course for you',
                        style: GoogleFonts.jost(
                          fontWeight: FontWeight.w500,
                          fontSize: 20,
                        ),
                      ),
                    ),
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: [
                          GestureDetector(
                            onTap: () {
                              setState(() {
                                isOpenUxCource = true;
                              });
                            },
                            child: Container(
                              height: 255,
                              width: 190,
                              margin: const EdgeInsets.only(left: 20),
                              decoration: const BoxDecoration(
                                borderRadius: BorderRadius.all(
                                  Radius.circular(
                                    15,
                                  ),
                                ),
                                gradient: LinearGradient(
                                  begin: Alignment.topCenter,
                                  end: Alignment.bottomCenter,
                                  colors: [
                                    Color.fromRGBO(197, 4, 98, 1),
                                    Color.fromRGBO(80, 3, 112, 1)
                                  ],
                                ),
                              ),
                              child: Column(
                                children: [
                                  Container(
                                    padding: const EdgeInsets.all(20),
                                    child: Text(
                                      "UX Designer from Sratch.",
                                      style: GoogleFonts.jost(
                                        fontWeight: FontWeight.w500,
                                        fontSize: 17,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                  SvgPicture.asset('./assets/svg/image1.svg'),
                                  const SizedBox(height: 5),
                                ],
                              ),
                            ),
                          ),
                          Container(
                            height: 255,
                            width: 190,
                            margin: const EdgeInsets.only(left: 20, right: 20),
                            decoration: const BoxDecoration(
                              borderRadius: BorderRadius.all(
                                Radius.circular(15),
                              ),
                              gradient: LinearGradient(
                                colors: [
                                  Color.fromRGBO(0, 77, 228, 1),
                                  Color.fromRGBO(1, 47, 135, 1),
                                ],
                              ),
                            ),
                            child: Column(
                              children: [
                                Container(
                                  padding: const EdgeInsets.all(20),
                                  child: Text(
                                    "Design Thinking The Beginner",
                                    style: GoogleFonts.jost(
                                        fontWeight: FontWeight.w500,
                                        fontSize: 17,
                                        color: Colors.white),
                                  ),
                                ),
                                SvgPicture.asset('./assets/svg/image2.svg')
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.all(20),
                      child: Text(
                        "Course by Category",
                        style: GoogleFonts.jost(
                          fontWeight: FontWeight.w500,
                          fontSize: 20,
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        SvgPicture.asset(
                          './assets/svg/Ui.svg',
                          height: 70,
                          width: 35,
                        ),
                        SvgPicture.asset(
                          './assets/svg/visual.svg',
                          height: 70,
                          width: 35,
                        ),
                        SvgPicture.asset(
                          './assets/svg/illustration.svg',
                          height: 70,
                          width: 35,
                        ),
                        SvgPicture.asset(
                          './assets/svg/photo.svg',
                          height: 70,
                          width: 35,
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      );
    } else {
      return Scaffold(
        body: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Color.fromRGBO(197, 4, 98, 1),
                Color.fromRGBO(80, 3, 112, 1),
              ],
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 60),
              Row(
                children: [
                  const SizedBox(width: 20),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        isOpenUxCource = false;
                      });
                    },
                    child: const Icon(
                      Icons.arrow_back,
                      size: 30,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              Container(
                margin: const EdgeInsets.only(left: 50),
                child: Column(
                  children: [
                    Text(
                      "UX Designer from Scratch.",
                      style: GoogleFonts.jost(
                        fontWeight: FontWeight.w500,
                        fontSize: 34,
                        color: Colors.white,
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Text(
                      "Basic guideline & tips & tricks for how to become a UX designer easily.",
                      style: GoogleFonts.jost(
                        color: Colors.white,
                        fontSize: 16,
                      ),
                    ),
                    const SizedBox(height: 30),
                    Row(
                      children: [
                        Container(
                          height: 35,
                          width: 35,
                          decoration: BoxDecoration(
                            color: const Color.fromRGBO(0, 82, 178, 1),
                            shape: BoxShape.circle,
                            border: Border.all(color: Colors.white),
                          ),
                          child: const Icon(
                            Icons.person_outline_outlined,
                            color: Colors.white,
                            size: 30,
                          ),
                        ),
                        const SizedBox(width: 10),
                        Text(
                          "Author:",
                          style: GoogleFonts.jost(
                            fontSize: 16,
                            color: const Color.fromRGBO(190, 157, 197, 1),
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        Text(
                          " Jenny",
                          style: GoogleFonts.jost(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                            color: Colors.white,
                          ),
                        ),
                        const SizedBox(
                          width: 20,
                        ),
                        Text(
                          "4.8",
                          style: GoogleFonts.jost(
                            fontWeight: FontWeight.w500,
                            fontSize: 16,
                            color: Colors.white,
                          ),
                        ),
                        const SizedBox(width: 2),
                        const Icon(
                          Icons.star,
                          size: 25,
                          color: Color.fromRGBO(255, 146, 0, 1),
                        ),
                        Text(
                          "(20 review)",
                          style: GoogleFonts.jost(
                              fontWeight: FontWeight.w500,
                              fontSize: 16,
                              color: const Color.fromRGBO(190, 154, 198, 1)),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 30),
              Expanded(
                child: Container(
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(38),
                      topRight: Radius.circular(38),
                    ),
                  ),
                  child: ListView.builder(
                    itemCount: lecturList.length,
                    itemBuilder: (BuildContext context, int index) {
                      return Padding(
                        padding: const EdgeInsets.only(top: 25, left: 30),
                        child: SizedBox(
                          height: 70,
                          width: 300,
                          child: Column(
                            children: [
                              Row(
                                children: [
                                  SvgPicture.asset(
                                    lecturList[index]["icon"],
                                    height: 60,
                                    width: 46,
                                  ),
                                  const SizedBox(width: 10),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        lecturList[index]["title"],
                                        style: GoogleFonts.jost(
                                          fontWeight: FontWeight.w500,
                                          fontSize: 17,
                                        ),
                                      ),
                                      const SizedBox(
                                        height: 10,
                                      ),
                                      Text(
                                        lecturList[index]["description"],
                                        style: GoogleFonts.jost(
                                            fontSize: 14,
                                            color: const Color.fromRGBO(
                                                143, 143, 143, 1)),
                                      )
                                    ],
                                  ),
                                ],
                              )
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return isCourceScreen();
  }
}
