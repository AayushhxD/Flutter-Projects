import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:routegen/view/bottomnav.dart';
import 'package:routegen/view/common_appbar.dart';

class PlanScreen extends StatefulWidget {
  const PlanScreen({super.key});

  @override
  State<PlanScreen> createState() => _PlanScreenState();
}

class _PlanScreenState extends State<PlanScreen> {
  // List of destinations with their details
  final List<Map<String, dynamic>> destinations = [
    {
      'name': 'Sinhagad Fort',
      'image': 'asset/sinhagad.jpg',  
      'price': 100
    },
    {
      'name': 'Khadakwasla Dam',
      'image': 'asset/khadakwasla.jpeg',  
      'price': 75
    },
    {
      'name': 'Prati Balaji Temple',
      'image': 'asset/balaji.jpeg',  
      'price': 85
    },
    {
      'name': 'Lavasa',
      'image': 'asset/Lavasa.jpeg',  
      'price': 100
    },
    {
      'name': 'Shivneri',
      'image': 'asset/shivneri.jpeg',  
      'price': 255
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CommonAppbar(
        titleSize: 18,
        iconSize: 35,
        isNotificationOpen: false,
      ),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color.fromRGBO(255, 136, 17, 1),
              Color.fromRGBO(255, 136, 17, 0.4),
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            stops: [0.4, 0.7],
          ),
        ),
        height: MediaQuery.of(context).size.height,
        child: ListView.builder(
          shrinkWrap: true,
          itemCount: destinations.length,
          itemBuilder: (context, index) {
            return Center(
              child: Container(
                height: 270,
                margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 25),
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(destinations[index]['image']!),
                    fit: BoxFit.cover,
                  ),
                  borderRadius: BorderRadius.circular(30),
                ),
                child: Stack(
                  children: [
                    Positioned(
                      top: 6.5,
                      right: 10,
                      child: GestureDetector(
                        onTap: () {},
                        child: Container(
                          height: 40,
                          width: 40,
                          decoration: const BoxDecoration(shape: BoxShape.circle),
                          child: const Icon(
                            Icons.info_outline_rounded,
                            color: Colors.black54,
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      top:0,
                      left: 0,
                      child: GestureDetector(
                        onTap: () {},
                        child: Container(
                          padding:const EdgeInsets.all(8),
                          decoration: const BoxDecoration(
                            color: Colors.black54,
                            borderRadius: BorderRadius.only(topLeft: Radius.circular(30),bottomRight: Radius.circular(30))
                          ),
                          child: Text(
                            destinations[index]['name']!,
                            style: GoogleFonts.raleway(
                              fontSize: 20,
                              fontWeight: FontWeight.w700,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      bottom: 0,
                      child: Container(
                        height: 70,
                        width: 399,
                        decoration: const BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(30),
                            bottomRight: Radius.circular(30),
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      bottom: 15,
                      left: 55,
                      child: Row(
                        children: [
                          GestureDetector(
                            onTap: () {
                              // Group booking bottom sheet
                            },
                            child: Container(
                              alignment: Alignment.center,
                              height: 40,
                              width: 120,
                              decoration: BoxDecoration(
                                border: Border.all(
                                  color: Colors.black54,
                                  width: 0.8,
                                ),
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child: const Text('Group Booking'),
                            ),
                          ),
                          const SizedBox(width: 40),
                          GestureDetector(
                            onTap: () {
                              // Book single person
                            },
                            child: Container(
                              alignment: Alignment.center,
                              height: 40,
                              width: 120,
                              decoration: BoxDecoration(
                                color: const Color.fromRGBO(26, 21, 40, 1),
                                border: Border.all(
                                  color: Colors.black54,
                                  width: 0.8,
                                ),
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child: Text(
                                "${destinations[index]['price']}",
                                style: GoogleFonts.raleway(
                                  fontWeight: FontWeight.w600,
                                  color: Colors.white70,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
      bottomNavigationBar: const OneBottomnav(),
    );
  }
}