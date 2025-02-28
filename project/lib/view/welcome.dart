import 'dart:async';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart'; // Import Google Fonts
import 'package:project/view/login.dart';
import 'package:project/view/sign_up.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class Welcome extends StatefulWidget {
  const Welcome({super.key});

  @override
  State<Welcome> createState() => _WelcomeState();
}

class _WelcomeState extends State<Welcome> {
  final List<String> images = [
    "https://southjewellery.com/wp-content/uploads/2021/09/Madhuri-Dixit-in-a-green-paithani-saree-by-Madhurya-creations-for-dance-deewane-4.jpg",
    "https://pbs.twimg.com/media/GKxtxGEWsAEq2PV.jpg:large",
    "https://static.toiimg.com/photo/103955082/103955082.jpg",
    "https://cdn.shopify.com/s/files/1/0665/6222/8454/files/Kiara_Advani_wedding_jewellery_480x480.jpg?v=1681196092",
    "https://www.dishisjewels.com/blog/wp-content/uploads/2023/09/316-1024x512.jpg"
  ];

  final PageController _controller = PageController();
  Timer? _timer;

  @override
  void initState() {
    super.initState();
    _startAutoScroll();
  }

  @override
  void dispose() {
    _timer?.cancel();
    _controller.dispose();
    super.dispose();
  }

  void _startAutoScroll() {
    _timer = Timer.periodic(const Duration(seconds: 3), (Timer timer) {
      if (_controller.hasClients) {
        int nextPage = (_controller.page!.toInt() + 1) % images.length;
        _controller.animateToPage(
          nextPage,
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeInOut,
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          // Slidable Image Carousel
          Container(
            height: 600,
            width: double.infinity,
            child: PageView.builder(
              controller: _controller,
              itemCount: images.length,
              itemBuilder: (context, index) {
                return Container(
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(30),
                      bottomRight: Radius.circular(30),
                    ),
                  ),
                  clipBehavior: Clip.antiAlias,
                  child: Image.network(
                    images[index],
                    fit: BoxFit.cover,
                  ),
                );
              },
            ),
          ),
          const SizedBox(height: 10),

          // SmoothPageIndicator below the images
          SmoothPageIndicator(
            controller: _controller,
            count: images.length,
            effect: const ExpandingDotsEffect(
              activeDotColor: Color.fromARGB(255, 3, 80, 5),
              dotHeight: 10,
              dotWidth: 10,
              expansionFactor: 4,
              dotColor: Colors.grey,
            ),
          ),

          const SizedBox(height: 20),

          // Wavy "NYSA" Text
          ShaderMask(
            shaderCallback: (bounds) => const LinearGradient(
              colors: [
                const Color.fromARGB(255, 83, 105, 248),
                Color.fromARGB(255, 89, 192, 249),
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ).createShader(bounds),
            child: Text(
              "NYSA",
              style: GoogleFonts.poppins(
                fontSize: 40,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ),

          Text(
            "Redefining Luxury and Style",
            style: GoogleFonts.poppins(
              fontSize: 20,
              fontWeight: FontWeight.w600,
              color: Colors.grey[700],
            ),
          ),
          const SizedBox(height: 20),

          // Decorative Divider
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 50.0),
            child: Divider(
              color: Colors.grey[400],
              thickness: 1.5,
            ),
          ),
          const SizedBox(height: 20),

          // Buttons
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              SizedBox(
                width: 150,
                child: Container(
                  decoration: BoxDecoration(
                    gradient: const LinearGradient(
                      colors: [
                        Color.fromARGB(255, 83, 105, 248),
                        Color.fromARGB(255, 89, 192, 249),
                      ],
                    ),
                    borderRadius: BorderRadius.circular(50),
                  ),
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => LoginPage()),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(vertical: 16.0),
                      backgroundColor: Colors.transparent,
                      shadowColor: Colors.black.withOpacity(0.25),
                      elevation: 10,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(50),
                      ),
                    ),
                    child: Text(
                      'Login',
                      style: GoogleFonts.poppins(
                        fontSize: 18.0,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                width: 150,
                child: Container(
                  decoration: BoxDecoration(
                    gradient: const LinearGradient(
                      colors: [
                        Color.fromARGB(255, 248, 83, 105),
                        Color.fromARGB(255, 249, 192, 89),
                      ],
                    ),
                    borderRadius: BorderRadius.circular(50),
                  ),
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => SignupPage()),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(vertical: 16.0),
                      backgroundColor: Colors.transparent,
                      shadowColor: Colors.black.withOpacity(0.25),
                      elevation: 10,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(50),
                      ),
                    ),
                    child: Text(
                      'Sign Up',
                      style: GoogleFonts.poppins(
                        fontSize: 18.0,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
