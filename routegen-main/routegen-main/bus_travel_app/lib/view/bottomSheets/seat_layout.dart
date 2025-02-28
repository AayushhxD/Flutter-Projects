import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:routegen/view/pooja/pay.dart';

class SeatLayout extends StatefulWidget {
  final int ticketPrise;
  final String startLocation;
  final String endLocation;
  final String departureTime;
  const SeatLayout({
    super.key,
    required this.ticketPrise,
    required this.startLocation,
    required this.endLocation,
    required this.departureTime,
  });

  @override
  State<SeatLayout> createState() => _SeatLayoutState();
}

class _SeatLayoutState extends State<SeatLayout> {

  final List<int> items = List.generate(14, (index) => index + 1);
  // Map to store selected seats with their values
  final Map<String, int> selectedSeats = {};

  // Map to store booked seats (predefined)
  final Map<String, int> bookedSeats = {
    '1_2': 2,    // Seat 2 in column 1
    '1_5': 5,    // Seat 5 in column 1
    '2_3': 6,    // Seat 3 in column 2
    '2_8': 16,   // Seat 8 in column 2
    '2_7': 14,   // Seat 7 in column 2
    '1_12': 12,  // Seat 12 in column 1
  };


  @override
  Widget build(BuildContext context) {
    final int charges = ((widget.ticketPrise)*(selectedSeats.length)+15);

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 70, vertical: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            margin: const EdgeInsets.only(bottom: 10),
            height: 5, width: 60,
            decoration: BoxDecoration(
              color: Colors.grey,
              borderRadius: BorderRadius.circular(5),
            ),
          ),
          // Legend for seat status
          Row(
            children: [
              _buildLegendItem('Available', Colors.white),
              const SizedBox(width: 20),
              _buildLegendItem('Booked', Colors.grey),
            ],
          ),
          const SizedBox(height: 5),
          _buildLegendItem('Selected', Colors.green),
          // const SizedBox(height: 20),
          const Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Icon(Icons.circle_outlined),
            ],
          ),
          Container(
            margin: const EdgeInsets.symmetric(vertical: 5),
            height: 1,
            color: Colors.black54,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal:25),
            child: Row(
              children: [
                SizedBox(
                  height: 350,
                  width: 90,
                  child: buildSeatColumn(items, 1),
                ),
                const Spacer(),
                SizedBox(
                  height: 350,
                  width: 90,
                  child: buildSeatColumn(items, 2),
                ),
              ],
            ),
          ),
          const SizedBox(height: 20),
          GestureDetector(
            onTap: () {
              log('Selected Seats Count: ${selectedSeats.length}');
              log('Selected Seats: $selectedSeats');
            },
            child: Column(
              children: [
                Text(
                  'Selected Seats: ${selectedSeats.length}',
                  style: GoogleFonts.raleway(fontSize: 14),
                ),
                const SizedBox(height: 8),
                Text(
                  'Seat Numbers: ${selectedSeats.entries.map((e) => e.value).toList()..sort()..join(", ")}',
                  style: GoogleFonts.raleway(fontSize: 12),
                ),
              ],
            ),
          ),
          
          GestureDetector(
            onTap: (){
              Navigator.of(context).pushReplacement(
                MaterialPageRoute(builder: (context)=> TicketPurchaseScreen(
                  ticketPrice: charges,
                  startLocation: widget.startLocation,
                  endLocation: widget.endLocation,
                  departureTime: widget.departureTime,    
                )),
              );
            },
            child: Container(
              padding: const EdgeInsets.all(5),
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: const Color.fromRGBO(26,21,40,1),
                borderRadius: BorderRadius.circular(30),
              ),
              child: Text(
                '₹$charges',
                style: GoogleFonts.raleway(
                  fontWeight: FontWeight.w700,
                  color: Colors.white,
                  fontSize: 30,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildLegendItem(String label, Color color) {
    return Row(
      children: [
        Container(
          width: 25,
          height: 25,
          decoration: BoxDecoration(
            color: color,
            border: Border.all(color: Colors.black54),
            borderRadius: BorderRadius.circular(4),
          ),
        ),
        const SizedBox(width: 4),
        Text(label, style: GoogleFonts.raleway(fontSize: 16, fontWeight: FontWeight.w600)),
      ],
    );
  }

  Widget buildSeatColumn(List<int> itemList, int columnNumber) {
    ScrollController columnController = ScrollController();

    return GridView.builder(
      controller: columnController,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
      ),
      itemCount: itemList.length,
      itemBuilder: (context, index) {
        String seatKey = '${columnNumber}_${itemList[index]}';
        int seatNumber = itemList[index] * columnNumber;
        bool isBooked = bookedSeats.containsKey(seatKey);
        
        return GestureDetector(
          onTap: isBooked 
              ? null  // Disable tap for booked seats
              : () {
                  setState(() {
                    if (selectedSeats.containsKey(seatKey)) {
                      selectedSeats.remove(seatKey);
                    } else {
                      selectedSeats[seatKey] = seatNumber;
                    }
                  });
                },
          child: Container(
            alignment: Alignment.center,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: isBooked 
                  ? Colors.grey : selectedSeats.containsKey(seatKey) ? Colors.green : Colors.white,  // Available seats are white
              border: Border.all(
                width: 1, 
                color: isBooked ? Colors.grey.shade600 : Colors.black54,
              ),
            ),
            child: Text(
              '$seatNumber',
              style: GoogleFonts.raleway(
                fontSize: 12,
                fontWeight: FontWeight.w800,
                color: isBooked ? Colors.white : selectedSeats.containsKey(seatKey) ? Colors.white : Colors.black,
              ),
            ),
          ),
        );
      },
    );
  }
}