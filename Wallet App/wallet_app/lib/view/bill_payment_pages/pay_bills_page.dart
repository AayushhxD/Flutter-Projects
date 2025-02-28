import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:wallet_app/view/bill_payment_pages/payment_success_page.dart';

class PayBillsScreen extends StatefulWidget {
  const PayBillsScreen({super.key});

  @override
  State<PayBillsScreen> createState() => _PayBillsScreenState();
}

class _PayBillsScreenState extends State<PayBillsScreen> {
  final List<Map<String, String>> billers = [
    {"name": "Electricity", "amount": "\$132.32"},
    {"name": "Water", "amount": "\$45.00"},
    {"name": "Internet", "amount": "\$70.15"},
    {"name": "Gas", "amount": "\$60.25"},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(255, 255, 255, 1),
      appBar: AppBar(
        backgroundColor: const Color.fromRGBO(255, 255, 255, 1),
        leading: GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: Row(
            children: [
              const SizedBox(width: 10),
              const Icon(
                Icons.arrow_back_ios,
                size: 12,
                color: Color.fromRGBO(29, 98, 202, 1),
              ),
              Text(
                "Back",
                style: GoogleFonts.sora(
                  fontWeight: FontWeight.w600,
                  fontSize: 16,
                  color: const Color.fromRGBO(29, 98, 202, 1),
                ),
              ),
            ],
          ),
        ),
        leadingWidth: 70,
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 16, right: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Pay to",
              style: GoogleFonts.sora(
                fontWeight: FontWeight.w400,
                fontSize: 24,
                color: const Color.fromRGBO(0, 0, 0, 1),
              ),
            ),
            const SizedBox(height: 40),
            Row(children: [
              GestureDetector(
                onTap: () {},
                child: Container(
                  height: 48,
                  width: 48,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: Color.fromRGBO(230, 221, 255, 1),
                  ),
                  child: const Icon(
                    Icons.add,
                    size: 30,
                    color: Color.fromRGBO(87, 50, 191, 1),
                  ),
                ),
              ),
              const SizedBox(width: 8),
              Text(
                "New biller",
                style: GoogleFonts.sora(
                  fontWeight: FontWeight.w400,
                  fontSize: 14,
                  color: const Color.fromRGBO(25, 25, 25, 1),
                ),
              ),
            ]),
            const SizedBox(height: 16),
            Row(
              children: [
                const Expanded(
                  child: Divider(
                      color: Color.fromRGBO(237, 239, 246, 1),
                      thickness: 1,
                      height: 1),
                ),
                const SizedBox(width: 8),
                Text(
                  "or",
                  style: GoogleFonts.sora(
                    fontWeight: FontWeight.w400,
                    fontSize: 12,
                    color: const Color.fromRGBO(120, 131, 141, 1),
                  ),
                ),
                const SizedBox(width: 8),
                const Expanded(
                  child: Divider(
                      color: Color.fromRGBO(237, 239, 246, 1),
                      thickness: 1,
                      height: 1),
                )
              ],
            ),
            const SizedBox(height: 16),
            Container(
              padding:
                  const EdgeInsets.only(left: 12, right: 12, top: 8, bottom: 8),
              height: 40,
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(4),
                border: Border.all(
                  color: const Color.fromRGBO(225, 227, 237, 1),
                  width: 1,
                ),
              ),
              child: TextField(
                decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: "Search biller",
                    hintStyle: GoogleFonts.sora(
                      fontWeight: FontWeight.w400,
                      fontSize: 14,
                      color: const Color.fromRGBO(186, 194, 199, 1),
                    ),
                    icon: Image.asset(
                      "assets/search.png",
                      height: 17,
                      width: 17,
                      fit: BoxFit.fill,
                    )),
              ),
            ),
            const SizedBox(height: 16),
            Text(
              "Saved billers",
              style: GoogleFonts.sora(
                fontWeight: FontWeight.w400,
                fontSize: 12,
                color: const Color.fromRGBO(83, 93, 102, 1),
              ),
            ),
            Expanded(
              child: ListView.builder(
                  itemCount: billers.length,
                  itemBuilder: (context, index) {
                    return Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 12, bottom: 12),
                          child: GestureDetector(
                            onTap: () {
                              bottomNaviBarBill(billers[index]);
                            },
                            child: Row(
                              children: [
                                Container(
                                  height: 32,
                                  width: 32,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(8),
                                    image: const DecorationImage(
                                        image:
                                            AssetImage("assets/paybills.png"),
                                        fit: BoxFit.fill),
                                  ),
                                ),
                                const SizedBox(width: 3),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      billers[index]["name"]!,
                                      style: GoogleFonts.sora(
                                        fontWeight: FontWeight.w600,
                                        fontSize: 12,
                                        color:
                                            const Color.fromRGBO(25, 25, 25, 1),
                                      ),
                                    ),
                                    Text(
                                      "Due: ${billers[index]["amount"]}",
                                      style: GoogleFonts.sora(
                                        fontWeight: FontWeight.w400,
                                        fontSize: 12,
                                        color: const Color.fromRGBO(
                                            83, 93, 102, 1),
                                      ),
                                    ),
                                  ],
                                ),
                                const Spacer(),
                                const Icon(
                                  Icons.arrow_forward_ios,
                                  size: 16,
                                  color: Color.fromRGBO(83, 93, 102, 1),
                                )
                              ],
                            ),
                          ),
                        ),
                        const Divider(
                          height: 1,
                          thickness: 1,
                          color: Color.fromRGBO(237, 239, 246, 1),
                        )
                      ],
                    );
                  }),
            )
          ],
        ),
      ),
    );
  }

  Future<void> bottomNaviBarBill(Map<String, String> biller) async {
    await showModalBottomSheet(
        isDismissible: true,
        isScrollControlled: true,
        backgroundColor: const Color.fromRGBO(255, 255, 255, 1),
        context: context,
        builder: (context) {
          return Padding(
            padding: EdgeInsets.only(
                left: 16,
                right: 16,
                top: 16,
                bottom: MediaQuery.of(context).viewInsets.bottom),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Row(
                  children: [
                    Container(
                      height: 32,
                      width: 32,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        image: const DecorationImage(
                            image: AssetImage("assets/paybills.png"),
                            fit: BoxFit.fill),
                      ),
                    ),
                    const SizedBox(width: 3),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                biller["name"]!,
                                style: GoogleFonts.sora(
                                  fontWeight: FontWeight.w600,
                                  fontSize: 12,
                                  color: const Color.fromRGBO(25, 25, 25, 1),
                                ),
                              ),
                              const Spacer(),
                              GestureDetector(
                                onTap: () {},
                                child: Text(
                                  "Done",
                                  style: GoogleFonts.sora(
                                    fontWeight: FontWeight.w600,
                                    fontSize: 14,
                                    color: const Color.fromRGBO(29, 98, 202, 1),
                                  ),
                                ),
                              )
                            ],
                          ),
                          Text(
                            "Utility",
                            style: GoogleFonts.sora(
                              fontWeight: FontWeight.w400,
                              fontSize: 12,
                              color: const Color.fromRGBO(83, 93, 102, 1),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 24),
                Container(
                  padding: const EdgeInsets.only(
                      top: 16, bottom: 16, left: 8, right: 8),
                  alignment: Alignment.center,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: const Color.fromRGBO(29, 98, 202, 1),
                    borderRadius: BorderRadius.circular(4),
                  ),
                  child: GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const PaymentSuccessScreen(),
                        ),
                      );
                    },
                    child: Text(
                      "Pay ${biller['amount']}",
                      style: GoogleFonts.sora(
                        fontWeight: FontWeight.w600,
                        fontSize: 16,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 16),
              ],
            ),
          );
        });
  }
}
