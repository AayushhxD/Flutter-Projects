import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:travel_app/bookingscreen.dart';
import 'package:travel_app/calenderscreen.dart';
import 'package:travel_app/detailscreen.dart';
import 'package:travel_app/message.dart';
import 'package:travel_app/profilescreen.dart';
import 'package:travel_app/searchscreen.dart';

class Home_Page extends StatefulWidget {
  const Home_Page({super.key});

  @override
  State<Home_Page> createState() => _Home_PageState();
}

class _Home_PageState extends State<Home_Page> {
  int _selectedIndex = 0;

  static final List<Widget> _widgetOptions = <Widget>[
    HomeContent(),
    const Calendar_Page(),
    const Search_Page(),
    const Message_Page(),
    const Profile_Page(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(247, 247, 249, 1),
      body: _widgetOptions.elementAt(_selectedIndex),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: const Color.fromRGBO(255, 255, 255, 1),
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.calendar_today),
            label: 'Calendar',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: 'Search',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.message),
            label: 'Message',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        unselectedItemColor: const Color.fromRGBO(125, 132, 141, 1),
        selectedItemColor: const Color.fromRGBO(13, 110, 253, 1),
        showUnselectedLabels: true,
      ),
    );
  }
}

class HomeContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 56, left: 20, right: 20),
          child: Row(
            children: [
              Container(
                height: 44,
                width: 130,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(22),
                  color: const Color.fromRGBO(255, 255, 255, 1),
                ),
                child: Row(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(100),
                        color: const Color.fromARGB(255, 255, 255, 255),
                      ),
                      child: Image.asset("assets/2.png"),
                    ),
                    const SizedBox(width: 1),
                    Text(
                      "Ayush",
                      style: GoogleFonts.poppins(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        color: const Color.fromRGBO(27, 30, 40, 1),
                      ),
                    ),
                  ],
                ),
              ),
              const Spacer(),
              Container(
                height: 47,
                width: 47,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(100),
                  color: const Color.fromRGBO(255, 255, 255, 1),
                ),
                child: const Icon(
                  Icons.notifications_none_rounded,
                  color: Color.fromRGBO(27, 30, 40, 1),
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 30),
        Padding(
          padding: const EdgeInsets.only(left: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Explore the",
                style: GoogleFonts.poppins(
                  fontSize: 38,
                  fontWeight: FontWeight.w400,
                  color: const Color.fromRGBO(27, 30, 40, 1),
                ),
              ),
              RichText(
                text: TextSpan(
                  style: GoogleFonts.poppins(
                    fontSize: 38,
                    fontWeight: FontWeight.w600,
                    color: const Color.fromRGBO(27, 30, 40, 1),
                  ),
                  children: <InlineSpan>[
                    const TextSpan(text: 'Beautiful '),
                    WidgetSpan(
                      child:
                          Stack(alignment: Alignment.bottomCenter, children: [
                        Text(
                          'world!',
                          style: GoogleFonts.poppins(
                            fontSize: 38,
                            fontWeight: FontWeight.w600,
                            color: const Color.fromRGBO(255, 112, 41, 1),
                          ),
                        ),
                      ]),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 30),
        Padding(
          padding: const EdgeInsets.only(left: 20, right: 20),
          child: Row(
            children: [
              Text(
                "Best Destination",
                style: GoogleFonts.poppins(
                  fontSize: 20,
                  fontWeight: FontWeight.w500,
                  color: const Color.fromRGBO(27, 30, 40, 1),
                ),
              ),
              const Spacer(),
              Text(
                "View all",
                style: GoogleFonts.poppins(
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                  color: const Color.fromRGBO(13, 110, 253, 1),
                ),
              )
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 20, top: 20),
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) {
                          return const DetailsScreen();
                        },
                      ),
                    );
                  },
                  child: Container(
                    height: 384,
                    width: 268,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(24),
                      color: const Color.fromRGBO(255, 255, 255, 1),
                      boxShadow: const [
                        BoxShadow(
                          offset: Offset(0, 6),
                          blurRadius: 16,
                          color: Color.fromRGBO(180, 188, 201, 0.12),
                        ),
                      ],
                    ),
                    child: Padding(
                      padding:
                          const EdgeInsets.only(top: 15, left: 20, right: 20),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Image.asset("assets/Group 21.png"),
                          Row(
                            children: [
                              Text(
                                "Niladri Reservoir",
                                style: GoogleFonts.poppins(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500,
                                  color: const Color.fromRGBO(27, 30, 40, 1),
                                ),
                              ),
                              const Spacer(),
                              const Icon(
                                Icons.star,
                                size: 11.64,
                                color: Color.fromRGBO(255, 211, 54, 1),
                              ),
                              Text(
                                "4.7",
                                style: GoogleFonts.poppins(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w400,
                                  color: const Color.fromRGBO(27, 30, 40, 1),
                                ),
                              )
                            ],
                          ),
                          Row(
                            children: [
                              const Icon(
                                Icons.location_on_outlined,
                                size: 13.33,
                                color: Color.fromRGBO(125, 132, 141, 1),
                              ),
                              Text(
                                "Tekergat, Sunamganj",
                                style: GoogleFonts.poppins(
                                  fontSize: 13,
                                  fontWeight: FontWeight.w400,
                                  color: const Color.fromRGBO(125, 132, 141, 1),
                                ),
                              ),
                              const Spacer(),
                              Image.asset("assets/Group 12 (1).png")
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 20),
                GestureDetector(
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) {
                          return const BookingScreen(); // Navigate to the Booking screen
                        },
                      ),
                    );
                  },
                  child: Container(
                    height: 384,
                    width: 268,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(24),
                      color: const Color.fromRGBO(255, 255, 255, 1),
                      boxShadow: const [
                        BoxShadow(
                          offset: Offset(0, 6),
                          blurRadius: 16,
                          color: Color.fromRGBO(180, 188, 201, 0.12),
                        ),
                      ],
                    ),
                    child: Padding(
                      padding:
                          const EdgeInsets.only(top: 15, left: 20, right: 20),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Container(
                            height: 286,
                            width: 240,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(24),
                              image: const DecorationImage(
                                image: AssetImage(
                                    "assets/af2a3946819dfaa9194f6eb90ce77764.jpeg"),
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          Row(
                            children: [
                              Text(
                                "Darma Reservoir",
                                style: GoogleFonts.poppins(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500,
                                  color: const Color.fromRGBO(27, 30, 40, 1),
                                ),
                              ),
                              const Spacer(),
                              const Icon(
                                Icons.star,
                                size: 11.64,
                                color: Color.fromRGBO(255, 211, 54, 1),
                              ),
                              Text(
                                "4.5",
                                style: GoogleFonts.poppins(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w400,
                                  color: const Color.fromRGBO(27, 30, 40, 1),
                                ),
                              )
                            ],
                          ),
                          Row(
                            children: [
                              const Icon(
                                Icons.location_on_outlined,
                                size: 13.33,
                                color: Color.fromRGBO(125, 132, 141, 1),
                              ),
                              Text(
                                "Darma, Baishal",
                                style: GoogleFonts.poppins(
                                  fontSize: 13,
                                  fontWeight: FontWeight.w400,
                                  color: const Color.fromRGBO(125, 132, 141, 1),
                                ),
                              ),
                              const Spacer(),
                              Image.asset("assets/Group 12 (1).png")
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 20),
                // Add more destination cards as needed
              ],
            ),
          ),
        ),
      ],
    );
  }
}
