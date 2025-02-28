import 'package:flutter/material.dart';
import 'package:routegen/view/common_appbar.dart';
import 'package:routegen/view/bottomnav.dart';
// import "package:intl/intl.dart";
import "package:google_fonts/google_fonts.dart";


class TicketScreen extends StatefulWidget {
  const TicketScreen({super.key});
  @override
  State createState() => _TicketScreenState();
}
class _TicketScreenState extends State<TicketScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CommonAppbar(isNotificationOpen: false),
      body: SingleChildScrollView(
        // padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
            color: const Color.fromRGBO(255, 206, 72, 1),
            padding: const EdgeInsets.symmetric(vertical: 20.0, 
            horizontal: 20.0),
            alignment: Alignment.centerLeft,
            child:  Text(
              'My tickets',
              style: GoogleFonts.raleway(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
          ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Tickets',
                    style: GoogleFonts.raleway(fontSize: 18,
                     fontWeight: FontWeight.bold),
                  ),
                  TextButton(
                    onPressed: () {},
                    child:  Text(
                      'Rock Choir',
                      style: GoogleFonts.raleway(color: Colors.grey),
                    ),
                  ),
                ],
              ),
            ),
            const Divider(),
            const SizedBox(height: 16),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                   Text(
                    'Active tickets',
                    style:GoogleFonts.raleway(fontSize: 18,
                     fontWeight: FontWeight.bold),
                  ),
                  DropdownButton<String>(
                    items: const [
                      DropdownMenuItem(value: 'Newest', child: Text('Nyeste')),
                      DropdownMenuItem(value: 'Elder', child: Text('Ældste')),
                    ],
                    onChanged: (value) {},
                  ),
                ],
              ),
            ),
            const SizedBox(height: 8),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: const Color(0xFF2E3044),
                  borderRadius: BorderRadius.circular(16),
                ),
                child:  Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          '14:02',
                          style: GoogleFonts.raleway(color: Colors.white, 
                          fontSize: 24, fontWeight: FontWeight.bold),
                        ),
                        const Icon(Icons.luggage, color: Colors.amber, size: 24),
                      ],
                    ),
                    const SizedBox(height: 4),
                     Text('Odense C', style: GoogleFonts.raleway(color: Colors.grey)),
                    Text('Alexandragade 10', style: GoogleFonts.raleway(color: Colors.white)),
                   const  Divider(color: Colors.white54),
                    Text('Odense M', style: GoogleFonts.raleway(color: Colors.grey)),
                    Text('Højstrupvej 7B', style: GoogleFonts.raleway(color: Colors.white)),
                    const SizedBox(height: 8),
                    Text('Pris med rejsekort', style: GoogleFonts.raleway(color: Colors.grey)),
                    Text('18,80 kr', style: GoogleFonts.raleway(color: Colors.white,
                     fontWeight: FontWeight.bold)),
                  ],
                ),
              ),
            ),

            const SizedBox(height: 24),

            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                   Text(
                    'Previous tickets',
                    style: GoogleFonts.raleway(
                      fontSize: 18,
                     fontWeight: FontWeight.bold),
                  ),
                  DropdownButton<String>(
                    
                    items: const [
                      DropdownMenuItem(value: 'Nyeste', child: Text('Nyeste')),
                      DropdownMenuItem(value: 'Ældste', child: Text('Ældste')),
                    ],
                    onChanged: (value) {},
                  ),
                ],
              ),
            ),

            const SizedBox(height: 8),

            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.grey[200],
                borderRadius: BorderRadius.circular(16),
              ),
              child:  Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '09:12',
                      style: GoogleFonts.raleway(color: Colors.black, 
                      fontSize: 24, 
                      fontWeight: FontWeight.bold),
                    ),
                   const  SizedBox(height: 4),
                    Text(
                      'Middelfart C - Nyborg V',
                      style: GoogleFonts.raleway(color: Colors.black87),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      'previous journey',
                      style: GoogleFonts.raleway(color: Colors.grey),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      
      bottomNavigationBar: const OneBottomnav(),
    );
  }
}
