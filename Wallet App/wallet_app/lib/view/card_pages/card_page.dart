import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:wallet_app/view/card_pages/card_pay_page.dart';
import 'package:wallet_app/view/main_page/boiler_plate_main.dart';

class CardScreen extends StatefulWidget {
  const CardScreen({super.key});

  @override
  State<CardScreen> createState() => _CardScreenState();
}

class _CardScreenState extends State<CardScreen> {
  // Sample card data
  final List<Map<String, dynamic>> cards = [
    {
      "holderName": "Ayush Godse",
      "number": "****8923",
      "balance": "\$2,354",
      "color": [Color.fromRGBO(50, 24, 122, 1), Color.fromRGBO(39, 6, 133, 1)],
      "cardType": "Visa",
    },
    {
      "holderName": "Ayush Godse",
      "number": "****4567",
      "balance": "\$1,500",
      "color": [Colors.redAccent, Colors.orangeAccent],
      "cardType": "MasterCard",
    },
    {
      "holderName": "Ayush Godse",
      "number": "****1234",
      "balance": "\$3,200",
      "color": [Colors.greenAccent, Colors.blue],
      "cardType": "American Express",
    },
    {
      "holderName": "Ayush Godse",
      "number": "****7890",
      "balance": "\$4,000",
      "color": [Colors.tealAccent, Colors.lightBlueAccent],
      "cardType": "Discover",
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(255, 255, 255, 1),
      bottomNavigationBar: const BottomNaviBar(),
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: const Color.fromRGBO(255, 255, 255, 1),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(
              "My Cards",
              style: GoogleFonts.sora(
                fontWeight: FontWeight.w600,
                fontSize: 24,
                color: const Color.fromRGBO(25, 25, 25, 1),
              ),
            ),
            const Spacer(),
            GestureDetector(
              onTap: () {
                // Implement your add card functionality here
              },
              child: Row(
                children: [
                  Text(
                    "Add Card",
                    style: GoogleFonts.sora(
                      fontWeight: FontWeight.w600,
                      fontSize: 14,
                      color: const Color.fromRGBO(29, 98, 202, 1),
                    ),
                  ),
                  const Icon(
                    Icons.add,
                    size: 12,
                    color: Color.fromRGBO(29, 98, 202, 1),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 16,
            ),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 16, right: 16),
        child: Column(
          children: [
            Expanded(
              child: ListView.builder(
                padding: const EdgeInsets.only(bottom: 30),
                itemCount: cards.length, // Use the number of cards
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(
                        builder: (context) {
                          return const CardPayScreen();
                        },
                      ));
                    },
                    child: Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16),
                      ),
                      elevation: 8,
                      child: Stack(
                        children: [
                          Container(
                            height: 210,
                            width: double.infinity,
                            decoration: BoxDecoration(
                              gradient: LinearGradient(
                                colors: cards[index]['color'],
                                begin: Alignment.topLeft,
                                end: Alignment.bottomRight,
                              ),
                              borderRadius: BorderRadius.circular(16),
                            ),
                            padding: const EdgeInsets.all(16),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      cards[index]['holderName'],
                                      style: GoogleFonts.sora(
                                        fontWeight: FontWeight.w600,
                                        fontSize: 16,
                                        color: Colors.white,
                                      ),
                                    ),
                                    Text(
                                      cards[index]['number'],
                                      style: GoogleFonts.sora(
                                        fontWeight: FontWeight.w600,
                                        fontSize: 16,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ],
                                ),
                                const Spacer(),
                                Text(
                                  "Balance",
                                  style: GoogleFonts.sora(
                                    fontWeight: FontWeight.w400,
                                    fontSize: 12,
                                    color: Colors.white70,
                                  ),
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      cards[index]['balance'],
                                      style: GoogleFonts.sora(
                                        fontWeight: FontWeight.w600,
                                        fontSize: 24,
                                        color: Colors.white,
                                      ),
                                    ),
                                    const Image(
                                      image: const AssetImage(
                                          "assets/card/wifi.png"),
                                      height: 18,
                                      width: 18,
                                      fit: BoxFit.fill,
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          const Positioned(
                            top: 0,
                            left: 0,
                            child: Image(
                              image:
                                  AssetImage("assets/card/Ellipse1 card.png"),
                              height: 162,
                              width: 162,
                              fit: BoxFit.fill,
                            ),
                          ),
                          const Positioned(
                            bottom: 0,
                            right: 0,
                            child: Image(
                              image:
                                  AssetImage("assets/card/Ellipse2 card.png"),
                              height: 150,
                              width: 150,
                              fit: BoxFit.fill,
                            ),
                          ),
                          Positioned(
                            bottom: 0,
                            right: 0,
                            child: Container(
                              height: 125,
                              width: 250,
                              decoration: BoxDecoration(
                                borderRadius: const BorderRadius.only(
                                  topLeft: Radius.circular(125),
                                  topRight: Radius.circular(125),
                                ),
                                color: Colors.white.withOpacity(0.2),
                              ),
                            ),
                          ),
                        ],
                      ),
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
