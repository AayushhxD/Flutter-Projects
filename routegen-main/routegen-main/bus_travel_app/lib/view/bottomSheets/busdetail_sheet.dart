import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:routegen/model/bus_fetcher.dart';
// import 'package:routegen/model/bus_stop_model.dart';
import 'package:routegen/view/selected_routescreen.dart';

Widget busdetailsheet(
  BuildContext context, {
  required String routeId,
  required String busNum,
  required String fuelType,
  required int seatCount,
  required List<String> features,
  required Map<String, dynamic> scheduleDetails,
  required BusFetcher busfetcher, 
  }) {

  // List<String>? busFeatures = busdata.getBusFeatures(routeId);
  return Padding(
    padding: EdgeInsets.only(
      left: 10,
      right: 10,
      top: 5,
      bottom: MediaQuery.of(context).viewInsets.bottom,
    ),
    child: Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          height: 5,
          width: 40,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            color: Colors.black38,
          ),
        ),
        const SizedBox(height: 10),
        Text(
          'Vehicle Detail',
          style: GoogleFonts.raleway(
            fontSize: 14,
            fontWeight: FontWeight.w800,
          ),
        ),
        // Bus details container
        Container(
          margin: const EdgeInsets.only(top: 20, bottom: 15),
          padding: const EdgeInsets.all(15),
          height: 130,
          decoration: BoxDecoration(
            color: const Color.fromRGBO(26, 21, 40, 1),
            borderRadius: BorderRadius.circular(24),
          ),
          child: Column(
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    height: 50,
                    width: 50,
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: const Color.fromRGBO(255, 136, 17, 1),
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: SvgPicture.asset('asset/bus_icon.svg'),
                  ),
                  const SizedBox(width: 20),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        busNum, /// ...................................................
                        style: GoogleFonts.raleway(
                          fontSize: 22,
                          fontWeight: FontWeight.w700,
                          color: Colors.white,
                        ),
                      ),
                      Text(
                        fuelType, /// .......................................................
                        style: GoogleFonts.raleway(
                          color: Colors.white60,
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                  const Spacer(),
                  Container(
                    height: 30,
                    width: 70,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      color: Colors.white24,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Text(
                      "$seatCount", /// ..............................................
                      style: GoogleFonts.raleway(
                        color: Colors.white,
                        fontSize: 15,
                      ),
                    ),
                  ),
                ],
              ),
              const Spacer(),

              // Features row
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: List.generate(
                   features.length,// busDetails['features'].length,
                  (index) => Container(
                    height: 30,
                    width: 80,
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    decoration: BoxDecoration(
                      color: Colors.white12,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Row(
                      children: [
                        Icon(
                          index == 0
                              ? Icons.ac_unit
                              : index == 1
                                  ? Icons.safety_check
                                  : Icons.timer,
                          size: 15,
                          color: Colors.white,
                        ),
                        const Spacer(),
                        Text(
                          features[index],
                          style: GoogleFonts.raleway(
                            fontSize: 10,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        // Route info
        Row(
          children: [
            Container(
              height: 30,
              width: 30,
              decoration: const BoxDecoration(
                color: Colors.black12,
                shape: BoxShape.circle,
              ),
              child: const Icon(Icons.map_outlined, size: 18),
            ),
            const SizedBox(width: 18),
            Text(
              'Avilable Routes',
              style: GoogleFonts.raleway(
                color: Colors.black45,
                fontSize: 12,
                fontWeight: FontWeight.w800,
              ),
            ),
            const Spacer(),
            Container(
              height: 35,
              width: 85,
              padding: const EdgeInsets.all(7),
              decoration: BoxDecoration(
                border: Border.all(width: 0.4, color: Colors.black54),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Row(
                children: [
                  Text(
                    "${DateTime.now().hour} : ${DateTime.now().minute}",
                    style: GoogleFonts.raleway(
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const Spacer(),
                  const Icon(Icons.watch_later_outlined, size: 20),
                ],
              ),
            ),
          ],
        ),
        const SizedBox(height: 30),

        // Stops list

        SizedBox(
          height: 200,
          child: ListView.builder(
            itemCount: busfetcher.getScheduleTimes(routeId).length - 1, //
            itemBuilder: (context, index) {

              List<Map<String, dynamic>> time = busfetcher.getScheduleTimes(routeId);
              String endpoint = busfetcher.getEndPoint(routeId);
              List stopS =busfetcher.getRouteStops(routeId);
              // log('$stopTime');
              return GestureDetector(
                onTap: () {},
                child: Container(
                  height: 80,
                  margin: const EdgeInsets.symmetric(
                    horizontal: 10,
                    vertical: 5,
                  ),
                  padding: const EdgeInsets.all(15),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(24),
                    boxShadow: const [
                      BoxShadow(
                        color: Colors.black12,
                        blurRadius: 10,
                      )
                    ],
                  ),
                  child: Row(
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "${time[index]['Dhour']} : ${time[index]['Dmin']}",
                            style: GoogleFonts.raleway(
                              fontSize: 18,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          Text(
                            'IST (24hrs)',
                            style: GoogleFonts.inter(
                              fontSize: 14,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(width: 25),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(height: 4),
                          Text(
                            'Stop ${index + 1}',
                            style: GoogleFonts.raleway(
                              fontSize: 12,
                              color: Colors.black26,
                            ),
                          ),
                          Text(
                            "${stopS[index]}",
                            style: GoogleFonts.raleway(
                              fontSize: 16,
                              color: Colors.black,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      ),
                      const Spacer(),
                      GestureDetector(

                        /// ....................................................... adding all required paras for next screen.
                        onTap: () {
                          Navigator.of(context).pushReplacement(
                            MaterialPageRoute(builder: (context)=> SelectedRoutescreen(
                              endlocation: endpoint,
                              startTime: {
                                'Dhour': time[index]['Dhour'],
                                'Dmin': time[index]['Dmin']
                              },
                              startLocation: stopS[index].name, fareData: busfetcher.getFareData(routeId), startStopIndex: 2, endStopIndex: 3,
                            ))
                          );
                          // Add navigation to route screen if needed
                        },
                        child: Container(
                          height: 50,
                          width: 40,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12),
                            color: const Color.fromRGBO(9, 0, 0, 0.1),
                          ),
                          child: const Icon(Icons.arrow_forward_ios, size: 15),
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
        const SizedBox(height: 20),
        // Confirm button
        SizedBox(
          height: 50,
          width: 340,
          child: GestureDetector(
            onTap: () {
              // Add confirmation logic
            },
            child: Container(
              alignment: Alignment.center,
              height: 30,
              decoration: BoxDecoration(
                color: const Color.fromRGBO(26, 21, 40, 1),
                borderRadius: BorderRadius.circular(16),
              ),
              child: Text(
                'Confirm Location',
                style: GoogleFonts.raleway(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ),
      ],
    ),
  );
}