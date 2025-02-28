import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:wallet_app/view/transfer_pages/transfer_to_beneficiary_page.dart';

class TransferScreen extends StatefulWidget {
  const TransferScreen({super.key});

  @override
  State<TransferScreen> createState() => _TransferScreenState();
}

class _TransferScreenState extends State<TransferScreen> {
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
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Transfer to",
                style: GoogleFonts.sora(
                  fontWeight: FontWeight.w400,
                  fontSize: 24,
                  color: const Color.fromRGBO(0, 0, 0, 1),
                ),
              ),
              const SizedBox(height: 40),
              Row(
                children: [
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
                    "New contact",
                    style: GoogleFonts.sora(
                      fontWeight: FontWeight.w400,
                      fontSize: 14,
                      color: const Color.fromRGBO(25, 25, 25, 1),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16),
              Row(
                children: [
                  const Expanded(
                    child: Divider(
                      color: Color.fromRGBO(237, 239, 246, 1),
                      thickness: 1,
                      height: 1,
                    ),
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
                      height: 1,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16),
              Container(
                padding: const EdgeInsets.only(
                    left: 12, right: 12, top: 8, bottom: 8),
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
                    hintText: "Search contact",
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
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 16),
              Text(
                "Frequent contacts",
                style: GoogleFonts.sora(
                  fontWeight: FontWeight.w400,
                  fontSize: 12,
                  color: const Color.fromRGBO(83, 93, 102, 1),
                ),
              ),
              SizedBox(
                height: 250,
                child: ListView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: 3,
                  itemBuilder: (context, index) {
                    final contacts = [
                      {"name": "John Doe", "number": "+91 1234567890"},
                      {"name": "Emma Watson", "number": "+91 2345678901"},
                      {"name": "Robert Brown", "number": "+91 3456789012"}
                    ];
                    return Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 16, bottom: 16),
                          child: GestureDetector(
                            onTap: () {
                              Navigator.push(context, MaterialPageRoute(
                                builder: (context) {
                                  return const TransferToBeneficiaryScreen();
                                },
                              ));
                            },
                            child: Row(
                              children: [
                                Container(
                                  height: 48,
                                  width: 48,
                                  decoration: const BoxDecoration(
                                    shape: BoxShape.circle,
                                    image: DecorationImage(
                                      image: AssetImage(
                                          "assets/profile_pic/profile_pic.png"),
                                      fit: BoxFit.fill,
                                    ),
                                  ),
                                ),
                                const SizedBox(width: 6),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      contacts[index]["name"]!,
                                      style: GoogleFonts.sora(
                                        fontWeight: FontWeight.w600,
                                        fontSize: 12,
                                        color:
                                            const Color.fromRGBO(25, 25, 25, 1),
                                      ),
                                    ),
                                    Text(
                                      contacts[index]["number"]!,
                                      style: GoogleFonts.sora(
                                        fontWeight: FontWeight.w400,
                                        fontSize: 12,
                                        color: const Color.fromRGBO(
                                            120, 131, 141, 1),
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
                  },
                ),
              ),
              const SizedBox(height: 16),
              Text(
                "All contacts",
                style: GoogleFonts.sora(
                  fontWeight: FontWeight.w400,
                  fontSize: 12,
                  color: const Color.fromRGBO(83, 93, 102, 1),
                ),
              ),
              SizedBox(
                height: 600,
                child: ListView.builder(
                  itemCount: 77,
                  itemBuilder: (context, index) {
                    return Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 16, bottom: 16),
                          child: GestureDetector(
                            onTap: () {
                              Navigator.push(context, MaterialPageRoute(
                                builder: (context) {
                                  return const TransferToBeneficiaryScreen();
                                },
                              ));
                            },
                            child: Row(
                              children: [
                                Container(
                                  height: 48,
                                  width: 48,
                                  decoration: const BoxDecoration(
                                    shape: BoxShape.circle,
                                    image: DecorationImage(
                                      image: AssetImage(
                                          "assets/profile_pic/profile_pic.png"),
                                      fit: BoxFit.fill,
                                    ),
                                  ),
                                ),
                                const SizedBox(width: 6),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "Ayush Godse",
                                      style: GoogleFonts.sora(
                                        fontWeight: FontWeight.w600,
                                        fontSize: 12,
                                        color:
                                            const Color.fromRGBO(25, 25, 25, 1),
                                      ),
                                    ),
                                    Text(
                                      "+91 9876543210",
                                      style: GoogleFonts.sora(
                                        fontWeight: FontWeight.w400,
                                        fontSize: 12,
                                        color: const Color.fromRGBO(
                                            120, 131, 141, 1),
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
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
