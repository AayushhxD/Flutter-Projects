import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:project/view/accont.dart';
import 'package:project/view/categories.dart';
import 'package:project/view/contact.dart';
import 'package:project/view/home_Page_UI.dart';
import 'dart:math';

class NavBar extends StatefulWidget {
  // final Widget child;
  // final Widget drawer;
  const NavBar({
    super.key,
  });

  @override
  State<NavBar> createState() => _NavBarState();
}

class _NavBarState extends State<NavBar> with TickerProviderStateMixin {
  late AnimationController _xControllerForChild;
  late Animation<double> _yRotationChild;

  late AnimationController _xControllerForDrawer;
  late Animation<double> _yRotationForDrawer;

  void initState() {
    super.initState();
    _xControllerForChild = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 500));
    _yRotationChild =
        Tween<double>(begin: 0, end: -pi / 2).animate(_xControllerForChild);

    _xControllerForDrawer = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 500));
    _yRotationForDrawer =
        Tween<double>(begin: 0, end: -pi / 2).animate(_xControllerForChild);
  }

  final navigationKey = GlobalKey<CurvedNavigationBarState>();

  int index = 0;

  final buildScreens = [
    const home_Page(),
    const Categories(),
    const Account(),
    ContactUsPage(),
  ];

  final items = <Widget>[
    const Icon(Icons.home, size: 30),
    const Icon(Icons.category, size: 30),
    const Icon(Icons.account_circle, size: 30),
    const Icon(Icons.call, size: 30)
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: buildScreens[index],
      bottomNavigationBar: Theme(
        data: Theme.of(context)
            .copyWith(iconTheme: const IconThemeData(color: Colors.white)),
        child: CurvedNavigationBar(
          key: navigationKey,
          color: const Color.fromRGBO(6, 40, 30, 1), // Updated color
          animationCurve: Curves.easeInOut,
          animationDuration: const Duration(milliseconds: 300),
          backgroundColor: Colors.transparent,
          height: 60,
          index: index,
          items: items,
          onTap: (index) => setState(() => this.index = index),
        ),
      ),
    );
  }
}
