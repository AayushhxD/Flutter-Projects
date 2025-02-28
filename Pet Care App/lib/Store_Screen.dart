import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Store_Screen extends StatefulWidget {
  const Store_Screen({super.key});

  @override
  State<Store_Screen> createState() => _Store_ScreenState();
}

class _Store_ScreenState extends State<Store_Screen> {
  final List<String> containerNames = [
    'Pets',
    'Foods',
    'Healthy',
    'Toys',
    'Accessories',
    'Clothes',
    'Grooming',
    'Training'
  ];

  final List<String> imagePaths = [
    "assets/shopimage/pets.png",
    "assets/shopimage/foods.png",
    "assets/shopimage/healthy.png",
    "assets/shopimage/toys.png",
    "assets/shopimage/accessory.png",
    "assets/shopimage/clothes.png",
    "assets/shopimage/grooming.png",
    "assets/shopimage/training4.png"
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(244, 243, 243, 1),
      body: Column(
        children: [
          Stack(
            alignment: Alignment.bottomCenter,
            children: [
              Container(
                height: 150,
                width: double.infinity,
                padding: const EdgeInsets.only(top: 3, left: 32, right: 32),
                decoration: const BoxDecoration(
                  color: Color.fromRGBO(245, 146, 69, 1),
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(32),
                    bottomRight: Radius.circular(32),
                  ),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SizedBox(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Hello Ayush",
                            style: GoogleFonts.poppins(
                                fontWeight: FontWeight.w500,
                                fontSize: 14,
                                color: const Color.fromRGBO(255, 255, 255, 1)),
                          ),
                          Text(
                            "Explore Our Pet Store",
                            style: GoogleFonts.poppins(
                                fontWeight: FontWeight.w700,
                                fontSize: 16,
                                color: const Color.fromRGBO(255, 255, 255, 1)),
                          ),
                        ],
                      ),
                    ),
                    const Spacer(),
                    const Icon(
                      Icons.shopping_cart_outlined,
                      size: 22,
                      weight: 2,
                      color: Color.fromRGBO(255, 255, 255, 1),
                    )
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 20), // Added padding here
                child: Container(
                  margin: const EdgeInsets.only(left: 45, right: 45),
                  height: 40,
                  alignment: Alignment.bottomCenter,
                  padding:
                      const EdgeInsets.only(left: 16, right: 16, bottom: 5),
                  decoration: BoxDecoration(
                    color: const Color.fromRGBO(255, 255, 255, 1),
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(
                      width: 2,
                      color: const Color.fromRGBO(250, 200, 162, 1),
                    ),
                  ),
                  child: TextField(
                    textAlign: TextAlign.start,
                    decoration: InputDecoration(
                      hintStyle: GoogleFonts.poppins(
                          fontWeight: FontWeight.w400,
                          fontSize: 12,
                          color: const Color.fromRGBO(194, 195, 204, 1)),
                      hintText: 'search',
                      border: InputBorder.none,
                      suffixIcon: const Icon(
                        Icons.search,
                        size: 22,
                        color: Color.fromRGBO(245, 146, 69, 1),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 30,
          ),
          Expanded(
            child: GridView.count(
              crossAxisCount: 2,
              mainAxisSpacing: 20,
              crossAxisSpacing: 20,
              padding: const EdgeInsets.symmetric(horizontal: 25),
              children: List.generate(containerNames.length, (index) {
                return Stack(
                  children: [
                    Container(
                      padding: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        color: const Color.fromRGBO(245, 146, 69, 1),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Container(
                        decoration: BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage(imagePaths[index]),
                              fit: BoxFit.fill),
                          color: const Color.fromRGBO(245, 146, 69, 1),
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                    ),
                    Container(
                      height: 30,
                      width: 110,
                      alignment: Alignment.center,
                      margin: const EdgeInsets.only(top: 25),
                      decoration: const BoxDecoration(
                        color: Color.fromRGBO(245, 245, 247, 1),
                        borderRadius: BorderRadius.only(
                            topRight: Radius.circular(50),
                            bottomRight: Radius.circular(50)),
                      ),
                      child: Text(
                        containerNames[index],
                        textAlign: TextAlign.center,
                        style: GoogleFonts.poppins(
                            fontWeight: FontWeight.w500,
                            fontSize: 12,
                            color: const Color.fromRGBO(245, 146, 69, 1)),
                      ),
                    )
                  ],
                );
              }),
            ),
          )
        ],
      ),
      bottomNavigationBar: const BottomAppBar(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.home_outlined,
                  size: 30,
                  color: Color.fromRGBO(126, 128, 143, 1),
                ),
                Text(
                  'Home',
                  style: TextStyle(
                    color: Color.fromRGBO(126, 128, 143, 1),
                  ),
                )
              ],
            ),
            const Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.favorite_border,
                  size: 30,
                  color: Color.fromRGBO(245, 146, 69, 1),
                ),
                Text(
                  'Service',
                  style: TextStyle(
                    color: Color.fromRGBO(245, 146, 69, 1),
                  ),
                )
              ],
            ),
            SizedBox(
              width: 60,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.history,
                  size: 30,
                  color: Color.fromRGBO(126, 128, 143, 1),
                ),
                Text(
                  'History',
                  style: TextStyle(
                    color: Color.fromRGBO(126, 128, 143, 1),
                  ),
                )
              ],
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.person_2_outlined,
                  size: 30,
                  color: Color.fromRGBO(126, 128, 143, 1),
                ),
                Text(
                  'Profile',
                  style: TextStyle(
                    color: Color.fromRGBO(126, 128, 143, 1),
                  ),
                )
              ],
            ),
          ],
        ),
      ),
      floatingActionButton: Container(
        height: 70,
        width: 70,
        child: FloatingActionButton(
          shape: const CircleBorder(),
          backgroundColor: const Color(0xffF59245),
          elevation: 0,
          onPressed: () {},
          child: const Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.shopping_cart_outlined,
                color: Colors.white,
              ),
              Text(
                'Shop',
                style: TextStyle(color: Colors.white),
              ),
            ],
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}
