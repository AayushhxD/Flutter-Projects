import 'dart:developer';

// import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:routegen/view/bottomSheets/busdetail_sheet.dart';
import 'package:routegen/model/bus_stop_model.dart';
import 'package:routegen/model/bus_fetcher.dart';
import 'package:routegen/view/selected_routescreen.dart';

/// ****************
import './common_appbar.dart';
import 'package:routegen/view/bottomnav.dart';
import 'expanded_mapscreen.dart';

class OnBoarding extends StatefulWidget{
  const OnBoarding({super.key});

  @override
  State<OnBoarding> createState() => _OnBoardingState();
}

class _OnBoardingState extends State<OnBoarding>{

  final BusFetcher busFetcher = BusFetcher();
  List<BusStop> allStops = [];

  @override
  void initState() {
    Future.delayed(const Duration(milliseconds: 100), () async{
        _loadBusData();
    });
    super.initState();
  }

  Map<String, dynamic> _getRouteAndFareData(String startStop, String endStop) {
    for (var routeId in busFetcher.routeStops.keys) {
      var stops = busFetcher.getRouteStops(routeId);
      
      // Find indices of stops in this route
      var startIndex = stops.indexWhere((stop) => stop.name == startStop);
      var endIndex = stops.indexWhere((stop) => stop.name == endStop);
      
      // If both stops are found in this route
      if (startIndex != -1 && endIndex != -1) {
        // Get fare data for this route
        var fareData = busFetcher.getFareData(routeId);
        var fare = busFetcher.getFareBetweenStops(routeId, startIndex, endIndex);
        
        return {
          'routeId': routeId,
          'startIndex': startIndex,
          'endIndex': endIndex,
          'fareData': fareData,
          'fare': fare
        };
      }
    }
    return {};
  }

  Map<String, dynamic>? _getDepartureTimeForSelectedStop(String stopName) {
  for (var routeId in busFetcher.routeStops.keys) {
    var stops = busFetcher.getRouteStops(routeId);
    var scheduleTimes = busFetcher.getScheduleTimes(routeId);
    
    // Find if selected stop exists in this route
    var stopIndex = stops.indexWhere((stop) => stop.name == stopName);
    
    // If stop found in this route
    if (stopIndex != -1) {
      // Get the schedule time for this specific stop
      if (stopIndex < scheduleTimes.length) {
          return {
            'Dhour': scheduleTimes[stopIndex]['Dhour'],
            'Dminute': scheduleTimes[stopIndex]['Dmin']
          };
        }
      }
    }
    return null;
  }

  Map<String, dynamic>? _getArrivalTimeForStop(String stopName) {

    for (var routeId in busFetcher.routeStops.keys) {
      var stops = busFetcher.getRouteStops(routeId);
      var schedule = busFetcher.getScheduleDetails(routeId);
      
      // Find if selected stop exists in this route
      var stopIndex = stops.indexWhere((stop) => stop.name == stopName);
      if (stopIndex != -1) {
        return {
          'hour': schedule['lastStop']['arrivalHour'],
          'minute': schedule['lastStop']['arrivalMinute']
        };
      }
    }
    return null;
    }

  Future<void> _loadBusData() async {
    try {
      await busFetcher.fetchBusStopData();
      setState(() {
        // Collect all unique stops from all routes
        Set<String> uniqueStops = {};
        busFetcher.routeStops.forEach((_, stops) {
          for (var stop in stops) {
            uniqueStops.add(stop.name);
          }
        });
        allStops = uniqueStops.map((name) => BusStop(name: name)).toList();
      });
    } catch (e) {
      log('Error loading bus data: $e');
    }
  }
  

  final TextEditingController startController = TextEditingController();
  final TextEditingController destinationController = TextEditingController();

  BusStop? selectedStart;
  BusStop? selectedDestination;

  Color? mainColor({double opacity = 1}) => Color.fromRGBO(255,136,17,opacity);
  
  @override
  Widget build(BuildContext context) {

    DateTime currentTime = DateTime.now();
    int currentHours = currentTime.hour;
    int currentMinutes = currentTime.minute;

    // Bus Details bottom sheet....
    void busDetailSheet({
      required String routeID,
      required String busnum,
      required String fueltype,
      required int seatcount,
      required List<String> feaTures,
      required Map<String, dynamic> scheduleDEtails
    }){
      showModalBottomSheet(context: context,
        isScrollControlled: true,
        isDismissible: true,
        builder: (context) {
          return busdetailsheet(
            context,
            routeId: routeID, 
            busNum: busnum,
            fuelType: fueltype,
            seatCount: seatcount, 
            features: feaTures,
            scheduleDetails: scheduleDEtails, busfetcher: busFetcher 
          );
        },
      );
    }

    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: const CommonAppbar(isNotificationOpen: false),
      body: SingleChildScrollView(
        child: Column( children: [
            Container(
              height: 400,
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
                height: 350,
                margin: const EdgeInsets.all(25),
                decoration: BoxDecoration(
                  color: const Color.fromRGBO(26,21,40,1),
                  borderRadius: BorderRadius.circular(35),
                ),
                // Input Boxes
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                  // DropdownButtonFormField(),
                  Container(
                    height: 6,
                    width: 70,
                    margin: const EdgeInsets.only(top: 12),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color:Colors.grey,
                    ),
                  ),
                  Padding(padding: const EdgeInsets.all(10),
                    child:
                    RawAutocomplete<BusStop>(
                      textEditingController: startController,
                      focusNode: FocusNode(),
                      optionsBuilder: (TextEditingValue textEditingValue) {
                        return allStops.where((BusStop stop) {  
                          return stop.name.toLowerCase().contains(textEditingValue.text.toLowerCase());
                        }).toList();
                      },
                      displayStringForOption: (BusStop option) => option.name,
                      fieldViewBuilder: (BuildContext context,
                      TextEditingController controller,
                      FocusNode focusNode,
                      VoidCallback onFieldSubmitted) {
                      return TextField(
                        controller: controller,
                        focusNode: focusNode,
                        style: GoogleFonts.raleway(
                          color: Colors.white,
                          fontSize: 22,
                        ),
                        /// FROM TEXTFIELD CODE
                        decoration: InputDecoration(
                          labelText: 'From',
                          labelStyle: GoogleFonts.raleway(
                            color: Colors.white70,
                            fontSize: 22,
                            ),
                          prefixIcon: const Icon(
                            Icons.center_focus_strong_outlined,
                            color: Colors.white60,
                            ),
                          ///
                          /// SUFFIX ICON TO CLEAR SELECTION
                          /// 
                          suffixIcon: GestureDetector(
                            onTap: () {
                              controller.clear();
                              setState(() {
                                selectedStart = null;
                              });
                            },
                            child: const Icon(Icons.close_rounded, color: Colors.white60),
                          ),

                          /// ONLY UNDERLINED BORDER CODE
                          enabledBorder: const UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.white24),
                          ),
                          focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: mainColor()!),
                          ),
                        ),
                      );
                    },

                    /// OPTIONS VIEW
                    /// DROPDOWN LIST OF ONCHANGED FROM
                    optionsViewBuilder: (BuildContext context,
                        AutocompleteOnSelected<BusStop> onSelected,
                        Iterable<BusStop> options) {
                      return Align(
                        alignment: Alignment.topLeft,
                        child: Material(
                          elevation: 2.0,
                          child: ConstrainedBox(
                            constraints: BoxConstraints(
                              maxHeight: 150,
                              maxWidth: MediaQuery.of(context).size.width - 60,
                            ),
                            child: ListView.builder(
                              padding: EdgeInsets.zero,
                              shrinkWrap: true,
                              itemCount: options.length,
                              itemBuilder: (BuildContext context, int index) {
                                final BusStop option = options.elementAt(index);
                                return InkWell(
                                  onTap: () {
                                    onSelected(option);
                                    // startLocation = startController.text;
                                    // selectedFromLocation = startController.text.trim();
                                    setState(() => selectedStart = option);
                                  },
                                  child: Container(
                                    padding: const EdgeInsets.all(16.0),
                                    child: Text(
                                      option.name,
                                      style: GoogleFonts.raleway(
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                );
                              },
                            ),
                          ),
                        ),
                      );
                    },
                    ), 
                  ),
                  Padding(padding: const EdgeInsets.all(10),
                    child: 
                      RawAutocomplete<BusStop>(
                        textEditingController: destinationController,
                        focusNode: FocusNode(),
                        optionsBuilder: (TextEditingValue textEditingValue) {
                          return allStops.where((BusStop stop) {
                            return stop.name.toLowerCase().contains(textEditingValue.text.toLowerCase());
                          }).toList();
                        },
                        displayStringForOption: (BusStop option) => option.name,
                        fieldViewBuilder: (BuildContext context,
                          TextEditingController controller,
                          FocusNode focusNode,
                          VoidCallback onFieldSubmitted) {
                          return TextField(
                            controller: controller,
                            focusNode: focusNode,
                            style: GoogleFonts.raleway(
                              color: Colors.white,
                              fontSize: 22,
                          ),
                          decoration: InputDecoration(
                            labelText: 'Destination',
                            labelStyle: GoogleFonts.raleway(color: Colors.white60,
                            fontSize: 22,
                            ),
                            prefixIcon: const Icon(Icons.location_on_outlined, color: Colors.white60),
                            suffixIcon: GestureDetector(
                              onTap: () {
                                // Swap functionality
                                final tempText = startController.text;
                                final tempStop = selectedStart;
                                setState(() {
                                  startController.text = destinationController.text;
                                  destinationController.text = tempText;
                                  selectedStart = selectedDestination;
                                  selectedDestination = tempStop;
                                });
                              },
                              child: const Icon(Icons.compare_arrows_outlined, color: Colors.white60),
                            ),
                            enabledBorder: const UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.white24,
                              ),
                            ),
                            focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: mainColor()!),
                            ),
                          ),
                        );
                      },
                      optionsViewBuilder: (BuildContext context,
                          AutocompleteOnSelected<BusStop> onSelected,
                          Iterable<BusStop> options) {
                        return Align(
                          alignment: Alignment.topLeft,
                          child: Material(
                            elevation: 4.0,
                            child: ConstrainedBox(
                              constraints: BoxConstraints(
                                maxHeight: 200,
                                maxWidth: MediaQuery.of(context).size.width - 60,
                              ),
                              child: ListView.builder(
                                padding: EdgeInsets.zero,
                                shrinkWrap: true,
                                itemCount: options.length,
                                itemBuilder: (BuildContext context, int index) {
                                  final BusStop option = options.elementAt(index);
                                  return InkWell(
                                    onTap: () {
                                      onSelected(option);
                                      // endLocation = destinationController.text; // .........................................
                                      setState(() {
                                        selectedDestination = option;
                                      });
                                    },
                                    child: Container(
                                      padding: const EdgeInsets.all(16.0),
                                      child: Text(
                                        option.name,
                                        style: GoogleFonts.raleway(
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                  );
                                },
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                  const SizedBox(height: 40),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                    GestureDetector(
        // Depart Time selection
                      onTap: (){},
                      child: Container(
                        height: 55,
                        width: 100,
                        padding: const EdgeInsets.all(5),
                        decoration: BoxDecoration(
                          color: const Color.fromRGBO(255,255,255,0.1),
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: Column(
                          children: [
                            Text('Departure Time', style: GoogleFonts.raleway(color: Colors.white70, fontSize: 11)),
                            const Spacer(),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                              Text('$currentHours : $currentMinutes',
                              style: GoogleFonts.raleway(
                                fontSize: 18,
                                fontWeight: FontWeight.w500,
                                color: Colors.white60,
                              ),),
                              const Icon(Icons.alarm, size: 18, color: Colors.white54),
                            ],),
                          ],
                        )
                      ),
                    ),
                    GestureDetector(
                      onTap: (){
                        // fare getter
                        var routeData = _getRouteAndFareData(
                          selectedStart!.name,
                          selectedDestination!.name
                        );
                        
                        Navigator.of(context).push(
                          MaterialPageRoute(builder: (context)=> SelectedRoutescreen(
                            endlocation: destinationController.text,
                            startTime: {
                              'Dhour' : _getDepartureTimeForSelectedStop(selectedStart!.name)?['Dhour'],
                              'Dmin' : _getDepartureTimeForSelectedStop(selectedStart!.name)?['Dminute']
                            },
                            startLocation: selectedStart!.name,
                            fareData: routeData['fareData'] ?? {},
                            startStopIndex: routeData['startIndex'] ?? 0,
                            endStopIndex: routeData['endIndex'] ?? 0,
                          ))
                        );
                      },
                      child: Container(
                        height: 50, width: 80,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          color: mainColor(),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: const Icon(Icons.search_outlined,
                        color: Color.fromRGBO(26,21,40,1),
                        size: 35,
                        ),
                      ),
                    ),
                    GestureDetector(
        // Arrival Time selection
                      onTap: (){},
                      child: Container(
                        height: 55,
                        width: 100,
                        padding: const EdgeInsets.all(5),
                        decoration: BoxDecoration(
                          color: const Color.fromRGBO(255,255,255,0.1),
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: Column(
                          children: [
                            Text('Arrival Time', style: GoogleFonts.raleway(color: Colors.white70, fontSize: 11)),
                            const Spacer(),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                              Text(
                                selectedDestination != null 
                                ? "${_getArrivalTimeForStop(selectedDestination!.name)?['hour'] ?? '--'}:${_getArrivalTimeForStop(selectedDestination!.name)?['minute'] ?? '--'}"
                                : "--:--",
                              style: GoogleFonts.raleway(
                                fontSize: 20,
                                color: Colors.white60,
                                fontWeight: FontWeight.w500
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
        
            Stack(children: [
                SizedBox(height: 220,
                  width: MediaQuery.of(context).size.width,
                  child: Image.asset('asset/narhe_map.png', fit: BoxFit.cover)
                ),            // Map Expand button.....
                GestureDetector(
                  onTap:(){
                    Navigator.of(context).push(
                    MaterialPageRoute(builder: (context)=>const ExpandedMapScreen())
                    );
                  },
                  child: Container(
                    height: 35,
                    width: 35,
                    margin: const EdgeInsets.only(top: 10, left: 15),
                    decoration: BoxDecoration(
                      border: Border.all(width: 0.5, color: Colors.red),
                      borderRadius: BorderRadius.circular(15),
                      color: Colors.white70,
                    ),
                    child: const Icon(Icons.expand_less_outlined, size: 25, color: Colors.black54),
                    ),
                  ),
                ],),
            Column(children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 5),
                child: Row(
                  // Routes finder at from Location input....
                  children: [
                  Text('Routes Nearby',
                  style: GoogleFonts.raleway(
                    fontSize: 24,
                    fontWeight: FontWeight.w600,
                  )),
                  const Spacer(),
                  Container(
                    height: 40, width: 40,
                    decoration: BoxDecoration(
                      border: Border.all(width: 1, color: Colors.grey.shade400),
                      borderRadius: BorderRadius.circular(14),
                    ),
                    child: const Icon(Icons.arrow_forward_ios, size: 15),
                  ),
                ],),
              ),
              ///
              ///
              ///
              /// LISTVIEW BUILDER..................................................................................
              /// 
              /// 
              SizedBox(
                height: 130,
                child: ListView.builder(
                  shrinkWrap: true,
                  // data from Sqflite........
                  itemCount: busFetcher.routeStops.length,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index){

                    String routeId = busFetcher.routeStops.keys.elementAt(index);
                    var schedule = busFetcher.getScheduleDetails(routeId);
                    List<BusStop> stops = busFetcher.getRouteStops(routeId);
                    
                    return Row(children: [
                      Container(
                        padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
                        margin: const EdgeInsets.only(left: 7, right: 5),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          border: Border.all(width: 0.5, color: Colors.grey.shade200),
                          borderRadius: BorderRadius.circular(25),
                          boxShadow: const [BoxShadow(
                            color:Colors.black26,
                            blurRadius: 5,
                          )],
                        ),
                        height: 100,
                        width: 300,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                          // starting point
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                            Text(
                              "${schedule['firstStop']['departureHour']} : ${schedule['firstStop']['departureMinute']}", // ........
                              style: GoogleFonts.raleway(
                                fontSize: 20,
                                fontWeight: FontWeight.w600,
                              ),),
                            const Spacer(),
                            Text(
                              stops.first.name, // ..........................................................................
                              style: GoogleFonts.raleway(
                                fontSize: 18,
                                fontWeight: FontWeight.w600,
                                // color: Colors.grey,
                              ),),
                          ],),
                          const Icon(Icons.arrow_forward),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                            Text(
                              "${schedule['lastStop']['arrivalHour']} : ${schedule['lastStop']['arrivalMinute']}", // ...................................................
                              style: GoogleFonts.raleway(
                                fontSize: 20,
                                fontWeight: FontWeight.w600,
                              ),),
                            const Spacer(),
                            Text(
                              stops.last.name, // ........................................................................
                              style: GoogleFonts.raleway(
                                fontSize: 18,
                                fontWeight: FontWeight.w600,
                                // color: Colors.grey,
                              ),),
                          ],),
                          // Proceeds to bus detail then tickets by schedule directly...
                          GestureDetector(
                            onTap: () {
                              String busNumber = busFetcher.getBusNumber(routeId);
                              busDetailSheet(
                                routeID: routeId,
                                busnum: busNumber,
                                fueltype: busFetcher.getFuelType(routeId),
                                seatcount: busFetcher.getSeatCount(routeId)!,
                                feaTures: busFetcher.getBusFeatures(routeId),
                                scheduleDEtails: busFetcher.getScheduleDetails(routeId)
                              );
                            },
                            child: Container(
                              height: 70,
                              width: 35,
                              decoration: BoxDecoration(
                                color: const Color.fromRGBO(26,21,40,0.8),
                                borderRadius: BorderRadius.circular(12),
                              ),
                              child: const Icon(Icons.arrow_forward_ios, size: 20, color: Colors.white70),
                            ),
                          ),
                        ],),
                      ),
                    ],);
                },),
              ),            
            ],),
          ], 
        ),
      ),
      bottomNavigationBar: const OneBottomnav(),
    );
  }
}