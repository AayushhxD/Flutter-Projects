// import 'package:flutter/material.dart';
// import 'package:routegen/view/common_appbar.dart';
// import 'package:routegen/view/bottomnav.dart';
// import './pay.dart';
// import "package:google_fonts/google_fonts.dart";



// class TicketPurchaseScreendetails extends StatefulWidget {
//   const TicketPurchaseScreendetails({super.key});

//   @override
//   State createState() => _TicketPurchaseScreendetailsState();
// }

// class _TicketPurchaseScreendetailsState extends State<TicketPurchaseScreendetails> {

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.white,
//       appBar: const CommonAppbar(isNotificationOpen: false),
//       body: SingleChildScrollView(
        
//         // padding: const EdgeInsets.all(16),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Container(
              
//             color: const Color.fromRGBO(255, 206, 72, 1),
//             padding: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 20.0),
//             alignment: Alignment.centerLeft,
//             child:  Text(
//               'Create one-way ticket',
//               style: GoogleFonts.raleway(
//                 fontSize: 24,
//                 fontWeight: FontWeight.bold,
//                 color: Colors.black,
//               ),
//             ),
//             ),
            
//              Padding(
//               padding: const EdgeInsets.all(16.0),
//               child: Text(
//                 'Valid From',
//                 style: GoogleFonts.raleway(fontSize: 20,
//                  fontWeight: FontWeight.w400, 
//                  color: Colors.black),
//               ),
//             ),
            

//             // Date Selection
//             SingleChildScrollView(
//               scrollDirection: Axis.horizontal,
//               child: Padding(
//                 padding: const EdgeInsets.all(8.0),
//                 child: Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   children: [
//                     ChoiceChip(
//                       label:  Column(
//                         children: [
//                           Text('today',
//                            style: GoogleFonts.raleway(color: Colors.white)),
//                           Text('19 aug', 
//                           style: GoogleFonts.raleway(color: Colors.white)),
//                         ],
//                       ),
//                       selected: true,
//                       onSelected: (bool selected) {},
//                        backgroundColor: Colors.grey[200],
//                        selectedColor: Colors.black,
//                     ),
//                     ChoiceChip(
//                       label:  Column(
//                         children: [
//                           Text('SAT', 
//                           style: GoogleFonts.raleway(color: Colors.black)),
//                           Text('20 aug', 
//                           style: GoogleFonts.raleway(color: Colors.black)),
//                         ],
//                       ),
//                       selected: false,
//                       onSelected: (bool selected) {},
//                       backgroundColor: Colors.grey[200],
//                     ),
//                     ChoiceChip(
//                       label:  Column(
//                         children: [
//                           Text('SON', 
//                           style: GoogleFonts.raleway(color: Colors.black)),
//                           Text('21 aug',
//                            style: GoogleFonts.raleway(color: Colors.black)),
//                         ],
//                       ),
//                       selected: false,
//                       onSelected: (bool selected) {},
//                       backgroundColor: Colors.grey[200],
//                     ),
//                     ChoiceChip(
//                       label:  Column(
//                         children: [
//                           Text('MAN',  
//                           style: GoogleFonts.raleway(color: Colors.black)),
//                           Text('22 aug',
//                            style: GoogleFonts.raleway(color: Colors.black)),
//                         ],
//                       ),
//                       selected: false,
//                       onSelected: (bool selected) {},
//                       backgroundColor: Colors.grey[200],
//                     ),
//                     ChoiceChip(
//                       label:  Column(
//                         children: [
//                           Text('TUE', 
//                           style: GoogleFonts.raleway(color: Colors.black)),
//                           Text('22 aug', 
//                           style: GoogleFonts.raleway(color: Colors.black)),
//                         ],
//                       ),
//                       selected: false,
//                       onSelected: (bool selected) {},
//                       backgroundColor: Colors.grey[200],
//                     ),
//                     ChoiceChip(
//                       label:  Column(
//                         children: [
//                           Text('WED', 
//                           style: GoogleFonts.raleway(color: Colors.black)),
//                           Text('22 aug', 
//                           style: GoogleFonts.raleway(color: Colors.black)),
//                         ],
//                       ),
//                       selected:false,
//                       onSelected: (bool selected) {},
//                       backgroundColor: Colors.grey[200],
//                     ),
//                     ChoiceChip(
//                       label:  Column(
//                         children: [
//                           Text('FRI',
//                            style: GoogleFonts.raleway(color: Colors.black)),
//                           Text('22 aug', 
//                           style: GoogleFonts.raleway(color: Colors.black)),
//                         ],
//                       ),
//                       selected: false,
//                       onSelected: (bool selected) {},
//                       backgroundColor: Colors.grey[200],
//                     ),
//                   ],
//                 ),
//               ),
//             ),
            

//             // Time Selection
//             Padding(
//               padding: const EdgeInsets.all(2.0),
//               child: Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: [
//                   ChoiceChip(
//                     label:  Text('14:02', 
//                     style: GoogleFonts.raleway(color: Colors.white)),
//                     selected: true,
//                     onSelected: (bool selected) {},
//                     backgroundColor: Colors.grey[200],
//                     selectedColor: Colors.black,
//                   ),
//                   ChoiceChip(
//                     label:  Text('14:05', 
//                     style: GoogleFonts.raleway(color: Colors.black)),
//                     selected: false,
//                     onSelected: (bool selected) {},
//                     backgroundColor: Colors.grey[200],
//                   ),
//                   ChoiceChip(
//                     label:  Text('14:10', 
//                     style: GoogleFonts.raleway(color: Colors.black)),
//                     selected: false,
//                     onSelected: (bool selected) {},
//                     backgroundColor: Colors.grey[200],
//                   ),
//                   ChoiceChip(
//                     label:  Text('14:15',
//                     style: GoogleFonts.raleway(color: Colors.black)),
//                     selected: false,
//                     onSelected: (bool selected) {},
//                     backgroundColor: Colors.grey[200],
//                   ),
//                   ChoiceChip(
//                     label:  Text('14:20',
//                     style: GoogleFonts.raleway(color: Colors.black)),
//                     selected: false,
//                     onSelected: (bool selected) {},
//                     backgroundColor: Colors.grey[200],
//                   ),
                  
                  
//                 ],
//               ),
//             ),
            
//             Divider(color: Colors.grey[300], height: 32, thickness: 1),

//             // Passenger Type and Count
//             Padding(
//               padding: const EdgeInsets.all(8.0),
//               child:  Text(
//                 'Age group',
//                 style: GoogleFonts.raleway(fontSize: 18, 
//                 fontWeight: FontWeight.bold),
//               ),
//             ),
            
//             Padding(
//               padding: const EdgeInsets.all(8.0),
//               child: Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: [
//                   Row(
//                     children: [
//                        Text('Adult', style: GoogleFonts.raleway(fontSize: 16, 
//                        fontWeight: FontWeight.bold)),
//                       const SizedBox(width: 12),
//                       IconButton(
//                         icon: const Icon(Icons.remove_circle_outline, color: Colors.grey),
//                         onPressed: () {},
//                       ),
//                      Text('1', style: GoogleFonts.raleway(fontSize: 18)),
//                       IconButton(
//                         icon: const Icon(Icons.add_circle, color: Colors.black),
//                         onPressed: () {},
//                       ),
//                     ],
//                   ),
//                   Row(
//                     children: [
//                        Text('Child', style: GoogleFonts.raleway(fontSize: 16,
//                         fontWeight: FontWeight.bold),),

//                       const SizedBox(width: 12),

//                       IconButton(
//                         icon: const Icon(Icons.remove_circle_outline, color: Colors.grey),
//                         onPressed: () {},
//                       ),
//                       Text('0', style: GoogleFonts.raleway(fontSize: 18)),
//                       IconButton(
//                         icon: const Icon(Icons.add_circle, color: Colors.black),
//                         onPressed: () {},
//                       ),
//                     ],
//                   ),
//                 ],
//               ),
//             ),
            
//             Divider(color: Colors.grey[300], 
//             height: 32,
//              thickness: 1),

//             // Zone Selection
//              Padding(
//               padding:  const EdgeInsets.all(8.0),
//               child:  Text(
//                 'Select Zones',
//                 style: GoogleFonts.raleway(
//                   fontSize: 18, 
//                 fontWeight: FontWeight.bold),
//               ),
//             ),

//             const SizedBox(height: 10),

//             Padding(
//               padding: const EdgeInsets.all(8.0),
//               child: Row(

//                 children: [
//                   ChoiceChip(
//                     label: Text('1', style:GoogleFonts.raleway(
//                       color: Colors.black)),
//                     selected: false,
//                     onSelected: (bool selected) {},
//                     backgroundColor: Colors.grey[200],
//                   ),
//                   ChoiceChip(
//                     label: Text('2',
//                      style: GoogleFonts.raleway(color: Colors.white)),
//                     selected: true,
//                     onSelected: (bool selected) {},
//                     backgroundColor: Colors.grey[200],
//                     selectedColor: Colors.black,
//                   ),
//                   ChoiceChip(
//                     label: Text('3', 
//                     style: GoogleFonts.raleway(color: Colors.black)),
//                     selected: false,
//                     onSelected: (bool selected) {},
//                     backgroundColor: Colors.grey[200],
//                   ),
//                   ChoiceChip(
//                     label:  Text('4', 
//                     style: GoogleFonts.raleway(color: Colors.black)),
//                     selected: false,
//                     onSelected: (bool selected) {},
//                     backgroundColor: Colors.grey[200],
//                   ),
//                   ChoiceChip(
//                     label: Text('5',
                    
//                      style: GoogleFonts.raleway(color: Colors.black)),
//                     selected: false,
//                     onSelected: (bool selected) {},
//                     backgroundColor: Colors.grey[200],
//                   ),
//                   Container(
//                     padding: const EdgeInsets.symmetric(vertical: 8,
//                      horizontal: 12),
//                     decoration: BoxDecoration(
//                       color: Colors.orange.shade700,
//                       borderRadius: BorderRadius.circular(12),
//                     ),

//                     child:  Text(
//                       'Start zone\n2',
//                       textAlign: TextAlign.center,
//                       style: GoogleFonts.raleway(color: Colors.white, 
//                       fontSize: 12),
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//             const SizedBox(height: 20),

//             // Payment Button
//             Padding(
//               padding: const EdgeInsets.all(8.0),
//               child: Center(
//                 child: ElevatedButton(
                  
//                   onPressed: () {
//                 Navigator.of(context).pushReplacement(
//                   MaterialPageRoute(builder:(context){
//                     return const TicketPurchaseScreen ();
//                   }
//                   ),
//                 );
//               },
//                   style: ElevatedButton.styleFrom(
//                     backgroundColor: Colors.black,
//                     minimumSize: const Size.fromHeight(50),
//                     shape: RoundedRectangleBorder(
//                       borderRadius: BorderRadius.circular(10),
//                     ),
//                   ),
//                   child: Text(
//                     'Go To Payment',
//                     style: GoogleFonts.raleway(color: Colors.white, 
//                     fontSize: 18),
//                   ),
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//       bottomNavigationBar: const OneBottomnav(),
//     );
//   }
// }
