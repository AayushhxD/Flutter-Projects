import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:wallet_app/view/bill_payment_pages/pay_bills_page.dart';
import 'package:wallet_app/view/main_page/about_page.dart';
import 'package:wallet_app/view/main_page/boiler_plate_main.dart';
import 'package:wallet_app/view/transfer_pages/transfer_page.dart';

class MoreScreen extends StatefulWidget {
  const MoreScreen({super.key});

  @override
  State<MoreScreen> createState() => _MoreScreenState();
}

class _MoreScreenState extends State<MoreScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(255, 255, 255, 1),
      bottomNavigationBar: const BottomNaviBar(),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 35, left: 16, right: 16),
            child: Text(
              "More",
              style: GoogleFonts.sora(
                fontWeight: FontWeight.w600,
                fontSize: 24,
                color: const Color.fromRGBO(25, 25, 25, 1),
              ),
            ),
          ),
          const SizedBox(
            height: 24,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 16, right: 16),
            child: Column(
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) {
                          return const PayBillsScreen();
                        },
                      ),
                    );
                  },
                  child: Row(
                    children: [
                      Container(
                        height: 32,
                        width: 32,
                        decoration: const BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage("assets/paybills.png"),
                              fit: BoxFit.fill),
                        ),
                      ),
                      const SizedBox(
                        width: 8,
                      ),
                      Text(
                        "Pay bills",
                        style: GoogleFonts.sora(
                          fontWeight: FontWeight.w600,
                          fontSize: 12,
                          color: const Color.fromRGBO(25, 25, 25, 1),
                        ),
                      ),
                      const Spacer(),
                      const Icon(
                        Icons.arrow_forward_ios_rounded,
                        color: Color.fromRGBO(83, 93, 102, 1),
                        size: 16,
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 12,
                ),
                const Divider(
                  thickness: 1,
                  color: Color.fromRGBO(237, 239, 246, 1),
                ),
                const SizedBox(
                  height: 12,
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(
                      builder: (context) {
                        return const TransferScreen();
                      },
                    ));
                  },
                  child: Row(
                    children: [
                      Container(
                        height: 32,
                        width: 32,
                        decoration: const BoxDecoration(
                          image: DecorationImage(
                              image:
                                  AssetImage("assets/transaction/transfer.png"),
                              fit: BoxFit.fill),
                        ),
                      ),
                      const SizedBox(
                        width: 8,
                      ),
                      Text(
                        "Transfer",
                        style: GoogleFonts.sora(
                          fontWeight: FontWeight.w600,
                          fontSize: 12,
                          color: const Color.fromRGBO(25, 25, 25, 1),
                        ),
                      ),
                      const Spacer(),
                      const Icon(
                        Icons.arrow_forward_ios_rounded,
                        color: Color.fromRGBO(83, 93, 102, 1),
                        size: 16,
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 12,
                ),
                const Divider(
                  thickness: 1,
                  color: Color.fromRGBO(237, 239, 246, 1),
                ),
                const SizedBox(
                  height: 12,
                ),
                GestureDetector(
                  onTap: () {},
                  child: Row(
                    children: [
                      Container(
                        height: 32,
                        width: 32,
                        decoration: const BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage("assets/transaction/topup.png"),
                              fit: BoxFit.fill),
                        ),
                      ),
                      const SizedBox(
                        width: 8,
                      ),
                      Text(
                        "Topup",
                        style: GoogleFonts.sora(
                          fontWeight: FontWeight.w600,
                          fontSize: 12,
                          color: const Color.fromRGBO(25, 25, 25, 1),
                        ),
                      ),
                      const Spacer(),
                      const Icon(
                        Icons.arrow_forward_ios_rounded,
                        color: Color.fromRGBO(83, 93, 102, 1),
                        size: 16,
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 12,
                ),
                const Divider(
                  thickness: 1,
                  color: Color.fromRGBO(237, 239, 246, 1),
                ),
                const SizedBox(
                  height: 12,
                ),
                GestureDetector(
                  onTap: () {},
                  child: Row(
                    children: [
                      Container(
                        height: 32,
                        width: 32,
                        decoration: const BoxDecoration(
                          image: DecorationImage(
                              image:
                                  AssetImage("assets/transaction/withdraw.png"),
                              fit: BoxFit.fill),
                        ),
                      ),
                      const SizedBox(
                        width: 8,
                      ),
                      Text(
                        "Withdraw",
                        style: GoogleFonts.sora(
                          fontWeight: FontWeight.w600,
                          fontSize: 12,
                          color: const Color.fromRGBO(25, 25, 25, 1),
                        ),
                      ),
                      const Spacer(),
                      const Icon(
                        Icons.arrow_forward_ios_rounded,
                        color: Color.fromRGBO(83, 93, 102, 1),
                        size: 16,
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 12,
                ),
                const Divider(
                  thickness: 1,
                  color: Color.fromRGBO(237, 239, 246, 1),
                ),
                const SizedBox(
                  height: 12,
                ),
                GestureDetector(
                  onTap: () {},
                  child: Row(
                    children: [
                      Container(
                        height: 32,
                        width: 32,
                        decoration: const BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage("assets/analytics.png"),
                              fit: BoxFit.fill),
                        ),
                      ),
                      const SizedBox(
                        width: 8,
                      ),
                      Text(
                        "Analytics",
                        style: GoogleFonts.sora(
                          fontWeight: FontWeight.w600,
                          fontSize: 12,
                          color: const Color.fromRGBO(25, 25, 25, 1),
                        ),
                      ),
                      const Spacer(),
                      const Icon(
                        Icons.arrow_forward_ios_rounded,
                        color: Color.fromRGBO(83, 93, 102, 1),
                        size: 16,
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 12,
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 12,
          ),
          const Divider(
            thickness: 6,
            color: Color.fromRGBO(237, 239, 246, 1),
          ),
          const SizedBox(
            height: 12,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 16, right: 16),
            child: Column(
              children: [
                const SizedBox(
                  height: 12,
                ),
                GestureDetector(
                  onTap: () {},
                  child: Row(
                    children: [
                      Container(
                        height: 32,
                        width: 32,
                        decoration: const BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage("assets/help1.png"),
                              fit: BoxFit.fill),
                        ),
                      ),
                      const SizedBox(
                        width: 8,
                      ),
                      Text(
                        "Help",
                        style: GoogleFonts.sora(
                          fontWeight: FontWeight.w600,
                          fontSize: 12,
                          color: const Color.fromRGBO(25, 25, 25, 1),
                        ),
                      ),
                      const Spacer(),
                      const Icon(
                        Icons.arrow_forward_ios_rounded,
                        color: Color.fromRGBO(83, 93, 102, 1),
                        size: 16,
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 12,
                ),
                const Divider(
                  thickness: 1,
                  color: Color.fromRGBO(237, 239, 246, 1),
                ),
                const SizedBox(
                  height: 12,
                ),
                GestureDetector(
                  onTap: () {},
                  child: Row(
                    children: [
                      Container(
                        height: 32,
                        width: 32,
                        decoration: const BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage("assets/contact_us.png"),
                              fit: BoxFit.fill),
                        ),
                      ),
                      const SizedBox(
                        width: 8,
                      ),
                      Text(
                        "Contact us",
                        style: GoogleFonts.sora(
                          fontWeight: FontWeight.w600,
                          fontSize: 12,
                          color: const Color.fromRGBO(25, 25, 25, 1),
                        ),
                      ),
                      const Spacer(),
                      const Icon(
                        Icons.arrow_forward_ios_rounded,
                        color: Color.fromRGBO(83, 93, 102, 1),
                        size: 16,
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 12,
                ),
                const Divider(
                  thickness: 1,
                  color: Color.fromRGBO(237, 239, 246, 1),
                ),
                const SizedBox(
                  height: 12,
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(
                      builder: (context) {
                        return const AboutScreen();
                      },
                    ));
                  },
                  child: Row(
                    children: [
                      Container(
                        height: 32,
                        width: 32,
                        decoration: const BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage("assets/about.png"),
                              fit: BoxFit.fill),
                        ),
                      ),
                      const SizedBox(
                        width: 8,
                      ),
                      Text(
                        "About",
                        style: GoogleFonts.sora(
                          fontWeight: FontWeight.w600,
                          fontSize: 12,
                          color: const Color.fromRGBO(25, 25, 25, 1),
                        ),
                      ),
                      const Spacer(),
                      const Icon(
                        Icons.arrow_forward_ios_rounded,
                        color: Color.fromRGBO(83, 93, 102, 1),
                        size: 16,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
