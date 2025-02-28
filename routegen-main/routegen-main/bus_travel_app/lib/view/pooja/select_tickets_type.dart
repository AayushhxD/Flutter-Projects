// import 'package:flutter/material.dart';
// import 'package:routegen/view/common_appbar.dart';
// import 'package:routegen/view/bottomnav.dart';
// import './options.dart';
// import "package:google_fonts/google_fonts.dart";


// class TicketSelectionScreen extends StatefulWidget {
//   const TicketSelectionScreen({super.key});

//   @override
//   State createState() => _TicketSelectionScreenState();
// }

// class _TicketSelectionScreenState extends State<TicketSelectionScreen> {
//   // State to track the selected ticket option
//   int _selectedTicketIndex = 0;

//   // List of ticket options
//   final List<Map<String, String>> tickets = [
//     {'title': 'Single Tickets', 'description': 'I just have to make a single trip.'},
//     {'title': 'Selected Area Pass', 'description': 'Free travel at a fixed price within the selected area.'},
//     {'title': 'Day Pass', 'description': 'Travel freely by bus, train, metro for 24 hours.'},
//     {'title': 'Trip Package', 'description': 'Buy a 10-trip cutting card with a discount.'},
//   ];

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: const CommonAppbar(isNotificationOpen: false),
      
//       body: Column(
//         children: [
//           // Yellow Header Section
//           Container(
//             color: const Color.fromRGBO(255, 206, 72, 1),
//             padding: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 10.0),
//             alignment: Alignment.centerLeft,
//             child:  Text(
//               'Select ticket',
//               style: GoogleFonts.raleway(
//                 fontSize: 24,
//                 fontWeight: FontWeight.bold,
//                 color: Colors.black,
//               ),
//             ),
//           ),
//           // Tickets List
//           Expanded(
//             child: ListView.builder(
//               itemCount: tickets.length,
//               itemBuilder: (context, index) {
//                 return GestureDetector(
//                   onTap: () {
//                     setState(() {
//                       _selectedTicketIndex = index;
//                     });
//                   },
//                   child: Padding(
//                     padding: const EdgeInsets.symmetric(horizontal: 16.0,
//                      vertical: 8.0),
//                     child: Card(
//                       shape: RoundedRectangleBorder(
//                         borderRadius: BorderRadius.circular(10),
//                       ),
//                       elevation: 3,
//                       child: ListTile(
//                         leading: Container(
//                           decoration: const BoxDecoration(
//                             color: Colors.black,
//                             shape: BoxShape.circle,
//                           ),
//                           padding: const EdgeInsets.all(12.0),
//                           child: const Icon(Icons.confirmation_num, color: Colors.white),
//                         ),
//                         title: Text(
//                           tickets[index]['title']!,
//                           style: GoogleFonts.raleway(
//                             fontSize: 18,
//                             fontWeight: FontWeight.bold,
//                           ),
//                         ),
//                         subtitle: Text(tickets[index]['description']!),
//                         trailing: _selectedTicketIndex == index
//                             ? const Icon(Icons.radio_button_checked, color: Colors.orange)
//                             : const Icon(Icons.radio_button_unchecked, color: Colors.grey),
//                       ),
//                     ),
//                   ),
//                 );
//               },
//             ),
//           ),
//           // Bottom Button for Selection
//           Padding(
//             padding: const EdgeInsets.all(16.0),
//             child: ElevatedButton(
//               onPressed: () {
//                 Navigator.of(context).pushReplacement(
//                   MaterialPageRoute(builder:(context){
//                     return const TicketPurchaseScreendetails();
//                   }
//                   ),
//                 );
//               },
//               style: ElevatedButton.styleFrom(
//                 backgroundColor: Colors.black,
//                 minimumSize: const Size.fromHeight(50),
//                 shape: RoundedRectangleBorder(
//                   borderRadius: BorderRadius.circular(10),
//                 ),
//               ),
//               child: Text(
//                 'Select ${tickets[_selectedTicketIndex]['title']}',
//                 style: const TextStyle(
//                   color: Colors.white,
//                   fontSize: 18,
//                 ),
//               ),
//             ),
//           ),
//         ],
//       ),
      
//       bottomNavigationBar: const OneBottomnav(),
//     );
//   }
// }

