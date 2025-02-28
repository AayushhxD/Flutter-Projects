import 'package:flutter/material.dart';
import 'package:routegen/view/bottomnav.dart';
import 'package:routegen/view/common_appbar.dart';
import 'package:google_fonts/google_fonts.dart';


class ExpandedMapScreen extends StatefulWidget {
  const ExpandedMapScreen({super.key});

  @override
  State<ExpandedMapScreen> createState() => _ExpandedMapScreenState();
}

class _ExpandedMapScreenState extends State<ExpandedMapScreen> {
  Color? mainColor({double opacity = 1}) => Color.fromRGBO(255,136,17,opacity);

  @override
  Widget build(BuildContext context) {
    DateTime currentTime = DateTime.now();
    int currentHours = currentTime.hour;
    int currentMinutes = currentTime.minute;
    return Scaffold(
      appBar: const CommonAppbar(titleSize: 16, isNotificationOpen: false),
      body: Column(
        children: [
          Container(
            height: 200,
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              gradient: LinearGradient(colors: [
                mainColor(opacity: 0.4)!,
                mainColor()!,
              ],
              stops: const [0.3, 0.7],
              begin: Alignment.bottomCenter, end: Alignment.topCenter,
              ), ),
            child: Container(
              // height: 300,
              padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 5),
              decoration: BoxDecoration(
                color: const Color.fromRGBO(26,21,40,1),
                borderRadius: BorderRadius.circular(35),
              ),
              // Input Boxes
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                Padding(padding: const EdgeInsets.all(8),
                  child: TextField(
                    // controller: destinationController,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                    ),
                    decoration: InputDecoration(
                      labelText: 'Destination',
                      prefixIcon: const Icon(Icons.location_on_outlined,color: Colors.white60),
                      suffixIcon: GestureDetector(
                        onTap: (){
                          /// PUSH TO ROUT DETAILED SCREEN
                          /// 
                        },
                        child: const Icon(Icons.search),
                      ),),
                  ),),
                const SizedBox(height: 15),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                  GestureDetector(
// Depart Time selection
                    onTap: (){},
                    child: Container(
                      height: 45,
                      width: 80,
                      padding: const EdgeInsets.all(5),
                      decoration: BoxDecoration(
                        color: const Color.fromRGBO(255,255,255,0.1),
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: Column(
                        children: [
                          Text('Departure Time', style: GoogleFonts.raleway(color: Colors.white70, fontSize: 8)),
                          const Spacer(),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                            Text('$currentHours : $currentMinutes',
                            style: GoogleFonts.raleway(
                              fontSize: 12,
                              color: Colors.white60,
                              fontWeight: FontWeight.w600,
                            ),),
                            const Icon(Icons.alarm, size: 18, color: Colors.white54),
                          ],),
                        ],
                      )
                    ),
                  ),
                  
                  GestureDetector(
// Arrival Time selection
                    onTap: (){},
                    child: Container(
                      height: 45,
                      width: 80,
                      padding: const EdgeInsets.all(5),
                      decoration: BoxDecoration(
                        color: const Color.fromRGBO(255,255,255,0.1),
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: Column(
                        children: [
                          Text('Arrival Time', style: GoogleFonts.raleway(color: Colors.white70, fontSize: 8)),
                          const Spacer(),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                            Text('--:--',
                            style: GoogleFonts.raleway(
                              fontSize: 12,
                              color: Colors.white60,
                              fontWeight: FontWeight.w300,
                            ),),
                            const Icon(Icons.alarm, size: 18, color: Colors.white54),
                          ],),
                        ],
                      )
                    ),
                  ),
                ],),
              ],),
            ),
          ),
          Expanded(child:
            Stack(
              children: [
                SizedBox(
                  height: 470,
                  child: Image.asset('asset/pune_all.png', fit: BoxFit.cover),
                ),
                // Expander button....
                Positioned(
                  top: 10,
                  left: 10,
                  child: GestureDetector(
                    onTap: () {
                      Navigator.of(context).pop();
                    },
                    child: Container(height: 35, width: 35,
                      decoration: BoxDecoration(
                        border: Border.all(width: 0.5, color: Colors.amber),
                        borderRadius: BorderRadius.circular(15),
                        color: Colors.white38,
                      ),
                      child: const Icon(Icons.expand_more),
                    ),
                  ),
                ),
              ],
            )
          ),
        ],
      ),
      bottomNavigationBar: const OneBottomnav(),
    );
  }
}