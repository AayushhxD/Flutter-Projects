import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:routegen/model/session.dart';
import 'package:routegen/view/common_appbar.dart';
import 'package:routegen/view/conductor/c_notification.dart';
import 'package:routegen/view/jaydeep/loginpage.dart';

class ConductorScreen1 extends StatefulWidget {
  final String conductorId;

  const ConductorScreen1({
    super.key,
    this.conductorId = ''
  });

  @override
  State<ConductorScreen1> createState() => _ConductorScreen1State();
}

class _ConductorScreen1State extends State<ConductorScreen1> {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  int? selectedIndex;
  List<Map<String, dynamic>> buses = [];
  bool isLoading = false;
  String? assignedBusId;

  @override
  void initState() {
    super.initState();
    _fetchBuses();
  }

  Future<void> _fetchBuses() async {
    setState(() {
      isLoading = true;
    });

    try {
      // Listen to the Buses collection
      _firestore.collection('Buses').snapshots().listen((snapshot) {
        setState(() {
          buses.clear();
          for (var doc in snapshot.docs) {
            Map<String, dynamic> data = doc.data();
            // Only add buses that aren't assigned
            if (!(data['isAssigned'] ?? false)) {
              buses.add({
                'id': doc.id,
                'number': data['number'] ?? '',
                'type': data['type'] ?? '',
                'seatCount': data['seatCount'] ?? 0,
                'schedule': data['schedule'] ?? '',
                'features': List<String>.from(data['features'] ?? []),
                'isAssigned': data['isAssigned'] ?? false,
              });
            }
          }
          isLoading = false;
        });
      });
    } catch (e) {
      setState(() {
        isLoading = false;
      });
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Error fetching buses: ${e.toString()}'),
            backgroundColor: Colors.red,
          ),
        );
      }
    }
  }

  Future<void> _assignBus(String busId) async {
    try {
      // Get the bus document
      DocumentSnapshot busDoc = await _firestore.collection('Buses').doc(busId).get();
      
      if (!busDoc.exists) {
        throw Exception('Bus not found');
      }

      Map<String, dynamic> busData = busDoc.data() as Map<String, dynamic>;
      
      if (busData['isAssigned'] == true) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('This bus has already been assigned'),
            backgroundColor: Colors.red,
          ),
        );
        return;
      }

      // Update the bus assignment status
      await _firestore.collection('Buses').doc(busId).update({
        'isAssigned': true,
        'lastAssignedTime': FieldValue.serverTimestamp(),
        'conductorId': widget.conductorId, // Replace with actual conductor ID
      });

      // Store the assigned bus ID
      assignedBusId = busId;

      // Navigate to notification screen with the bus ID
      if (mounted) {
        Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(
            builder: (context) => CNotification(assignedBusId: assignedBusId!),
          ),
          (route) => false,
        );
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Failed to assign bus: ${e.toString()}'),
            backgroundColor: Colors.red,
          ),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    // Rest of the build method remains the same
    // ignore: deprecated_member_use
    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        appBar: const CommonAppbar(isNotificationOpen: false),
        body: Stack(
          children: [
            Positioned(
              left: 15,
              top: 20,
              child: Text(
                'Select Your Vehicle/Route',
                style: GoogleFonts.raleway(
                  fontSize: 20,
                  fontWeight: FontWeight.w700,
                  color: Colors.black54,
                ),
              ),
            ),
            Positioned(
              top: 45,
              left: 15,
              child: Text(
                'Sorted by current Bus-Stop',
                style: GoogleFonts.raleway(
                  fontSize: 13,
                  color: Colors.black,
                ),
              ),
            ),
            Positioned(
              top: 70,
              child: SizedBox(
                height: 560,
                width: MediaQuery.of(context).size.width,
                child: isLoading
                    ? const Center(child: CircularProgressIndicator())
                    : buses.isEmpty
                        ? Center(
                            child: Text(
                              'No buses available',
                              style: GoogleFonts.raleway(fontSize: 16),
                            ),
                          )
                        : ListView.builder(
                            itemCount: buses.length,
                            shrinkWrap: true,
                            itemBuilder: (BuildContext context, int index) {
                              final bus = buses[index];
                              final isSelected = selectedIndex == index;
                              
                              return Column(
                                children: [
                                  GestureDetector(
                                    onTap: () {
                                      setState(() {
                                        selectedIndex = index;
                                      });
                                    },
                                    child: Container(
                                      margin: const EdgeInsets.symmetric(
                                          horizontal: 15, vertical: 5),
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 10),
                                      height: 100,
                                      decoration: BoxDecoration(
                                        color: isSelected
                                            ? const Color.fromRGBO(
                                                255, 136, 17, 0.1)
                                            : Colors.transparent,
                                        border: Border.all(
                                          width: 1.5,
                                          color: Colors.black54,
                                        ),
                                        borderRadius: BorderRadius.circular(20),
                                      ),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          Container(
                                            margin: const EdgeInsets.only(
                                                left: 20,
                                                top: 20,
                                                bottom: 20,
                                                right: 5),
                                            width: 3,
                                            decoration: BoxDecoration(
                                              color: isSelected
                                                  ? const Color.fromRGBO(
                                                      255, 136, 17, 1)
                                                  : Colors.black,
                                              borderRadius:
                                                  BorderRadius.circular(5),
                                            ),
                                          ),
                                          const SizedBox(width: 5),
                                          Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text(
                                                bus['number'],
                                                style: GoogleFonts.raleway(
                                                  color: isSelected
                                                      ? const Color.fromRGBO(
                                                          255, 136, 17, 1)
                                                      : Colors.black54,
                                                  fontSize: 25,
                                                  fontWeight: FontWeight.w800,
                                                ),
                                              ),
                                              Text(
                                                'Type: ${bus['type']} | Seats: ${bus['seatCount']}',
                                                style: GoogleFonts.raleway(
                                                  fontSize: 12,
                                                  color: Colors.black,
                                                ),
                                              ),
                                              Text(
                                                'Features: ${bus['features'].join(", ")}',
                                                style: GoogleFonts.raleway(
                                                  fontSize: 10,
                                                  fontWeight: FontWeight.w600,
                                                ),
                                              ),
                                            ],
                                          ),
                                          const Spacer(),
                                          Container(
                                            margin: const EdgeInsets.only(
                                                right: 20),
                                            padding: const EdgeInsets.all(10),
                                            height: 50,
                                            width: 50,
                                            decoration: BoxDecoration(
                                              border: Border.all(
                                                width: 2,
                                                color: isSelected
                                                    ? const Color.fromRGBO(
                                                        255, 136, 17, 1)
                                                    : Colors.green,
                                              ),
                                              shape: BoxShape.circle,
                                            ),
                                            child: SvgPicture.asset(
                                              'asset/bus_icon.svg',
                                              fit: BoxFit.cover,
                                              colorFilter: ColorFilter.mode(
                                                isSelected
                                                    ? const Color.fromRGBO(
                                                        255, 136, 17, 1)
                                                    : Colors.black,
                                                BlendMode.srcIn,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              );
                            },
                          ),
              ),
            ),
            Positioned(
              bottom: 30,
              left: 90,
              child: ElevatedButton(
                style: ButtonStyle(
                  side: const WidgetStatePropertyAll(
                      BorderSide(width: 2, color: Colors.black54)),
                  backgroundColor: WidgetStateProperty.resolveWith<Color>(
                    (Set<WidgetState> states) {
                      if (selectedIndex == null) {
                        return Colors.grey;
                      }
                      return const Color.fromRGBO(255, 136, 17, 1);
                    },
                  ),
                  padding: const WidgetStatePropertyAll(EdgeInsets.all(15)),
                ),
                onPressed: selectedIndex == null
                    ? null
                    : () => _assignBus(buses[selectedIndex!]['id']),
                child: Text(
                  'Confirm Route Selection',
                  style: GoogleFonts.raleway(
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ],
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: (){
            SessionData.isLogin = false;
            Navigator.of(context).pushAndRemoveUntil(
              MaterialPageRoute(builder:(context) => const Loginpage()),
              (Route<dynamic> route)=> false,
            );
          },
          backgroundColor: Colors.white,
          child: Icon(Icons.logout_rounded, color: Colors.red.shade600, size: 30),
        ),
      ),
    );
  }
}