import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:wallet_app/view/main_page/boiler_plate_main.dart';
import 'package:wallet_app/view/main_page/profile_setting_page.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomePageState();
}

class _HomePageState extends State<HomeScreen> {
  final List<Map<String, dynamic>> transactions = [
    {
      "name": "Netflix",
      "date": "Today",
      "time": "12:32",
      "amount": "430.00",
      "type": "assets/Netflix.png",
      "isExpense": true
    },
    {
      "name": "Starbucks",
      "date": "Yesterday",
      "time": "09:15",
      "amount": "25.99",
      "type": "assets/Starbuck.png",
      "isExpense": true
    },
    {
      "name": "Salary",
      "date": "15 Sep",
      "time": "15:45",
      "amount": "1500.00",
      "type": "assets/Topup.png",
      "isExpense": false
    },
    {
      "name": "Amazon",
      "date": "14 Sep",
      "time": "18:32",
      "amount": "199.49",
      "type": "assets/amazon.png",
      "isExpense": true
    },
    {
      "name": "Spotify",
      "date": "13 Sep",
      "time": "07:20",
      "amount": "9.99",
      "type": "assets/Spotify.png",
      "isExpense": true
    },
    {
      "name": "Walmart",
      "date": "12 Sep",
      "time": "14:55",
      "amount": "85.60",
      "type": "assets/transaction/latest_trans_1.png",
      "isExpense": true
    },
    {
      "name": "Nike",
      "date": "11 Sep",
      "time": "12:10",
      "amount": "120.00",
      "type": "assets/Nike.png",
      "isExpense": true
    },
    {
      "name": "Apple",
      "date": "10 Sep",
      "time": "19:45",
      "amount": "999.99",
      "type": "assets/apple_logo.png",
      "isExpense": true
    },
    {
      "name": "Top Up",
      "date": "09 Sep",
      "time": "16:00",
      "amount": "50.00",
      "type": "assets/Topup.png",
      "isExpense": false
    },
    {
      "name": "Nike",
      "date": "Yesterday",
      "time": "12:15",
      "amount": "99.99",
      "type": "assets/Nike.png",
      "isExpense": true
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNaviBar(),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Top Section: Profile and Settings Button
          Container(
            padding:
                const EdgeInsets.only(left: 16, right: 16, bottom: 24, top: 45),
            color: const Color.fromRGBO(39, 6, 133, 1),
            child: Column(
              children: [
                Row(
                  children: [
                    Container(
                      height: 48,
                      width: 48,
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        image: DecorationImage(
                          image:
                              AssetImage("assets/profile_pic/profile_pic.png"),
                          fit: BoxFit.fill,
                        ),
                      ),
                    ),
                    const SizedBox(width: 8),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Hello",
                            style: GoogleFonts.sora(
                                fontWeight: FontWeight.w600,
                                fontSize: 14,
                                color: const Color.fromRGBO(255, 255, 255, 1))),
                        Text("Ayush!",
                            style: GoogleFonts.sora(
                                fontWeight: FontWeight.w600,
                                fontSize: 14,
                                color: const Color.fromRGBO(255, 255, 255, 1))),
                      ],
                    ),
                    const Spacer(),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(context, MaterialPageRoute(
                          builder: (context) {
                            return const ProfileSettingScreen();
                          },
                        ));
                      },
                      child: const Icon(Icons.settings_outlined,
                          size: 20, color: Color.fromRGBO(255, 255, 255, 1)),
                    )
                  ],
                ),
                const SizedBox(height: 16),
                // Main Balance Card
                Container(
                  padding: const EdgeInsets.only(
                      left: 32, right: 32, top: 24, bottom: 24),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16),
                      gradient: const LinearGradient(colors: [
                        Color.fromRGBO(51, 16, 152, 0.65),
                        Color.fromRGBO(80, 51, 164, 1),
                      ])),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text("Main balance!",
                          style: GoogleFonts.sora(
                              fontWeight: FontWeight.w400,
                              fontSize: 12,
                              color: const Color.fromRGBO(178, 161, 228, 1))),
                      Text.rich(
                        TextSpan(
                          text: "\$14,235",
                          style: GoogleFonts.sora(
                              fontWeight: FontWeight.w600,
                              fontSize: 36,
                              color: const Color.fromRGBO(255, 255, 255, 1)),
                          children: [
                            TextSpan(
                                text: ".34",
                                style: GoogleFonts.sora(
                                    fontWeight: FontWeight.w600,
                                    fontSize: 24,
                                    color: const Color.fromRGBO(
                                        255, 255, 255, 1))),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 24),
          // Recent Transfers Section
          Container(
            padding: const EdgeInsets.only(left: 16, right: 16),
            child: Text("Recent Transfers",
                style: GoogleFonts.sora(
                    fontWeight: FontWeight.w600,
                    fontSize: 14,
                    color: const Color.fromRGBO(25, 25, 25, 1))),
          ),
          const SizedBox(height: 16),
          // List of Transactions
          Expanded(
            child: ListView.builder(
              itemCount: transactions.length,
              itemBuilder: (context, index) {
                final transaction = transactions[index];
                final amount = double.parse(transaction["amount"] ?? "0.00");
                final isExpense = transaction["isExpense"] ?? false;

                return Container(
                  padding: const EdgeInsets.only(left: 16, right: 16),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Container(
                            height: 32,
                            width: 32,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                              image: DecorationImage(
                                image: AssetImage(transaction["type"] ??
                                    "assets/transaction/default.png"),
                                fit: BoxFit.fill,
                              ),
                            ),
                          ),
                          const SizedBox(width: 8),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(transaction["name"] ?? "Unknown",
                                  style: GoogleFonts.sora(
                                      fontWeight: FontWeight.w600,
                                      fontSize: 12,
                                      color:
                                          const Color.fromRGBO(25, 25, 25, 1))),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Text(transaction["date"] ?? "Unknown",
                                      style: GoogleFonts.sora(
                                          fontWeight: FontWeight.w400,
                                          fontSize: 12,
                                          color: const Color.fromRGBO(
                                              120, 131, 141, 1))),
                                  const SizedBox(width: 4),
                                  Text(transaction["time"] ?? "Unknown",
                                      style: GoogleFonts.sora(
                                          fontWeight: FontWeight.w400,
                                          fontSize: 12,
                                          color: const Color.fromRGBO(
                                              120, 131, 141, 1))),
                                ],
                              ),
                            ],
                          ),
                          const Spacer(),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Text(
                                "\$${amount.toStringAsFixed(2)}",
                                style: GoogleFonts.sora(
                                  fontWeight: FontWeight.w600,
                                  fontSize: 12,
                                  color: isExpense
                                      ? Colors.red
                                      : const Color.fromRGBO(40, 155, 79, 1),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      const SizedBox(height: 12), // Space between rows
                      const Divider(
                          height: 1,
                          color: Color.fromRGBO(
                              237, 239, 246, 1)), // Optional divider
                      const SizedBox(
                          height:
                              16), // Additional space after each transaction
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
