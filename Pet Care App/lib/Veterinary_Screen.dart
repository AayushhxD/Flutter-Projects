import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pet_care_app/Doctor_Screen.dart';

class Veterinary_Screen extends StatefulWidget {
  const Veterinary_Screen({super.key});

  @override
  State<Veterinary_Screen> createState() => _Veterinary_ScreenState();
}

class _Veterinary_ScreenState extends State<Veterinary_Screen>
    with SingleTickerProviderStateMixin {
  late final AnimationController _animationController;
  late final Animation<double> _fadeAnimation;
  late final Animation<double> _scaleAnimation;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1),
    )..forward();
    _fadeAnimation = Tween<double>(begin: 0, end: 1).animate(CurvedAnimation(
      parent: _animationController,
      curve: Curves.easeIn,
    ));
    _scaleAnimation = Tween<double>(begin: 0.9, end: 1).animate(CurvedAnimation(
      parent: _animationController,
      curve: Curves.easeOut,
    ));
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(245, 245, 247, 1),
      body: FadeTransition(
        opacity: _fadeAnimation,
        child: ScaleTransition(
          scale: _scaleAnimation,
          child: SingleChildScrollView(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 60, left: 24, right: 24),
                  child: Row(
                    children: [
                      const Icon(
                        Icons.location_on_outlined,
                        color: Color.fromRGBO(245, 146, 69, 1),
                      ),
                      const SizedBox(width: 5),
                      Text(
                        "London, UK",
                        style: GoogleFonts.poppins(
                          fontWeight: FontWeight.w500,
                          fontSize: 14,
                          color: const Color.fromRGBO(194, 195, 204, 1),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 15, horizontal: 24),
                  child: Container(
                    width: double.infinity,
                    height: 98,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16),
                      color: const Color.fromRGBO(245, 146, 69, 1),
                      boxShadow: [
                        BoxShadow(
                          offset: const Offset(0, 8),
                          blurRadius: 16,
                          spreadRadius: -4,
                          color: Color.fromRGBO(22, 34, 51, 0.08),
                        ),
                      ],
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "Let Find Specialist",
                                style: GoogleFonts.poppins(
                                  fontWeight: FontWeight.w600,
                                  fontSize: 16,
                                  color: Colors.white,
                                ),
                              ),
                              Text(
                                "Doctor for Your Pet!",
                                style: GoogleFonts.poppins(
                                  fontWeight: FontWeight.w600,
                                  fontSize: 16,
                                  color: Colors.white,
                                ),
                              ),
                            ],
                          ),
                          const Spacer(),
                          Container(
                            width: 100,
                            height: 100,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                              boxShadow: const [
                                BoxShadow(
                                  offset: Offset(0, 11),
                                  blurRadius: 25,
                                  color: Color.fromRGBO(22, 34, 51, 0.08),
                                ),
                              ],
                              image: const DecorationImage(
                                  image: AssetImage("assets/image (6).png"),
                                  fit: BoxFit.cover),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 8, horizontal: 24),
                  child: TextField(
                    decoration: InputDecoration(
                      suffixIcon: const Icon(
                        Icons.search,
                        color: Color.fromRGBO(245, 146, 69, 1),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                        borderSide: BorderSide(
                          width: 2,
                          color: Color.fromRGBO(245, 146, 69, 1),
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                        borderSide: BorderSide(
                          width: 2,
                          color: Color.fromRGBO(245, 146, 69, 1),
                        ),
                      ),
                      hintText: "Search ",
                      hintStyle: GoogleFonts.poppins(
                        fontWeight: FontWeight.w400,
                        fontSize: 12,
                        color: const Color.fromRGBO(194, 195, 204, 1),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 8, horizontal: 24),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Our Services",
                        style: GoogleFonts.poppins(
                          fontWeight: FontWeight.w500,
                          fontSize: 14,
                          color: const Color.fromRGBO(0, 0, 0, 1),
                        ),
                      ),
                      Text(
                        "See All",
                        style: GoogleFonts.poppins(
                          fontWeight: FontWeight.w400,
                          fontSize: 12,
                          color: const Color.fromRGBO(194, 195, 204, 1),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 8, horizontal: 24),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      _buildServiceItem(
                          "Vaccinations", "assets/image (22).png"),
                      _buildServiceItem("Operations", "assets/image (7).png"),
                      _buildServiceItem("Behaviorals", "assets/image (8).png"),
                      _buildServiceItem("Dentistry", "assets/image (9).png"),
                    ],
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 8, horizontal: 24),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Best Specialists Nearby",
                        style: GoogleFonts.poppins(
                          fontWeight: FontWeight.w500,
                          fontSize: 14,
                          color: const Color.fromRGBO(0, 0, 0, 1),
                        ),
                      ),
                    ],
                  ),
                ),
                Column(
                  children: [
                    _buildSpecialistCard(
                      "Dr. Anna Johanson",
                      "Veterinary Behavioral",
                      "assets/image (10).png",
                      "4.8",
                      "1 km",
                    ),
                    _buildSpecialistCard(
                      "Dr. Vernon Chwe",
                      "Veterinary Surgery",
                      "assets/image (11).png",
                      "4.9",
                      "1.5 km",
                    ),
                    _buildSpecialistCard(
                      "Dr. Maria Nai",
                      "Veterinary Dentist",
                      "assets/image (23).png",
                      "4.9",
                      "2.5 km",
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            _buildBottomNavItem(
                Icons.home_outlined, 'Home', Color.fromRGBO(126, 128, 143, 1)),
            _buildBottomNavItem(Icons.favorite_border, 'Service',
                Color.fromRGBO(245, 146, 69, 1)),
            const SizedBox(width: 60),
            _buildBottomNavItem(
                Icons.history, 'History', Color.fromRGBO(126, 128, 143, 1)),
            _buildBottomNavItem(Icons.person_2_outlined, 'Profile',
                Color.fromRGBO(126, 128, 143, 1)),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        shape: const CircleBorder(),
        backgroundColor: const Color(0xffF59245),
        elevation: 0,
        onPressed: () {},
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.shopping_cart_outlined, color: Colors.white),
            const Text('Shop', style: TextStyle(color: Colors.white)),
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }

  Widget _buildServiceItem(String title, String imagePath) {
    return Column(
      children: [
        Container(
          width: 60,
          height: 60,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            color: const Color.fromRGBO(255, 255, 255, 1),
            image: DecorationImage(
              image: AssetImage(imagePath),
              fit: BoxFit.cover,
            ),
          ),
        ),
        const SizedBox(height: 6),
        Text(
          title,
          style: GoogleFonts.poppins(
            fontWeight: FontWeight.w400,
            fontSize: 12,
            color: const Color.fromRGBO(126, 128, 143, 1),
          ),
        ),
      ],
    );
  }

  Widget _buildSpecialistCard(String name, String specialty, String imagePath,
      String rating, String distance) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      width: 390,
      height: 150,
      margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 24),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        color: const Color.fromRGBO(255, 255, 255, 1),
        boxShadow: const [
          BoxShadow(
            offset: Offset(0, 8),
            blurRadius: 16,
            spreadRadius: -4,
            color: Color.fromRGBO(22, 34, 51, 0.08),
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => Doctor_Screen(),
              ),
            );
          },
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                height: 130,
                width: 130,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  image: DecorationImage(
                    image: AssetImage(imagePath),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              const SizedBox(width: 10),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    name,
                    style: GoogleFonts.poppins(
                      fontWeight: FontWeight.w500,
                      fontSize: 16,
                      color: const Color.fromRGBO(0, 0, 0, 1),
                    ),
                  ),
                  Text(
                    specialty,
                    style: GoogleFonts.poppins(
                      fontWeight: FontWeight.w400,
                      fontSize: 12,
                      color: const Color.fromRGBO(126, 128, 143, 1),
                    ),
                  ),
                  const SizedBox(height: 5),
                  Row(
                    children: [
                      Icon(
                        Icons.star,
                        color: Color.fromRGBO(255, 195, 0, 1),
                        size: 18,
                      ),
                      Text(
                        rating,
                        style: GoogleFonts.poppins(
                          fontWeight: FontWeight.w500,
                          fontSize: 14,
                          color: Color.fromRGBO(0, 0, 0, 1),
                        ),
                      ),
                      const SizedBox(width: 15),
                      Text(
                        distance,
                        style: GoogleFonts.poppins(
                          fontWeight: FontWeight.w400,
                          fontSize: 12,
                          color: Color.fromRGBO(126, 128, 143, 1),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              const Spacer(),
              IconButton(
                icon: const Icon(Icons.info_outline,
                    color: Color.fromRGBO(245, 146, 69, 1)),
                onPressed: () {
                  // Optionally, you can also navigate to the Doctor_Screen from here if needed.
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Doctor_Screen(),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildBottomNavItem(IconData icon, String label, Color color) {
    return Column(
      children: [
        Icon(
          icon,
          size: 30,
          color: color,
        ),
        Text(
          label,
          style: TextStyle(color: color),
        ),
      ],
    );
  }
}
