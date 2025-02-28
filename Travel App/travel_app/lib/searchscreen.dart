import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Search_Page extends StatefulWidget {
  const Search_Page({super.key});

  @override
  State<Search_Page> createState() => _Search_PageState();
}

class _Search_PageState extends State<Search_Page> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(247, 247, 249, 1),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 67, left: 20, right: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Search",
                    style: GoogleFonts.poppins(
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                        color: const Color.fromRGBO(27, 30, 40, 1)),
                  ),
                  Text(
                    "Cancel",
                    style: GoogleFonts.inter(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: const Color.fromRGBO(13, 110, 253, 1)),
                  )
                ],
              ),
            ),
            const SizedBox(height: 20),
            TextField(
              decoration: InputDecoration(
                suffixIcon: const Icon(Icons.mic_none_outlined),
                suffixIconColor: const Color.fromRGBO(125, 132, 141, 1),
                prefixIcon: const Icon(Icons.search),
                prefixIconColor: const Color.fromRGBO(125, 132, 141, 1),
                hintText: "Search Places",
                hintStyle: GoogleFonts.poppins(
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                  color: const Color.fromRGBO(125, 132, 141, 1),
                ),
                border: InputBorder.none,
                filled: true,
                fillColor: const Color.fromRGBO(255, 255, 255, 1),
              ),
            ),
            const SizedBox(height: 30),
            Text(
              "Search Places",
              style: GoogleFonts.poppins(
                fontSize: 20,
                fontWeight: FontWeight.w600,
                color: const Color.fromRGBO(27, 30, 40, 1),
              ),
            ),
            const SizedBox(height: 10),
            Expanded(
              child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                ),
                itemCount: 4,
                itemBuilder: (context, index) {
                  final places = [
                    {
                      "image": "assets/Group 96.png",
                      "title": "Niladri Reservoir",
                      "location": "Tekergat Sunamgnj",
                      "price": "\$894",
                    },
                    {
                      "image": "assets/Group 96 (1).png",
                      "title": "Casalas Tirtugas",
                      "location": "Av Damera, Mexico",
                      "price": "\$894",
                    },
                    {
                      "image": "assets/Group 96 (2).png",
                      "title": "Aonang Villa",
                      "location": "Bastola, Islampur",
                      "price": "\$761",
                    },
                    {
                      "image": "assets/Group 96 (3).png",
                      "title": "Niladri Reservoir",
                      "location": "Rangauti Resort",
                      "price": "\$857",
                    },
                  ];

                  final place = places[index];

                  return Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16),
                      color:
                          Colors.white.withOpacity(0.9), // Transparent effect
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.1), // Shadow color
                          spreadRadius: 2,
                          blurRadius: 8,
                          offset:
                              const Offset(0, 3), // changes position of shadow
                        ),
                      ],
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          child: ClipRRect(
                            borderRadius: const BorderRadius.vertical(
                                top: Radius.circular(16)),
                            child: Image.asset(
                              place["image"]!,
                              fit: BoxFit.cover,
                              height: 100, // Fixed height for uniformity
                              width: double.infinity,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(10),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                place["title"]!,
                                style: GoogleFonts.poppins(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              const SizedBox(height: 4),
                              Row(
                                children: [
                                  const Icon(
                                    Icons.location_on_outlined,
                                    size: 15,
                                    color: Color.fromRGBO(125, 132, 141, 1),
                                  ),
                                  const SizedBox(width: 4),
                                  Expanded(
                                    child: Text(
                                      place["location"]!,
                                      style: GoogleFonts.poppins(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w400,
                                        color: const Color.fromRGBO(
                                            125, 132, 141, 1),
                                      ),
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 4),
                              Row(
                                children: [
                                  Text(
                                    place["price"]!,
                                    style: GoogleFonts.poppins(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w400,
                                      color:
                                          const Color.fromRGBO(13, 110, 253, 1),
                                    ),
                                  ),
                                  const SizedBox(width: 4),
                                  Text(
                                    " / Person",
                                    style: GoogleFonts.poppins(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w400,
                                      color: const Color.fromRGBO(
                                          125, 132, 141, 1),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
