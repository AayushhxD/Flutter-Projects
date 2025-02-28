import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CardPayScreen extends StatefulWidget {
  const CardPayScreen({super.key});

  @override
  State<CardPayScreen> createState() => _CardPayScreenState();
}

class _CardPayScreenState extends State<CardPayScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _rotationAnimation;
  late Animation<double> _horizontalAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: 8),
      vsync: this,
    )..repeat();

    _rotationAnimation = Tween<double>(begin: 0, end: 2 * 3.14159).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Curves.linear,
      ),
    );

    //Create a horizontal movement animation
    _horizontalAnimation = Tween<double>(begin: -20, end: 20).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Curves.linear,
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios,
              color: Color.fromRGBO(29, 98, 202, 1)),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 40),
        child: Column(
          children: [
            Stack(
              children: [
                AnimatedBuilder(
                  animation: Listenable.merge(
                      [_rotationAnimation, _horizontalAnimation]),
                  builder: (context, child) {
                    return Transform.translate(
                      offset: Offset(
                          _horizontalAnimation.value, 0), // Horizontal movement
                      child: Transform.rotate(
                        angle: _rotationAnimation.value,
                        child: Container(
                          height: 210,
                          width: double.infinity,
                          padding: const EdgeInsets.all(16),
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              colors: [
                                Color.fromRGBO(39, 6, 133, 1),
                                Color.fromRGBO(111, 69, 233, 0.8),
                              ],
                              begin: Alignment.topLeft,
                              end: Alignment.bottomRight,
                            ),
                            borderRadius: BorderRadius.circular(16),
                            boxShadow: const [
                              BoxShadow(
                                blurRadius: 24,
                                offset: Offset(0, 16),
                                color: Color.fromRGBO(0, 0, 0, 0.2),
                              ),
                            ],
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "Ayush Godse",
                                    style: GoogleFonts.sora(
                                      fontWeight: FontWeight.w600,
                                      fontSize: 16,
                                      color: Colors.white,
                                    ),
                                  ),
                                  Text(
                                    "****8923",
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
                                  fontSize: 14,
                                  color: Color.fromRGBO(230, 221, 255, 1),
                                ),
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "\$2,354",
                                    style: GoogleFonts.sora(
                                      fontWeight: FontWeight.w600,
                                      fontSize: 24,
                                      color: Colors.white,
                                    ),
                                  ),
                                  Image.asset(
                                    "assets/card/wifi.png",
                                    height: 18,
                                    width: 18,
                                    fit: BoxFit.fill,
                                  ),
                                ],
                              ),
                              const SizedBox(height: 8),
                              Text(
                                "Valid Thru: 12/24",
                                style: GoogleFonts.sora(
                                  fontWeight: FontWeight.w400,
                                  fontSize: 12,
                                  color: Color.fromRGBO(230, 221, 255, 1),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ],
            ),
            const Spacer(),
            Image.asset(
              "assets/card/wifi.png",
              height: 18,
              width: 18,
              color: Color.fromRGBO(120, 131, 141, 1),
            ),
            const SizedBox(height: 6),
            Expanded(
              child: Text(
                "Move near a device to pay",
                style: GoogleFonts.sora(
                  fontWeight: FontWeight.w400,
                  fontSize: 16,
                  color: Color.fromRGBO(120, 131, 141, 1),
                ),
              ),
            ),
            const SizedBox(height: 16),
            GestureDetector(
              onTap: () {
                // Handle QR Pay functionality
              },
              child: Container(
                height: 45,
                alignment: Alignment.center,
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(4),
                  color: Color.fromRGBO(87, 50, 191, 1),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Icon(
                      Icons.qr_code,
                      size: 20,
                      color: Colors.white,
                    ),
                    const SizedBox(width: 8),
                    Text(
                      "QR Pay",
                      style: GoogleFonts.sora(
                        fontWeight: FontWeight.w600,
                        fontSize: 14,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
