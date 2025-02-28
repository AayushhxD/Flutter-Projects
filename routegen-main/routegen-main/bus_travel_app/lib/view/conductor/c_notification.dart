import 'dart:developer';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:routegen/view/conductor/c_seat_layout.dart';
import 'package:routegen/view/conductor/notification_card.dart';
import 'package:routegen/view/conductor/conductor_screen1.dart';

class CNotification extends StatefulWidget {
  final String assignedBusId;
  
  const CNotification({
    super.key,
    required this.assignedBusId,
  });

  @override
  State<CNotification> createState() => _CNotificationState();
}

class _CNotificationState extends State<CNotification> {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  bool isJourneyStarted = false;
  bool isOccupancyUpdated = false;
  int _selectedStop = 0;

  @override
  void dispose() {
    // Ensure bus is unassigned if journey wasn't started
    if (!isJourneyStarted) {
      _unassignBus();
    }
    super.dispose();
  }

  Future<void> _unassignBus() async {
    try {
      await _firestore.collection('Buses').doc(widget.assignedBusId).update({
        'isAssigned': false,
        'conductorId': null,
        'lastAssignedTime': null,
      });
    } catch (e) {
      log('Error unassigning bus: ${e.toString()}');
    }
  }

  void _handleJourneyEnd() {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text(
          'End Journey',
          style: GoogleFonts.raleway(fontWeight: FontWeight.bold),
        ),
        content: Text(
          'Are you sure you want to end the journey?',
          style: GoogleFonts.raleway(),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text(
              'Cancel',
              style: GoogleFonts.raleway(color: Colors.grey),
            ),
          ),
          TextButton(
            onPressed: () async {
              try {
                // First verify if the document exists
                final docSnapshot = await _firestore
                    .collection('Buses')
                    .doc(widget.assignedBusId)
                    .get();

                if (!docSnapshot.exists) {
                  throw Exception('Bus document not found');
                }

                // Update all fields in Firestore based on the database structure
                await _firestore.collection('Buses').doc(widget.assignedBusId).update({
                  'isAssigned': false,
                  'conductorId': null,
                  'lastAssignedTime': null,
                  'lastJourneyEndTime': FieldValue.serverTimestamp(),
                  'number': docSnapshot.get('number'), // Preserve the bus number
                  'schedule': docSnapshot.get('schedule'), // Preserve the route
                  'seatCount': docSnapshot.get('seatCount'), // Preserve seat count
                  'type': docSnapshot.get('type'), // Preserve bus type
                  'features': docSnapshot.get('features'), // Preserve features array
                });

                // Reset journey state
                setState(() {
                  isJourneyStarted = false;
                  _selectedStop = 0;
                });

                // Pop the dialog
                Navigator.pop(context);

                // Show confirmation
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text(
                      'Journey ended successfully!',
                      style: GoogleFonts.raleway(),
                    ),
                    backgroundColor: Colors.green,
                  ),
                );

                // Navigate to conductor_screen1
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const ConductorScreen1(conductorId: '',),
                  ),
                );
              } catch (e, stackTrace) {
                log("Error ending journey", error: e, stackTrace: stackTrace);
                log(widget.assignedBusId);
                
                // Pop the dialog first
                Navigator.pop(context);
                
                // Show error message
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text(
                      'Error ending journey: ${e.toString()}',
                      style: GoogleFonts.raleway(),
                    ),
                    backgroundColor: Colors.red,
                  ),
                );
              }
            },
            child: Text(
              'End Journey',
              style: GoogleFonts.raleway(color: Colors.red),
            ),
          ),
        ],
      );
    },
  );
}

  // Sample list of notifications
  List<Map<String, dynamic>> notifications = List.generate(
    3,
    (index) => {
      "title": "Confirmation Call",
      "description": "If seat ${index + 2} is available grant seat to user",
      "date": DateTime.now(),
      "id": "$index-${DateTime.now().millisecondsSinceEpoch}",
    },
  );

  void _handleDismiss(DismissDirection direction, int index) {
    if (!isJourneyStarted) {
      // Show warning if journey hasn't started
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            'Please start journey and confirm occupancy first',
            style: GoogleFonts.raleway(),
          ),
          backgroundColor: Colors.orange,
        ),
      );
      return;
    }

    final notification = notifications[index];
    setState(() {
      notifications.removeAt(index);
    });

    // Show snackbar based on dismiss direction
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          direction == DismissDirection.startToEnd
              ? 'Seat confirmed'
              : 'Seat rejected',
          style: GoogleFonts.raleway(),
        ),
        backgroundColor: direction == DismissDirection.startToEnd
            ? Colors.green
            : Colors.red,
        duration: const Duration(seconds: 2),
        action: SnackBarAction(
          label: 'UNDO',
          textColor: Colors.white,
          onPressed: () {
            setState(() {
              notifications.insert(index, notification);
            });
          },
        ),
      ),
    );
  }
  

  void _handleJourneyStart() {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      isDismissible: false,
      backgroundColor: Colors.transparent,
      builder: (context) => Stack(
        children: [
          // Close button at top
          Positioned(
            top: 40,
            right: 20,
            child: GestureDetector(
              onTap: () => Navigator.pop(context),
              child: Container(
                padding: const EdgeInsets.all(8),
                decoration: const BoxDecoration(
                  color: Colors.white,
                  shape: BoxShape.circle,
                ),
                child: const Icon(Icons.close, color: Colors.black),
              ),
            ),
          ),
          // Main content
          Container(
            margin: const EdgeInsets.only(top: 80),
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const SizedBox(height: 20),
                Text(
                  'Confirm Journey Start',
                  style: GoogleFonts.raleway(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 10),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Text(
                    'Please verify seat occupancy before starting the journey. This will enable seat confirmation/rejection.',
                    textAlign: TextAlign.center,
                    style: GoogleFonts.raleway(fontSize: 14),
                  ),
                ),
                const SizedBox(height: 20),
                const ConductorsSeatLayout(), //busId: widget.assignedBusId
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Select Stop: ',
                      style: GoogleFonts.raleway(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(width: 10),
                    DropdownButton<int>(
                      value: _selectedStop,
                      items: const [
                        DropdownMenuItem(value: 0, child: Text('Stop 1')),
                        DropdownMenuItem(value: 1, child: Text('Stop 2')),
                        DropdownMenuItem(value: 2, child: Text('Stop 3')),
                        DropdownMenuItem(value: 3, child: Text('Stop 4')),
                      ],
                      onChanged: (value) {
                        setState(() {
                          _selectedStop = value ?? 0;
                        });
                      },
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 40),
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        isJourneyStarted = true;
                      });

                      // Close bottom sheet
                      Navigator.pop(context);

                      // Show confirmation
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text(
                            'Journey started! You can now manage seat requests.',
                            style: GoogleFonts.raleway(),
                          ),
                          backgroundColor: Colors.green,
                        ),
                      );
                    },
                    child: Container(
                      width: double.infinity,
                      padding: const EdgeInsets.symmetric(vertical: 15),
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        color: _selectedStop == 3
                            ? Colors.red
                            :const Color.fromRGBO(255, 136, 17, 1),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Text(
                        _selectedStop == 3 ? 'Confirm & End Journey' : 'Confirm & Start Journey',
                        style: GoogleFonts.raleway(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 30),
              ],
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    void seatOccupancySheet(context) {
      showModalBottomSheet(
        context: context,
        isScrollControlled: true,
        isDismissible: true,
        builder: (context) => const ConductorsSeatLayout(), // busId: widget.assignedBusId
      );
    }

    return Scaffold(
      body: Column(
        children: [
          Container(
            height: 329,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('asset/map_background.png'),
                fit: BoxFit.cover,
              ),
            ),
            child: Column(
              children: [
                SizedBox(
                  height: 100,
                  width: MediaQuery.of(context).size.width,
                ),
                Container(
                  height: 50,
                  width: 50,
                  margin: const EdgeInsets.only(bottom: 20),
                  alignment: Alignment.center,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: Color.fromRGBO(26, 21, 40, 1),
                  ),
                  child: Text(
                    '${notifications.length}',
                    style: GoogleFonts.raleway(
                      color: Colors.white,
                      fontSize: 14,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
                Text(
                  'New Notifications',
                  style: GoogleFonts.raleway(
                    fontSize: 25,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                const SizedBox(height: 15),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    GestureDetector(
                      onTap: () {
                        seatOccupancySheet(context);
                      },
                      child: Container(
                        alignment: Alignment.center,
                        height: 40,
                        width: 100,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: const Color.fromRGBO(255, 136, 17, 1),
                        ),
                        child: Text(
                          'Seat Layout',
                          style: GoogleFonts.raleway(
                            color: Colors.white,
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: isJourneyStarted ? _handleJourneyEnd : _handleJourneyStart,
                      child: Container(
                        alignment: Alignment.center,
                        height: 40,
                        width: 100,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: _selectedStop == 3 && isJourneyStarted
                              ? Colors.red
                              : (isJourneyStarted ? Colors.grey.withOpacity(0.5) : Colors.green),
                        ),
                        child: Text(
                          _selectedStop == 3 && isJourneyStarted ? 'End Journey' : (isJourneyStarted ? 'End Journey' : 'Start Journey'),
                          style: GoogleFonts.raleway(
                            color: Colors.black,
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                if (isJourneyStarted) ...[
                  const SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Select Stop: ',
                        style: GoogleFonts.raleway(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(width: 10),
                      DropdownButton<int>(
                        value: _selectedStop,
                        items: const [
                          DropdownMenuItem(value: 0, child: Text('Stop 1')),
                          DropdownMenuItem(value: 1, child: Text('Stop 2')),
                          DropdownMenuItem(value: 2, child: Text('Stop 3')),
                          DropdownMenuItem(value: 3, child: Text('Stop 4')),
                        ],
                        onChanged: (value) {
                          setState(() {
                            _selectedStop = value ?? 0;
                          });
                        },
                      ),
                    ],
                  ),
                ],
              ],
            ),
          ),
          Expanded(
            child: Container(
              padding: const EdgeInsets.all(15),
              color: Colors.white,
              child: ListView.builder(
                itemCount: notifications.length,
                itemBuilder: (context, index) {
                  return Dismissible(
                    key: Key(notifications[index]["id"]),
                    direction: isJourneyStarted
                        ? DismissDirection.horizontal
                        : DismissDirection.none,
                    background: Container(
                      alignment: Alignment.centerLeft,
                      padding: const EdgeInsets.only(left: 20),
                      decoration: BoxDecoration(
                        color: Colors.green,
                        borderRadius: BorderRadius.circular(24),
                      ),
                      child: Row(
                        children: [
                          const Icon(Icons.check_circle, color: Colors.white),
                          const SizedBox(width: 8),
                          Text(
                            'Confirm',
                            style: GoogleFonts.raleway(
                              color: Colors.white,
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                    secondaryBackground: Container(
                      alignment: Alignment.centerRight,
                      padding: const EdgeInsets.only(right: 20),
                      decoration: BoxDecoration(
                        color: Colors.red,
                        borderRadius: BorderRadius.circular(24),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Text(
                            'Reject',
                            style: GoogleFonts.raleway(
                              color: Colors.white,
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(width: 8),
                          const Icon(Icons.cancel, color: Colors.white),
                        ],
                      ),
                    ),
                    onDismissed: (direction) => _handleDismiss(direction, index),
                    child: NotificationCard(
                      title: notifications[index]["title"],
                      description: notifications[index]["description"],
                      date: notifications[index]["date"],
                    ),
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}