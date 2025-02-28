import 'package:flutter/material.dart';
// import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:line_icons/line_icons.dart';
import 'package:routegen/view/pooja/your_ticket.dart';
import 'package:routegen/view/settings_screen.dart';
import './onboarding_screen.dart';
import './plan_screen.dart';

class OneBottomnav extends StatefulWidget {
  const OneBottomnav({super.key});

  @override
  State createState() => _BottomNavState();
}

int selectedIndex = 0;

class _BottomNavState extends State {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8),
      decoration: const BoxDecoration(
        color: Colors.white54,
      ),
      height: 67,
      child: GNav(
        rippleColor: Colors.grey[500]!,
        color: Colors.white,
        textSize: 10,
        // gap: 5,
        activeColor: const Color.fromRGBO(26, 21, 40, 1),
        padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 8),
        iconSize: 24,
        tabBackgroundColor: const Color.fromRGBO(255, 136, 17, 0.5),
        tabs: [
          /// SWITCH BACK TO HOME SCREEN
          GButton(
            icon: Icons.home_outlined,
            text: 'Home',
            textStyle:
                GoogleFonts.raleway(fontSize: 13, fontWeight: FontWeight.w500),
            iconColor: Colors.black,
            onPressed: () {
              if (selectedIndex != 0) {
                Navigator.of(context).pushReplacement(
                  MaterialPageRoute(builder: (context) => const OnBoarding()),
                );
              }
            },
          ),

          /// PLAN SCREEN PUSH
          GButton(
            icon: Icons.map_outlined,
            text: 'Plan',
            textStyle:
                GoogleFonts.raleway(fontSize: 13, fontWeight: FontWeight.w500),
            iconColor: Colors.black,
            onPressed: () {
              if (selectedIndex != 1) {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => const PlanScreen()));
              }
            },
          ),

          /// TICKET SCREEN CALLS
          GButton(
            icon: LineIcons.alternateTicket,
            text: 'Tickets',
            textStyle:
                GoogleFonts.raleway(fontSize: 13, fontWeight: FontWeight.w500),
            iconColor: Colors.black,
            onPressed: () {
              if (selectedIndex != 2) {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => const TicketDetailsScreen(
                          startLocation: '......',
                          endLocation: '.....',
                          departureTime: '..... : ....',
                          ticketPrice: 1,
                          busLine: '......',
                          paymenttype: 'Cash',
                        )));
              }
            },
          ),

          /// SETTINGS SCREEN PUSH.
          GButton(
            icon: Icons.settings_outlined,
            text: 'Settings',
            textStyle:
                GoogleFonts.raleway(fontSize: 13, fontWeight: FontWeight.w500),
            iconColor: Colors.black,
            onPressed: () {
              if (selectedIndex != 3) {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => const SettingsScreen()));
              }
            },
          ),
        ],
        selectedIndex: selectedIndex,
        onTabChange: (index) {
          setState(() {
            selectedIndex = index;
          });
        },
      ),
    );
  }
}
