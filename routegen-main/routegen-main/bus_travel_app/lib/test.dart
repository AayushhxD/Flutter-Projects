// import 'dart:developer';
// import 'package:flutter/material.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';

// // Previous classes remain the same until _CSeatLayoutState

// class _CSeatLayoutState extends State<ConductorsSeatLayout> {
//   final List<int> items = List.generate(14, (index) => index + 1);
//   final Map<String, PassengerJourney> selectedSeats = {};
//   final BusOccupancyState busState = BusOccupancyState();
//   bool isRemovingSeats = false;
//   String selectedDestination = '';
//   bool isLoading = true;

//   @override
//   void initState() {
//     super.initState();
//     _initializeState();
//   }

//   Future<void> _initializeState() async {
//     setState(() => isLoading = true);
    
//     try {
//       await busState.initialize(widget.busId);
//       await _loadBusStops();
//       // Add a listener to refresh UI when occupancy changes
//       busState.addListener(() {
//         if (mounted) setState(() {});
//       });
//     } catch (e) {
//       log('Error initializing state: $e');
//     } finally {
//       setState(() => isLoading = false);
//     }
//   }

//   Future<void> _loadBusStops() async {
//     try {
//       DocumentSnapshot busDoc = await FirebaseFirestore.instance
//           .collection('Buses')
//           .doc(widget.busId)
//           .get();

//       if (busDoc.exists) {
//         final busData = busDoc.data() as Map<String, dynamic>;
//         final String routeRef = busData['schedule'] ?? '';
//         await busState.fetchBusStops(routeRef);
        
//         if (busState.busStops.isNotEmpty) {
//           setState(() {
//             selectedDestination = busState.busStops[0].name;
//           });
//         }
//       }
//     } catch (e) {
//       log('Error loading bus data: $e');
//     }
//   }

//   Future<void> _updateOccupancy() async {
//     if (selectedSeats.isEmpty) {
//       ScaffoldMessenger.of(context).showSnackBar(
//         SnackBar(
//           content: Text(
//             isRemovingSeats 
//                 ? 'Please select seats to mark as vacant'
//                 : 'Please select seats and destination',
//             style: GoogleFonts.raleway(),
//           ),
//           backgroundColor: Colors.orange,
//         ),
//       );
//       return;
//     }

//     if (!isRemovingSeats && selectedDestination.isEmpty) {
//       ScaffoldMessenger.of(context).showSnackBar(
//         SnackBar(
//           content: Text(
//             'Please select a destination stop',
//             style: GoogleFonts.raleway(),
//           ),
//           backgroundColor: Colors.orange,
//         ),
//       );
//       return;
//     }

//     try {
//       // Show loading indicator
//       setState(() => isLoading = true);

//       // Update Firestore through BusOccupancyState
//       await busState.updateBookedSeats(
//         Map.from(selectedSeats),
//         isRemoving: isRemovingSeats,
//       );
      
//       // Clear selected seats after successful update
//       setState(() {
//         selectedSeats.clear();
//         isLoading = false;
//       });

//       // Show success message
//       if (mounted) {
//         ScaffoldMessenger.of(context).showSnackBar(
//           SnackBar(
//             content: Text(
//               'Successfully ${isRemovingSeats ? "removed" : "marked"} selected seats',
//               style: GoogleFonts.raleway(),
//             ),
//             backgroundColor: isRemovingSeats ? Colors.orange : Colors.green,
//           ),
//         );
//       }

//       // Close the bottom sheet
//       if (mounted) Navigator.pop(context);
//     } catch (e) {
//       setState(() => isLoading = false);
//       if (mounted) {
//         ScaffoldMessenger.of(context).showSnackBar(
//           SnackBar(
//             content: Text(
//               'Error updating seats: ${e.toString()}',
//               style: GoogleFonts.raleway(),
//             ),
//             backgroundColor: Colors.red,
//           ),
//         );
//       }
//     }
//   }

//   Widget buildSeatColumn(List<int> itemList, int columnNumber) {
//     ScrollController columnController = ScrollController();

//     return GridView.builder(
//       controller: columnController,
//       gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
//         crossAxisCount: 2,
//         crossAxisSpacing: 10,
//         mainAxisSpacing: 10,
//       ),
//       itemCount: itemList.length,
//       itemBuilder: (context, index) {
//         String seatKey = '${columnNumber}_${itemList[index]}';
//         int seatNumber = itemList[index] * columnNumber;
//         bool isBooked = busState.bookedSeats.containsKey(seatKey);
//         bool isSelected = selectedSeats.containsKey(seatKey);
        
//         Color seatColor = isBooked 
//             ? (isRemovingSeats && isSelected ? Colors.orange : Colors.grey.shade600)
//             : isSelected 
//                 ? Colors.green 
//                 : Colors.white;

//         return GestureDetector(
//           onTap: isBooked 
//               ? (isRemovingSeats ? () => _handleSeatSelection(seatKey, seatNumber) : null)
//               : (!isRemovingSeats ? () => _handleSeatSelection(seatKey, seatNumber) : null),
//           child: Container(
//             alignment: Alignment.center,
//             decoration: BoxDecoration(
//               borderRadius: BorderRadius.circular(10),
//               color: seatColor,
//               border: Border.all(
//                 width: 1,
//                 color: isBooked ? Colors.grey.shade600 : Colors.black54,
//               ),
//             ),
//             child: Column(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 Text(
//                   '$seatNumber',
//                   style: GoogleFonts.raleway(
//                     fontSize: 12,
//                     color: isBooked || isSelected ? Colors.white : Colors.black,
//                     fontWeight: FontWeight.bold,
//                   ),
//                 ),
//                 if (isBooked && !isRemovingSeats) Text(
//                   'To: ${busState.bookedSeats[seatKey]?.destinationStop ?? ""}',
//                   style: GoogleFonts.raleway(
//                     fontSize: 8,
//                     color: Colors.white,
//                   ),
//                   textAlign: TextAlign.center,
//                 ),
//               ],
//             ),
//           ),
//         );
//       },
//     );
//   }

//   void _handleSeatSelection(String seatKey, int seatNumber) {
//     setState(() {
//       if (selectedSeats.containsKey(seatKey)) {
//         selectedSeats.remove(seatKey);
//       } else {
//         selectedSeats[seatKey] = PassengerJourney(
//           destinationStop: isRemovingSeats 
//               ? busState.bookedSeats[seatKey]!.destinationStop 
//               : selectedDestination,
//           seatNumber: seatNumber,
//         );
//       }
//     });
//   }

//   // Rest of the build method remains the same
// }

// ////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


// class _CSeatLayoutState extends State<ConductorsSeatLayout> {
//   // ... previous state variables remain the same ...

//   // Updated build method with fixed dropdowns
//   @override
//   Widget build(BuildContext context) {
//     if (isLoading) {
//       return const Center(child: CircularProgressIndicator());
//     }

//     return Padding(
//       padding: const EdgeInsets.symmetric(horizontal: 60, vertical: 10),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.center,
//         mainAxisSize: MainAxisSize.min,
//         children: [
//           Row(
//             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//             children: [
//               Text(
//                 'Live Bus Occupancy',
//                 style: GoogleFonts.raleway(
//                   fontSize: 16,
//                   fontWeight: FontWeight.bold,
//                 ),
//               ),
//               const Icon(Icons.directions_bus_outlined),
//             ],
//           ),
          
//           Container(
//             margin: const EdgeInsets.symmetric(vertical: 5),
//             height: 1,
//             color: Colors.black54,
//           ),

//           // Updated Current Stop Dropdown
//           Container(
//             margin: const EdgeInsets.symmetric(vertical: 10),
//             child: Row(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 Text(
//                   'Current Stop: ',
//                   style: GoogleFonts.raleway(fontWeight: FontWeight.bold),
//                 ),
//                 DropdownButtonHideUnderline(
//                   child: Container(
//                     padding: const EdgeInsets.symmetric(horizontal: 10),
//                     decoration: BoxDecoration(
//                       border: Border.all(color: Colors.grey),
//                       borderRadius: BorderRadius.circular(8),
//                     ),
//                     child: DropdownButton<String>(
//                       value: busState.currentStop,
//                       icon: const Icon(Icons.arrow_drop_down),
//                       elevation: 16,
//                       style: GoogleFonts.raleway(color: Colors.black),
//                       items: busState.getStopNames()
//                           .map<DropdownMenuItem<String>>((String stop) {
//                         return DropdownMenuItem<String>(
//                           value: stop,
//                           child: Text(
//                             stop,
//                             style: GoogleFonts.raleway(),
//                           ),
//                         );
//                       }).toList(),
//                       onChanged: (String? newValue) {
//                         if (newValue != null) {
//                           setState(() {
//                             busState.updateBusStop(newValue);
//                           });
//                         }
//                       },
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//           ),

//           // Updated Destination Stop Dropdown
//           if (!isRemovingSeats) Container(
//             margin: const EdgeInsets.symmetric(vertical: 10),
//             child: Row(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 Text(
//                   'Destination Stop: ',
//                   style: GoogleFonts.raleway(fontWeight: FontWeight.bold),
//                 ),
//                 DropdownButtonHideUnderline(
//                   child: Container(
//                     padding: const EdgeInsets.symmetric(horizontal: 10),
//                     decoration: BoxDecoration(
//                       border: Border.all(color: Colors.grey),
//                       borderRadius: BorderRadius.circular(8),
//                     ),
//                     child: DropdownButton<String>(
//                       value: selectedDestination,
//                       icon: const Icon(Icons.arrow_drop_down),
//                       elevation: 16,
//                       style: GoogleFonts.raleway(color: Colors.black),
//                       items: busState.getStopNames()
//                           .where((stop) => stop != busState.currentStop) // Filter out current stop
//                           .map<DropdownMenuItem<String>>((String stop) {
//                         return DropdownMenuItem<String>(
//                           value: stop,
//                           child: Text(
//                             stop,
//                             style: GoogleFonts.raleway(),
//                           ),
//                         );
//                       }).toList(),
//                       onChanged: (String? newValue) {
//                         if (newValue != null) {
//                           setState(() {
//                             selectedDestination = newValue;
//                             // Clear selected seats when destination changes
//                             selectedSeats.clear();
//                           });
//                         }
//                       },
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//           ),

//           // Mode Toggle Button
//           GestureDetector(
//             onTap: _toggleMode,
//             child: Container(
//               padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
//               margin: const EdgeInsets.only(bottom: 10, top: 10),
//               decoration: BoxDecoration(
//                 color: isRemovingSeats ? Colors.orange : Colors.green,
//                 borderRadius: BorderRadius.circular(15),
//               ),
//               child: Text(
//                 isRemovingSeats ? 'Mode: Marking Vacant Seats' : 'Mode: Marking Occupied Seats',
//                 style: GoogleFonts.raleway(
//                   color: Colors.white,
//                   fontSize: 15,
//                   fontWeight: FontWeight.w600,
//                 ),
//               ),
//             ),
//           ),

//           // Seat Layout
//           Expanded(
//             child: Row(
//               children: [
//                 SizedBox(
//                   width: 70,
//                   child: buildSeatColumn(items, 1),
//                 ),
//                 const Spacer(),
//                 SizedBox(
//                   width: 70,
//                   child: buildSeatColumn(items, 2),
//                 ),
//               ],
//             ),
//           ),
          
//           // Occupancy Information
//           Container(
//             margin: const EdgeInsets.symmetric(vertical: 10),
//             child: Column(
//               children: [
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   children: [
//                     Text(
//                       '${busState.bookedSeats.length} Occupied',
//                       style: GoogleFonts.raleway(
//                         fontSize: 14,
//                         fontWeight: FontWeight.bold,
//                         color: Colors.red,
//                       ),
//                     ),
//                     Text(
//                       ' / ${items.length * 2} Total',
//                       style: GoogleFonts.raleway(fontSize: 14),
//                     ),
//                   ],
//                 ),
//                 if (selectedSeats.isNotEmpty) Padding(
//                   padding: const EdgeInsets.only(top: 8),
//                   child: Text(
//                     '${isRemovingSeats ? "Marking Vacant" : "Marking Occupied"}: ${selectedSeats.entries.map((e) => e.value.seatNumber).toList()..sort()..join(", ")}',
//                     style: GoogleFonts.raleway(
//                       fontSize: 12,
//                       color: isRemovingSeats ? Colors.orange : Colors.green,
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//           ),
          
//           // Update Button
//           Padding(
//             padding: const EdgeInsets.only(bottom: 20),
//             child: GestureDetector(
//               onTap: _updateOccupancy,
//               child: Container(
//                 padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 24),
//                 decoration: BoxDecoration(
//                   color: selectedSeats.isEmpty 
//                       ? Colors.grey 
//                       : isRemovingSeats
//                           ? Colors.orange
//                           : const Color.fromRGBO(26, 21, 40, 1),
//                   borderRadius: BorderRadius.circular(20),
//                 ),
//                 child: Text(
//                   'Update Live Occupancy',
//                   style: GoogleFonts.raleway(
//                     fontWeight: FontWeight.w700,
//                     color: Colors.white,
//                     fontSize: 15,
//                   ),
//                 ),
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }

//   // Add this method to validate destination selection
//   void _validateDestinationSelection() {
//     if (!isRemovingSeats && selectedDestination == busState.currentStop) {
//       // Reset destination if it's the same as current stop
//       final availableStops = busState.getStopNames()
//           .where((stop) => stop != busState.currentStop)
//           .toList();
//       if (availableStops.isNotEmpty) {
//         setState(() {
//           selectedDestination = availableStops.first;
//         });
//       }
//     }
//   }

//   @override
//   void didUpdateWidget(ConductorsSeatLayout oldWidget) {
//     super.didUpdateWidget(oldWidget);
//     _validateDestinationSelection();
//   }

//   // ... rest of the class implementation remains the same ...
// }