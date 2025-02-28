import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:wallet_app/view/transfer_pages/transfer_fail_page.dart';

class TransferToBeneficiaryScreen extends StatefulWidget {
  const TransferToBeneficiaryScreen({super.key});

  @override
  State<TransferToBeneficiaryScreen> createState() =>
      _TransferToBeneficiaryScreenState();
}

class _TransferToBeneficiaryScreenState
    extends State<TransferToBeneficiaryScreen> {
  TextEditingController amountController = TextEditingController();
  bool securePayment = false;

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
              const SizedBox(
                width: 10,
              ),
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
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                alignment: Alignment.topCenter,
                child: Text(
                  "Transfer to",
                  textAlign: TextAlign.center,
                  style: GoogleFonts.sora(
                    fontWeight: FontWeight.w400,
                    fontSize: 24,
                    color: const Color.fromRGBO(0, 0, 0, 1),
                  ),
                ),
              ),
              const SizedBox(
                height: 40,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    height: 72,
                    width: 72,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      image: const DecorationImage(
                        image: AssetImage("assets/profile_pic/profile_pic.png"),
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),
                  const SizedBox(width: 14),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "John Doe",
                        style: GoogleFonts.sora(
                          fontWeight: FontWeight.w600,
                          fontSize: 16,
                          color: const Color.fromRGBO(25, 25, 25, 1),
                        ),
                      ),
                      Text(
                        "+91 1234567890",
                        style: GoogleFonts.sora(
                          fontWeight: FontWeight.w400,
                          fontSize: 12,
                          color: const Color.fromRGBO(120, 131, 141, 1),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              const SizedBox(
                height: 24,
              ),
              Text(
                "Enter Amount",
                style: GoogleFonts.sora(
                  fontWeight: FontWeight.w400,
                  fontSize: 12,
                  color: const Color.fromRGBO(120, 131, 141, 1),
                ),
              ),
              const SizedBox(
                height: 8,
              ),
              Container(
                padding: const EdgeInsets.only(left: 70, right: 70),
                child: TextField(
                  style: GoogleFonts.sora(
                    fontWeight: FontWeight.w400,
                    fontSize: 36,
                    color: const Color.fromRGBO(25, 25, 25, 1),
                  ),
                  controller: amountController,
                  textAlign: TextAlign.center,
                  decoration: InputDecoration(
                    hintText: "\$00.00",
                    hintStyle: GoogleFonts.sora(
                      fontWeight: FontWeight.w400,
                      fontSize: 36,
                      color: const Color.fromRGBO(186, 194, 199, 1),
                    ),
                    border: const UnderlineInputBorder(
                      borderSide: BorderSide(
                        color: Color.fromRGBO(87, 50, 191, 1),
                        width: 2,
                      ),
                    ),
                  ),
                  keyboardType: TextInputType.number,
                ),
              ),
              const SizedBox(
                height: 400,
              ),
              securePayment
                  ? GestureDetector(
                      onTap: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) {
                          return const PaymentFailScreen();
                        }));
                      },
                      child: Container(
                        height: 45,
                        alignment: Alignment.center,
                        width: double.infinity,
                        decoration: const BoxDecoration(
                          borderRadius: BorderRadius.all(
                            Radius.circular(4),
                          ),
                          color: Color.fromRGBO(253, 194, 40, 1),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Image(
                              image: AssetImage("assets/secure_pay.png"),
                              height: 20,
                              width: 20,
                              color: Color.fromRGBO(39, 6, 133, 1),
                            ),
                            const SizedBox(
                              width: 2,
                            ),
                            Text(
                              "Secure payment",
                              textAlign: TextAlign.center,
                              style: GoogleFonts.sora(
                                fontWeight: FontWeight.w600,
                                fontSize: 14,
                                color: const Color.fromRGBO(39, 6, 133, 1),
                              ),
                            ),
                          ],
                        ),
                      ),
                    )
                  : GestureDetector(
                      onTap: () {
                        setState(() {
                          securePayment = true;
                        });
                      },
                      child: Container(
                        height: 45,
                        alignment: Alignment.center,
                        width: double.infinity,
                        decoration: const BoxDecoration(
                          borderRadius: BorderRadius.all(
                            Radius.circular(4),
                          ),
                          color: Color.fromRGBO(87, 50, 191, 1),
                        ),
                        child: Text(
                          "Done",
                          textAlign: TextAlign.center,
                          style: GoogleFonts.sora(
                            fontWeight: FontWeight.w600,
                            fontSize: 14,
                            color: const Color.fromRGBO(255, 255, 255, 1),
                          ),
                        ),
                      ),
                    ),
            ],
          ),
        ),
      ),
    );
  }
}
