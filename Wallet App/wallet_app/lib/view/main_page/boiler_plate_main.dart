import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:wallet_app/view/card_pages/card_page.dart';
import 'package:wallet_app/view/main_page/history_page.dart';
import 'package:wallet_app/view/main_page/home_page.dart';
import 'package:wallet_app/view/main_page/more_page.dart';

class BottomNaviBar extends StatefulWidget {
  const BottomNaviBar({super.key});

  @override
  State<BottomNaviBar> createState() => _BottomNaviBarState();
}

class _BottomNaviBarState extends State<BottomNaviBar> {
  int _selectedIndex = 0;

  void _onIconTap(int index) {
    setState(() {
      _selectedIndex = index;
    });

    switch (index) {
      case 0:
        Navigator.push(context, MaterialPageRoute(
          builder: (context) {
            return const HomeScreen();
          },
        ));
        break;
      case 1:
        Navigator.push(context, MaterialPageRoute(
          builder: (context) {
            return const HistoryScreen();
          },
        ));
        break;
      case 2:
        Navigator.push(context, MaterialPageRoute(
          builder: (context) {
            return const CardScreen();
          },
        ));
        break;
      case 3:
        Navigator.push(context, MaterialPageRoute(
          builder: (context) {
            return const MoreScreen();
          },
        ));
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 62,
      width: double.infinity,
      decoration: const BoxDecoration(
        border: Border(
          top: BorderSide(
            width: 1,
            color: Color.fromRGBO(225, 227, 237, 1),
          ),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          navigationBarData(0, "assets/appbar_icon/home.png", "Home"),
          navigationBarData(1, "assets/appbar_icon/history.png", "History"),
          navigationBarData(2, "assets/appbar_icon/cards.png", "Cards"),
          navigationBarData(3, "assets/appbar_icon/more.png", "More"),
        ],
      ),
    );
  }

  Widget navigationBarData(int index, String icon, String lable) {
    bool isSelected = _selectedIndex == index;
    Size size = MediaQuery.of(context).size;

    return InkWell(
      onTap: () {
        _onIconTap(index);
        setState(
          () {
            _selectedIndex = index;
          },
        );
      },
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            width: isSelected ? size.width * .100 : 0,
            height: 2,
            decoration: BoxDecoration(
              color: isSelected
                  ? const Color.fromRGBO(111, 69, 233, 1)
                  : const Color.fromRGBO(255, 255, 255, 1),
            ),
          ),
          const Spacer(),
          Image(
            image: AssetImage(icon),
            height: 24,
            width: 24,
            fit: BoxFit.fill,
            color: isSelected
                ? const Color.fromRGBO(111, 69, 233, 1)
                : const Color.fromRGBO(83, 93, 102, 1),
          ),
          const Spacer(),
          Text(
            lable,
            style: GoogleFonts.sora(
              fontWeight: FontWeight.w600,
              fontSize: 12,
              color: isSelected
                  ? const Color.fromRGBO(111, 69, 233, 1)
                  : const Color.fromRGBO(83, 93, 102, 1),
            ),
          ),
          const Spacer()
        ],
      ),
    );
  }
}
