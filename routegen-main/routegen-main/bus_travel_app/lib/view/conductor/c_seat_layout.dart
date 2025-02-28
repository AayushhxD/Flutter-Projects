import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

// Create a class to manage bus occupancy state
class BusOccupancyState extends ChangeNotifier {
  static final BusOccupancyState _instance = BusOccupancyState._internal();

  factory BusOccupancyState() {
    return _instance;
  }

  BusOccupancyState._internal();

  // Map to store all booked seats
  final Map<String, int> bookedSeats = {
    '1_2': 2,
    '1_5': 5,
    '2_3': 6,
    '2_8': 16,
    '2_7': 14,
    '1_12': 12,
    '2_14': 28,
  };

  void updateBookedSeats(Map<String, int> newSeats) {
    bookedSeats.addAll(newSeats);
    notifyListeners();
  }
}

class ConductorsSeatLayout extends StatefulWidget {
  const ConductorsSeatLayout({super.key});

  @override
  State<ConductorsSeatLayout> createState() => _CSeatLayoutState();
}

class _CSeatLayoutState extends State<ConductorsSeatLayout> {
  final List<int> items = List.generate(14, (index) => index + 1);
  final Map<String, int> selectedSeats = {};
  final BusOccupancyState busState = BusOccupancyState();

  void _updateOccupancy() {
    if (selectedSeats.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            'Please mark at least one occupied seat',
            style: GoogleFonts.raleway(),
          ),
          backgroundColor: Colors.orange,
        ),
      );
    }

    // Log seat updates for debugging
    log('Previous booked seats: ${busState.bookedSeats}');
    log('New seats to be added: $selectedSeats');

    // Update live occupancy using the singleton state manager
    busState.updateBookedSeats(Map.from(selectedSeats));
    
    setState(() {
      selectedSeats.clear();
    });

    // Log updated seats for verification
    log('Updated booked seats: ${busState.bookedSeats}');

    // Show confirmation with count of newly added seats
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          'Updated occupancy: ${busState.bookedSeats.length} seats now occupied',
          style: GoogleFonts.raleway(),
        ),
        backgroundColor: Colors.green,
      ),
    );

    Navigator.pop(context);
  }

  // Function to show bottom sheet
  static void showSeatLayout(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.white,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (context) => const ConductorsSeatLayout(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 80, vertical: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Live Bus Occupancy',
                style: GoogleFonts.raleway(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const Icon(Icons.directions_bus_outlined),
            ],
          ),
          
          Container(
            margin: const EdgeInsets.symmetric(vertical: 5),
            height: 1,
            color: Colors.black54,
          ),
          Row(
            children: [
              SizedBox(
                height: 270,
                width: 70,
                child: buildSeatColumn(items, 1),
              ),
              const Spacer(),
              SizedBox(
                height: 270,
                width: 70,
                child: buildSeatColumn(items, 2),
              ),
            ],
          ),
          const SizedBox(height: 20),
          GestureDetector(
            onTap: () {
              log('Currently marking ${selectedSeats.length} seats');
              log('Selected seats: ${selectedSeats.entries.map((e) => e.value).toList()..sort()}');
            },
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      '${busState.bookedSeats.length} Occupied',
                      style: GoogleFonts.raleway(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        color: Colors.red,
                      ),
                    ),
                    Text(
                      ' / ${items.length * 2} Total',
                      style: GoogleFonts.raleway(fontSize: 14),
                    ),
                  ],
                ),
                const SizedBox(height: 8),
                if (selectedSeats.isNotEmpty) Text(
                  'Marking Seats: ${selectedSeats.entries.map((e) => e.value).toList()..sort()..join(", ")}',
                  style: GoogleFonts.raleway(
                    fontSize: 12,
                    color: Colors.green,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 20),
          GestureDetector(
            onTap: _updateOccupancy,
            child: Container(
              padding: const EdgeInsets.all(10),
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: selectedSeats.isEmpty 
                    ? Colors.grey 
                    : const Color.fromRGBO(26, 21, 40, 1),
                borderRadius: BorderRadius.circular(20),
              ),
              child: Text(
                'Update Live Occupancy',
                style: GoogleFonts.raleway(
                  fontWeight: FontWeight.w700,
                  color: Colors.white,
                  fontSize: 15,
                ),
              ),
            ),
          ),
        ],
      ),
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
        bool isBooked = busState.bookedSeats.containsKey(seatKey);
        
        return GestureDetector(
          onTap: isBooked 
              ? null
              : () {
                  setState(() {
                    if (selectedSeats.containsKey(seatKey)) {
                      selectedSeats.remove(seatKey);
                    } else {
                      selectedSeats[seatKey] = seatNumber;
                    }
                    // Log current selection state
                    log('Seat $seatNumber ${selectedSeats.containsKey(seatKey) ? 'selected' : 'unselected'}');
                    log('Current selections: $selectedSeats');
                  });
                },
          child: Container(
            alignment: Alignment.center,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: isBooked 
                  ? Colors.grey 
                  : selectedSeats.containsKey(seatKey) 
                      ? Colors.green 
                      : Colors.white,
              border: Border.all(
                width: 1, 
                color: isBooked ? Colors.grey.shade600 : Colors.black54,
              ),
            ),
            child: Text(
              '$seatNumber',
              style: GoogleFonts.raleway(
                fontSize: 12,
                color: isBooked || selectedSeats.containsKey(seatKey) 
                    ? Colors.white 
                    : Colors.black,
              ),
            ),
          ),
        );
      },
    );
  }
}