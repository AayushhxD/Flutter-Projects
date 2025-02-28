import 'package:fitness_app/activityscreen.dart';
import 'package:fitness_app/explorescreen.dart';
import 'package:fitness_app/homescreeen.dart';
import 'package:fitness_app/profilescreen.dart';
import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

class BottomBar extends StatefulWidget {
  const BottomBar({super.key});

  @override
  State<BottomBar> createState() => _BottomBarState();
}

class _BottomBarState extends State<BottomBar> {
  int _selectedIndex = 0;
  static const List<Widget> _widgetoption = [
    HomeScreen(),
    ExploreScreen(),
    ActivityScreen(),
    ProfileScreen(),
  ];
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _widgetoption.elementAt(_selectedIndex),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Container(
          height: 70,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(32),
            color: const Color.fromRGBO(25, 33, 38, 1),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            child: GNav(
                backgroundColor: const Color.fromRGBO(25, 33, 38, 1),
                color: const Color.fromRGBO(255, 255, 255, 1),
                activeColor: const Color.fromRGBO(25, 33, 38, 1),
                tabBackgroundColor: const Color.fromRGBO(187, 242, 70, 1),
                gap: 10,
                padding: const EdgeInsets.all(15),
                tabs: const [
                  GButton(
                    icon: Icons.home,
                    text: "Home",
                  ),
                  GButton(
                    icon: Icons.explore,
                    text: "Explore",
                  ),
                  GButton(
                    icon: Icons.analytics_outlined,
                    text: "Analytics",
                  ),
                  GButton(
                    icon: Icons.person_2_outlined,
                    text: "Profile",
                  ),
                ],
                selectedIndex: _selectedIndex,
                onTabChange: (index) {
                  setState(() {
                    _selectedIndex = index;
                  });
                }),
          ),
        ),
      ),
    );
  }
}
