// import 'dart:developer';

import 'package:flutter/material.dart';
// import 'package:routegen/model/bus_fetcher.dart';
import 'package:routegen/view/bottomnav.dart';
import 'package:routegen/view/common_appbar.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'bottomSheets/trip_b_sheet.dart';
// import 'bottomSheets/seat_layout.dart';

class SelectedRoutescreen extends StatefulWidget {
  final String endlocation;
  final Map<String, dynamic> startTime;
  final String startLocation; 
  final Map<String, dynamic> fareData; 
  final int startStopIndex;            
  final int endStopIndex; 

  const SelectedRoutescreen({
    super.key,
    required this.endlocation,
    required this.startTime,
    required this.startLocation,
    required this.fareData,
    required this.startStopIndex,
    required this.endStopIndex,
  });

  @override
  State<SelectedRoutescreen> createState() => _SelectedRoutescreenState();
}

class _SelectedRoutescreenState extends State<SelectedRoutescreen> {

  bool isbsheet = false;
  Color? mainColor({double opacity = 1}) => Color.fromRGBO(255,136,17,opacity);

  @override
  Widget build(BuildContext context) {

    void tripSelectedSheet(){
      showModalBottomSheet(context: context,
        isScrollControlled: true,
        isDismissible: true,
        builder: (context){
          return tripSheet(
            context,
            busTime: "${widget.startTime['Dhour']} : ${widget.startTime['Dmin']}", 
            endLocation: widget.endlocation,
            startLocation: widget.startLocation,
            fareData: widget.fareData,
            startStopIndex: widget.startStopIndex,
            endStopIndex: widget.endStopIndex
          );
        },
      );
    }


    return Scaffold(
      appBar: const CommonAppbar(isNotificationOpen: false),
      body: Column(
        children: [
           Container(
            height: 130,
            alignment: Alignment.center,
            decoration:BoxDecoration(
              gradient: LinearGradient(colors: [
                mainColor(opacity: 0.4)!,
                mainColor()!,
              ],
              stops: const [0.3, 0.7],
              begin: Alignment.bottomCenter, end: Alignment.topCenter,
              ),
            ),
            child: Container(
              margin: const EdgeInsets.all(20),
              padding: const EdgeInsets.all(15),
              decoration: BoxDecoration(
                color: const Color.fromRGBO(26,21,40,1),
                borderRadius: BorderRadius.circular(20),
              ),
              child: Row(children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                  Text(
                    'Destination',
                    style: GoogleFonts.raleway(
                      color: Colors.white,
                      fontSize: 22,
                      fontWeight: FontWeight.w600,
                    ),),
                  Text(
                    widget.endlocation,    // ................................................................................
                    style: GoogleFonts.raleway(
                      color: Colors.white60,
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                    ),),
                ],),
              const Spacer(),
              GestureDetector(
                onTap: ()=>setState((){
                  if(isbsheet == false){
                    isbsheet=true;
                    tripSelectedSheet();
                  }else{isbsheet = false;}
                }),
                child: Container(
                  width: 40,
                  height: 40,
                  padding: const EdgeInsets.all(5),
                  decoration: BoxDecoration(
                    color: Colors.white30,
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: isbsheet? SvgPicture.asset('asset/Icon_xpand.svg', fit: BoxFit.cover) : const Icon(Icons.close, color: Colors.white),
                ),
              ),
              ],),
            ),
          ),

          SizedBox(
            height: 530, width: MediaQuery.of(context).size.width,
            child: Image.asset('asset/f_test_route.png', fit: BoxFit.fill),
          ),
          Expanded(
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              width: MediaQuery.of(context).size.width,
              decoration:BoxDecoration(
                color: Colors.white,
                border: Border.all(color: Colors.black12, width: 0.3),
                borderRadius:const BorderRadius.only(topLeft: Radius.circular(28), topRight: Radius.circular(28)),
                boxShadow: const [BoxShadow(
                  color: Color.fromARGB(200, 184, 184, 184),
                  blurRadius: 10,
                  spreadRadius: 5,
                  offset:Offset(0,-15),
                ),],
              ),
              child: GestureDetector(
                onTap: (){
                  // call bottom sheet
                  setState(() => isbsheet = true);
                  tripSelectedSheet();
                },
                child: Column(children: [
                  Container(
                    margin: const EdgeInsets.only(top: 10, bottom: 13),
                    height: 3, width: 30,
                    decoration: BoxDecoration(
                      color: Colors.black26,
                      borderRadius: BorderRadius.circular(5),
                    ),
                  ),
                  Text(
                    'Your Departure',
                    style: GoogleFonts.raleway(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                    ),),
                  const SizedBox(height: 5),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                    /// Data inputs here...
                    /// firebase data
                    Text(
                      "${widget.startTime['Dhour']} : ${widget.startTime['Dmin']}",
                      style: GoogleFonts.raleway(
                        fontSize: 32,
                        fontWeight: FontWeight.w700,
                      ),),
                    const SizedBox(width: 5),
                    Text(
                      'probable delay due to traffic',
                
                      style: GoogleFonts.raleway(
                        color: Colors.black45,
                        fontSize: 15,
                        fontWeight: FontWeight.w600,
                        height: 3.5,
                      ),
                      textAlign: TextAlign.end,
                      ),
                    const Spacer(),
                    Container(
                      height: 40, width: 40,
                      decoration: BoxDecoration(
                        color: mainColor(),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      /// on tap adds reminder to notification section...
                      /// custom notification announcement with bus number with its route.
                      child: Padding(
                        padding: const EdgeInsets.all(7),
                        child: SvgPicture.asset('asset/add_reminder.svg')),
                    ),
                  ],),
                ],),
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: const OneBottomnav(),
    );
  }
}