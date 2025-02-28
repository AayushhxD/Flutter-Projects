import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

final List<BottomNavigationBarItem> _bottomNavigatorIteems = [
  BottomNavigationBarItem(
      label: "Favorite",
      icon: SvgPicture.asset(
        "lib/Assets/icons/svg/hert_bottom_navigator.svg",
      )),
  BottomNavigationBarItem(
      label: "Search",
      icon: SvgPicture.asset("lib/Assets/icons/svg/search.svg")),
  BottomNavigationBarItem(
      label: "Home", icon: SvgPicture.asset("lib/Assets/icons/svg/home.svg")),
  BottomNavigationBarItem(
      label: "Cart", icon: SvgPicture.asset("lib/Assets/icons/svg/bag.svg")),
  BottomNavigationBarItem(
      label: "Profile",
      icon: SvgPicture.asset("lib/Assets/icons/svg/user.svg")),
];

BottomNavigationBar buildBottomNavigationBar() {
  return BottomNavigationBar(
    currentIndex: 2,
    type: BottomNavigationBarType.fixed,
    selectedIconTheme: const IconThemeData(
      color: Color.fromRGBO(230, 154, 21, 1),
    ),
    unselectedIconTheme: const IconThemeData(
      color: Color.fromRGBO(157, 178, 206, 1),
    ),
    selectedItemColor: const Color.fromRGBO(230, 154, 21, 1),
    unselectedItemColor: const Color.fromRGBO(157, 178, 206, 1),
    showSelectedLabels: true,
    showUnselectedLabels: true,
    items: _bottomNavigatorIteems,
    backgroundColor: const Color.fromRGBO(19, 19, 19, 1),
  );
}
