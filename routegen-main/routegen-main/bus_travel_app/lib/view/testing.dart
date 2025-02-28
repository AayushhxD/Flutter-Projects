// // models/route_model.dart
// import 'package:flutter/material.dart';
// import 'package:firebase_database/firebase_database.dart';


// class BusRoute {
//   final String id;
//   final String routeName;
//   final String busNumber;
//   final String busType;
//   final int capacity;
//   final double farePerKm;
//   final bool active;
//   final Map<String, BusStop> stops;

//   BusRoute({
//     required this.id,
//     required this.routeName,
//     required this.busNumber,
//     required this.busType,
//     required this.capacity,
//     required this.farePerKm,
//     required this.active,
//     required this.stops,
//   });

//   Map<String, dynamic> toJson() => {
//     'routeName': routeName,
//     'busNumber': busNumber,
//     'busType': busType,
//     'capacity': capacity,
//     'farePerKm': farePerKm,
//     'active': active,
//     'stops': stops.map((key, value) => MapEntry(key, value.toJson())),
//   };

//   factory BusRoute.fromJson(String id, Map<String, dynamic> json) {
//     Map<String, BusStop> stopsMap = {};
//     if (json['stops'] != null) {
//       (json['stops'] as Map<String, dynamic>).forEach((key, value) {
//         stopsMap[key] = BusStop.fromJson(value);
//       });
//     }

//     return BusRoute(
//       id: id,
//       routeName: json['routeName'] ?? '',
//       busNumber: json['busNumber'] ?? '',
//       busType: json['busType'] ?? '',
//       capacity: json['capacity'] ?? 0,
//       farePerKm: (json['farePerKm'] ?? 0).toDouble(),
//       active: json['active'] ?? true,
//       stops: stopsMap,
//     );
//   }
// }

// class BusStop {
//   final String name;
//   final int sequence;
//   final Map<String, double> coordinates;
//   final String scheduledArrival;
//   final String scheduledDeparture;

//   BusStop({
//     required this.name,
//     required this.sequence,
//     required this.coordinates,
//     required this.scheduledArrival,
//     required this.scheduledDeparture,
//   });

//   Map<String, dynamic> toJson() => {
//     'name': name,
//     'sequence': sequence,
//     'coordinates': coordinates,
//     'scheduledArrival': scheduledArrival,
//     'scheduledDeparture': scheduledDeparture,
//   };

//   factory BusStop.fromJson(Map<String, dynamic> json) => BusStop(
//     name: json['name'] ?? '',
//     sequence: json['sequence'] ?? 0,
//     coordinates: Map<String, double>.from(json['coordinates'] ?? {}),
//     scheduledArrival: json['scheduledArrival'] ?? '',
//     scheduledDeparture: json['scheduledDeparture'] ?? '',
//   );
// }

// // services/firebase_service.dart

// class FirebaseService {
//   final DatabaseReference _routesRef = FirebaseDatabase.instance.ref().child('routes');

//   // Add a new route
//   Future<void> addRoute(BusRoute route) async {
//     try {
//       await _routesRef.push().set(route.toJson());
//     } catch (e) {
//       throw Exception('Failed to add route: $e');
//     }
//   }

//   // Update an existing route
//   Future<void> updateRoute(String routeId, Map<String, dynamic> updates) async {
//     try {
//       await _routesRef.child(routeId).update(updates);
//     } catch (e) {
//       throw Exception('Failed to update route: $e');
//     }
//   }

//   // Get all routes
//   Stream<List<BusRoute>> getRoutes() {
//     return _routesRef.onValue.map((event) {
//       final Map<dynamic, dynamic>? data = 
//           event.snapshot.value as Map<dynamic, dynamic>?;
      
//       if (data == null) return [];

//       return data.entries.map((entry) {
//         return BusRoute.fromJson(
//           entry.key.toString(),
//           Map<String, dynamic>.from(entry.value),
//         );
//       }).toList();
//     });
//   }

//   // Get a single route
//   Future<BusRoute?> getRoute(String routeId) async {
//     try {
//       final snapshot = await _routesRef.child(routeId).get();
//       if (snapshot.exists) {
//         return BusRoute.fromJson(
//           routeId,
//           Map<String, dynamic>.from(snapshot.value as Map),
//         );
//       }
//       return null;
//     } catch (e) {
//       throw Exception('Failed to get route: $e');
//     }
//   }

//   // Delete a route
//   Future<void> deleteRoute(String routeId) async {
//     try {
//       await _routesRef.child(routeId).remove();
//     } catch (e) {
//       throw Exception('Failed to delete route: $e');
//     }
//   }
// }

// // screens/add_route_screen.dart
// class AddRouteScreen extends StatefulWidget {
//   const AddRouteScreen({super.key});

//   @override
//   _AddRouteScreenState createState() => _AddRouteScreenState();
// }

// class _AddRouteScreenState extends State<AddRouteScreen> {
//   final _formKey = GlobalKey<FormState>();
//   final _firebaseService = FirebaseService();
//   final _routeNameController = TextEditingController();
//   final _busNumberController = TextEditingController();
  
//   Map<String, BusStop> stops = {};

//   Future<void> _saveRoute() async {
//     if (_formKey.currentState!.validate()) {
//       try {
//         final newRoute = BusRoute(
//           id: '', // Firebase will generate this
//           routeName: _routeNameController.text,
//           busNumber: _busNumberController.text,
//           busType: 'electric', // Add dropdown for this
//           capacity: 45,
//           farePerKm: 2.5,
//           active: true,
//           stops: stops,
//         );

//         await _firebaseService.addRoute(newRoute);
//         ScaffoldMessenger.of(context).showSnackBar(
//           SnackBar(content: Text('Route added successfully!')),
//         );
//         Navigator.pop(context);
//       } catch (e) {
//         ScaffoldMessenger.of(context).showSnackBar(
//           SnackBar(content: Text('Error adding route: $e')),
//         );
//       }
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: Text('Add New Route')),
//       body: Form(
//         key: _formKey,
//         child: ListView(
//           padding: EdgeInsets.all(16),
//           children: [
//             TextFormField(
//               controller: _routeNameController,
//               decoration: InputDecoration(labelText: 'Route Name'),
//               validator: (value) {
//                 if (value == null || value.isEmpty) {
//                   return 'Please enter route name';
//                 }
//                 return null;
//               },
//             ),
//             TextFormField(
//               controller: _busNumberController,
//               decoration: InputDecoration(labelText: 'Bus Number'),
//               validator: (value) {
//                 if (value == null || value.isEmpty) {
//                   return 'Please enter bus number';
//                 }
//                 return null;
//               },
//             ),
//             // Add more fields as needed
//             SizedBox(height: 20),
//             ElevatedButton(
//               onPressed: _saveRoute,
//               child: Text('Save Route'),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

// // screens/routes_list_screen.dart
// class RoutesListScreen extends StatelessWidget {
//   final _firebaseService = FirebaseService();

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: Text('Routes')),
//       body: StreamBuilder<List<BusRoute>>(
//         stream: _firebaseService.getRoutes(),
//         builder: (context, snapshot) {
//           if (snapshot.hasError) {
//             return Center(child: Text('Error: ${snapshot.error}'));
//           }

//           if (!snapshot.hasData) {
//             return const Center(child: CircularProgressIndicator());
//           }

//           final routes = snapshot.data!;
          
//           return ListView.builder(
//             itemCount: routes.length,
//             itemBuilder: (context, index) {
//               final route = routes[index];
//               return ListTile(
//                 title: Text(route.routeName),
//                 subtitle: Text(route.busNumber),
//                 trailing: IconButton(
//                   icon: const Icon(Icons.edit),
//                   onPressed: () {
//                     // Navigate to edit screen
//                     // Navigator.push(
//                     //   context,
//                     //   MaterialPageRoute(
//                     //     builder: (context) => EditRouteScreen(route: route),
//                     //   ),
//                     // );
//                   },
//                 ),
//               );
//             },
//           );
//         },
//       ),
//       floatingActionButton: FloatingActionButton(
//         onPressed: () {
//           Navigator.push(
//             context,
//             MaterialPageRoute(builder: (context) => const AddRouteScreen()),
//           );
//         },
//         child: const Icon(Icons.add),
//       ),
//     );
//   }
// }