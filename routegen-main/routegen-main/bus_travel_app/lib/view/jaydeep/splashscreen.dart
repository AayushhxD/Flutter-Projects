import 'dart:developer';

import 'package:routegen/view/conductor/conductor_screen1.dart';
import 'package:routegen/view/jaydeep/admin_side/admin_screen1.dart';
///import 'package:routegen/view/jaydeep/loginpage.dart';
import 'package:routegen/view/jaydeep/welcome_page.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:routegen/model/session.dart';
import 'package:routegen/view/onboarding_screen.dart';

class SplashscreenPage extends StatefulWidget {
  const SplashscreenPage({super.key});

  @override
  State<SplashscreenPage> createState() => _SplashscreenPageState();
}

class _SplashscreenPageState extends State<SplashscreenPage> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _fadeAnimation;
  late Animation<double> _scaleAnimation;
  late Animation<double> _textSlideAnimation;

  void navigate(BuildContext context) {
    Future.delayed(const Duration(seconds: 3), () async {
      // bool status = false;
      await SessionData.getSessionData();
      if (SessionData.isLogin!) {
        log("Session data : ${SessionData.emailId} ........");
        String username = SessionData.emailId!;
        final List<String> parts = username.split('@');

        if(parts[1] == 'routegen.com'){
          if(parts[0] == "wizards"){
            Navigator.of(context).pushReplacement(
              MaterialPageRoute(
                builder: (context) => const AdminScreen1()),
            );
          }else{
            Navigator.of(context).pushReplacement(
              MaterialPageRoute(builder: (context)=> const ConductorScreen1()),
            );
          }
        }else{
          Navigator.of(context).pushReplacement(
            MaterialPageRoute(
              builder: (context) {
                return const OnBoarding();
              },
            ),
          );
        }
      } else {
        Navigator.pushReplacement(
          // ignore: use_build_context_synchronously
          context,
          PageRouteBuilder(
            pageBuilder: (context, animation, secondaryAnimation) =>
                const WelcomePage(),
            transitionsBuilder:
                (context, animation, secondaryAnimation, child) {
              return FadeTransition(
                opacity: animation,
                child: child,
              );
            },
            transitionDuration: const Duration(milliseconds: 800),
          ),
        );
      }
    });
  }

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      duration: const Duration(seconds: 3),
      vsync: this,
    );

    _fadeAnimation = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(CurvedAnimation(
      parent: _controller,
      curve: const Interval(0.0, 0.5, curve: Curves.easeIn),
    ));

    _scaleAnimation = Tween<double>(
      begin: 0.5,
      end: 1.0,
    ).animate(CurvedAnimation(
      parent: _controller,
      curve: const Interval(0.0, 0.5, curve: Curves.easeOutBack),
    ));

    _textSlideAnimation = Tween<double>(
      begin: 50.0,
      end: 0.0,
    ).animate(CurvedAnimation(
      parent: _controller,
      curve: const Interval(0.3, 0.8, curve: Curves.easeOut),
    ));

    _startAnimation();
  }

  void _startAnimation() {
    _controller.forward();

    Future.delayed(const Duration(seconds: 3), () {
      navigate(context);
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(255, 206, 72, 1),
      body: AnimatedBuilder(
        animation: _controller,
        builder: (context, child) {
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Transform.scale(
                  scale: _scaleAnimation.value,
                  child: Opacity(
                    opacity: _fadeAnimation.value,
                    child: Hero(
                      tag: 'app_logo',
                      child: Image.asset(
                        "asset/RG_logo.png",
                        height: 130,
                        width: 130,
                      ),
                    ),
                  ),
                ),
                Transform.translate(
                  offset: Offset(0, _textSlideAnimation.value),
                  child: Opacity(
                    opacity: _fadeAnimation.value,
                    child: Column(
                      children: [
                        const SizedBox(height: 20),
                        Hero(
                          tag: 'route_gen_text',
                          child: Material(
                            color: Colors.transparent,
                            child: ShaderMask(
                              shaderCallback: (bounds) => LinearGradient(
                                colors: [
                                  Colors.black,
                                  Colors.black.withOpacity(0.8),
                                ],
                              ).createShader(bounds),
                              child: Text(
                                "RouteGen",
                                style: GoogleFonts.raleway(
                                  fontSize: 32,
                                  fontWeight: FontWeight.w700,
                                  color: Colors.black,
                                  letterSpacing: 1.5,
                                ),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(height: 8),
                        Text(
                          "Your Journey, Our Priority",
                          style: GoogleFonts.raleway(
                            fontSize: 16,
                            color: Colors.black54,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
