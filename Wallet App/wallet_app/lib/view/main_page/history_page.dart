import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:wallet_app/view/main_page/boiler_plate_main.dart';

class HistoryScreen extends StatefulWidget {
  const HistoryScreen({super.key});

  @override
  State<HistoryScreen> createState() => _HistoryScreenState();
}

class _HistoryScreenState extends State<HistoryScreen> {
  final List<Map<String, dynamic>> transactions = [
    {
      'name': 'Nike',
      'date': 'Today',
      'time': '12:32',
      'amount': 50.23,
      'type': 'Expense',
      'image': 'assets/Nike.png',
    },
    {
      'name': 'Starbucks',
      'date': 'Yesterday',
      'time': '09:15',
      'amount': 5.75,
      'type': 'Expense',
      'image': 'assets/Starbuck.png',
    },
    {
      'name': 'Amazon',
      'date': 'Yesterday',
      'time': '11:45',
      'amount': 30.50,
      'type': 'Expense',
      'image': 'assets/amazon.png',
    },
    {
      'name': 'PayPal',
      'date': 'Yesterday',
      'time': '14:00',
      'amount': 100.00,
      'type': 'Income',
      'image': 'assets/Topup.png',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(237, 239, 246, 1),
      bottomNavigationBar: BottomNaviBar(),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 30),
          Padding(
            padding: const EdgeInsets.only(left: 16, right: 16),
            child: Text(
              "History",
              style: GoogleFonts.sora(
                fontWeight: FontWeight.w600,
                fontSize: 24,
                color: Color.fromRGBO(25, 25, 25, 1),
              ),
            ),
          ),
          const SizedBox(height: 8),
          // Search and Filter Section
          Padding(
            padding: const EdgeInsets.only(left: 16, right: 16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  width: 233,
                  height: 37,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  decoration: BoxDecoration(
                    border: Border.all(
                      width: 1,
                      color: const Color.fromRGBO(225, 227, 237, 1),
                    ),
                    borderRadius: BorderRadius.circular(4),
                  ),
                  child: TextField(
                    textAlign: TextAlign.left,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: "Value goes here",
                      hintStyle: GoogleFonts.sora(
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        color: const Color.fromRGBO(186, 194, 199, 1),
                      ),
                      icon: Image.asset(
                        "assets/search.png",
                        height: 16,
                        width: 16,
                        color: const Color.fromRGBO(25, 25, 25, 1),
                      ),
                    ),
                  ),
                ),
                Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                  decoration: BoxDecoration(
                    border: Border.all(
                      width: 1,
                      color: const Color.fromRGBO(225, 227, 237, 1),
                    ),
                    borderRadius: BorderRadius.circular(4),
                  ),
                  child: Row(
                    children: [
                      Image.asset(
                        "assets/filter.png",
                        height: 16,
                        width: 16,
                        color: const Color.fromRGBO(25, 25, 25, 1),
                      ),
                      Text(
                        "Filter",
                        style: GoogleFonts.sora(
                          fontWeight: FontWeight.w400,
                          fontSize: 14,
                          color: const Color.fromRGBO(25, 25, 25, 1),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 24),
          Expanded(
            child: ListView.builder(
              itemCount: transactions.length,
              itemBuilder: (context, index) {
                final transaction = transactions[index];
                final isExpense = transaction['type'] == 'Expense';
                final previousTransaction =
                    index > 0 ? transactions[index - 1] : null;

                // Determine if a new section is needed
                bool isNewSection = previousTransaction == null ||
                    previousTransaction['date'] != transaction['date'];

                return Column(
                  children: [
                    if (isNewSection) // Add section header if it's a new section
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        child: Text(
                          transaction['date'],
                          style: GoogleFonts.sora(
                            fontWeight: FontWeight.w600,
                            fontSize: 16,
                            color: const Color.fromRGBO(25, 25, 25, 1),
                          ),
                        ),
                      ),
                    const SizedBox(height: 8),
                    Padding(
                      padding: const EdgeInsets.only(left: 16, right: 16),
                      child: GestureDetector(
                        onTap: () {
                          showBottomSheet(transaction);
                        },
                        child: Row(
                          children: [
                            Container(
                              height: 32,
                              width: 32,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8),
                                image: DecorationImage(
                                  image: AssetImage(transaction['image']),
                                  fit: BoxFit.fill,
                                ),
                              ),
                            ),
                            const SizedBox(width: 8),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  transaction['name'],
                                  style: GoogleFonts.sora(
                                    fontWeight: FontWeight.w600,
                                    fontSize: 12,
                                    color: const Color.fromRGBO(25, 25, 25, 1),
                                  ),
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Text(
                                      transaction['time'],
                                      style: GoogleFonts.sora(
                                        fontWeight: FontWeight.w400,
                                        fontSize: 12,
                                        color: const Color.fromRGBO(
                                            120, 131, 141, 1),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            const Spacer(),
                            Text(
                              isExpense
                                  ? '-\$${transaction['amount'].toStringAsFixed(2)}'
                                  : '+\$${transaction['amount'].toStringAsFixed(2)}',
                              style: GoogleFonts.sora(
                                fontWeight: FontWeight.w400,
                                fontSize: 12,
                                color: isExpense
                                    ? const Color.fromRGBO(184, 50, 50, 1)
                                    : const Color.fromRGBO(40, 155, 79, 1),
                              ),
                            ),
                            const SizedBox(width: 8),
                            const Icon(
                              Icons.arrow_forward_ios_rounded,
                              color: Color.fromRGBO(83, 93, 102, 1),
                              size: 10,
                            )
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(height: 16), // Space between transactions
                  ],
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  Future<void> showBottomSheet(Map<String, dynamic> transaction) async {
    await showModalBottomSheet(
      backgroundColor: const Color.fromRGBO(255, 255, 255, 1),
      context: context,
      isDismissible: true,
      isScrollControlled: true,
      builder: (context) {
        final isExpense = transaction['type'] == 'Expense';
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
                    height: 56,
                    width: 56,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      image: DecorationImage(
                        image: AssetImage(transaction['image']),
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),
                  const SizedBox(width: 12),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        transaction['name'],
                        style: GoogleFonts.sora(
                          fontWeight: FontWeight.w600,
                          fontSize: 16,
                          color: const Color.fromRGBO(25, 25, 25, 1),
                        ),
                      ),
                      Text(
                        transaction['date'],
                        style: GoogleFonts.sora(
                          fontWeight: FontWeight.w400,
                          fontSize: 14,
                          color: const Color.fromRGBO(120, 131, 141, 1),
                        ),
                      ),
                    ],
                  ),
                  const Spacer(),
                  Text(
                    isExpense
                        ? '-\$${transaction['amount'].toStringAsFixed(2)}'
                        : '+\$${transaction['amount'].toStringAsFixed(2)}',
                    style: GoogleFonts.sora(
                      fontWeight: FontWeight.w400,
                      fontSize: 12,
                      color: isExpense
                          ? const Color.fromRGBO(184, 50, 50, 1)
                          : const Color.fromRGBO(40, 155, 79, 1),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16),
            ],
          ),
        );
      },
    );
  }
}
