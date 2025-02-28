import 'dart:developer';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:routegen/model/bus_stop_model.dart';

class BusFetcher {
  // Lists to store data for each route
  final Map<String, List<BusStop>> routeStops = {};
  final Map<String, String> busNumbers = {};
  final Map<String, String> fuelTypes = {};
  final Map<String, int> seatCounts = {};
  final Map<String, List<String>> busFeatures = {};
  final Map<String, Map<String, dynamic>> scheduleDetails = {};
  final Map<String, String> routeDestination = {};

  final Map<String, Map<String, int>> _routeFares = {};

  /////////////////////////////////
  final Map<String, List<Map<String, dynamic>>> scheduleTimes = {};
  /////////////////////////////////

  Future<void> fetchBusStopData() async {
    try {
      // Fetch all documents from Routes collection
      QuerySnapshot routesSnapshot = await FirebaseFirestore.instance.collection('Routes').get();

      

      // Iterate through each route document
      for (var routeDoc in routesSnapshot.docs) {
        String routeId = routeDoc.id;
        
        // Initialize empty lists/sets for this route
        routeStops[routeId] = [];
        busFeatures[routeId] = [];
        
        
        
        // Get bus reference and fetch bus details
        DocumentReference busRef = routeDoc.get('bus') as DocumentReference;
        DocumentSnapshot busSnapshot = await busRef.get();
        Map<String, dynamic> busDetails = 
            busSnapshot.data() as Map<String, dynamic>;

        // Store bus details
        busNumbers[routeId] = busDetails['number'].toString();
        fuelTypes[routeId] = busDetails['type'].toString();
        seatCounts[routeId] = busDetails['seatCount'] as int;

        

        // Store bus features
        if (busDetails['features'] != null) {
          for (var feature in busDetails['features']) {
            busFeatures[routeId]?.add(feature.toString());
          }
        }

        routeDestination[routeId] = await routeDoc.get('endPoint');
        // Process stops data
        List<Map<String, dynamic>> routetime = [];
        // Get stops array
        List<dynamic> stopsData = routeDoc.get('stops') as List<dynamic>;
        
        for (var stopData in stopsData) {
          
          routetime.add({
            'Dhour': stopData['DepartureHour'] ?? stopData['ArrivalHour'],
            'Dmin' : stopData['DepartureMinute'] ?? stopData['ArrivalMinute']
          });
          // log('$routetime');
          // Add bus stop
          routeStops[routeId]?.add(
            BusStop(name: stopData['stop'].toString())
          );

          // Store schedule details
          scheduleDetails[routeId] = {
            'firstStop': {
              'departureHour': stopsData.first['DepartureHour'],
              'departureMinute': stopsData.first['DepartureMinute'],
            },
            'lastStop': {
              'arrivalHour': stopsData.last['ArrivalHour'],
              'arrivalMinute': stopsData.last['ArrivalMinute'],
            }
          };
        }
        scheduleTimes[routeId] = routetime;

        if (routeDoc.data() is Map<String, dynamic>) {
          Map<String, dynamic> data = routeDoc.data() as Map<String, dynamic>;
          if (data.containsKey('fare')) {
            Map<String, int> fareData = {};
            Map<String, dynamic> rawFareData = data['fare'] as Map<String, dynamic>;
            
            rawFareData.forEach((key, value) {
              if (value is num) {
                fareData[key] = value.toInt();
              }
            });
            
            _routeFares[routeId] = fareData;
          }
        }

      }
    } catch (e) {
      log('Error fetching bus data: $e');
      rethrow; // Rethrow to handle error in UI
    }
  }

  // Getter methods for accessing the data
  List<BusStop> getRouteStops(String routeId) => routeStops[routeId]!;
  String getBusNumber(String routeId) => busNumbers[routeId]!;
  String getFuelType(String routeId) => fuelTypes[routeId]!;
  int? getSeatCount(String routeId) => seatCounts[routeId]!;
  List<String> getBusFeatures(String routeId) => busFeatures[routeId]!;
  Map<String, dynamic> getScheduleDetails(String routeId) => scheduleDetails[routeId]!;
  String getEndPoint(String routeId) => routeDestination[routeId]!;
  List<Map<String, dynamic>> getScheduleTimes(String routeId) => scheduleTimes[routeId]!;

  Map<String, int> getFareData(String routeId) {
    return _routeFares[routeId] ?? {};
  }

  int? getFareBetweenStops(String routeId, int startIndex, int endIndex) {
    var fareData = getFareData(routeId);
    String fareKey = '${startIndex}_$endIndex';
    return fareData[fareKey];
  }
}