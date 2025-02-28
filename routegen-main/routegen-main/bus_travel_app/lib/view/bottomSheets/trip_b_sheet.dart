import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:routegen/model/fareCalculator.dart';
// import 'package:routegen/model/fareCalculator.dart';
import 'package:routegen/view/pooja/pay.dart';
// import 'package:routegen/model/bus_fetcher.dart';

import 'seat_layout.dart';

Widget tripSheet(context, {
  required String busTime,
  required String endLocation,
  required String startLocation,
  required Map<String, dynamic> fareData,
  required int startStopIndex,
  required int endStopIndex,
})
{
  final int ticketPrice = calculateFare(fareData, startStopIndex, endStopIndex);
  void seatSelectionSheet(context){
    showModalBottomSheet(context: context,
      isScrollControlled: true,
      isDismissible: true,
      builder: (context) => SeatLayout(
        ticketPrise: ticketPrice,
        startLocation: startLocation,
        endLocation: endLocation,
        departureTime: busTime,
        
      ),
    );
  }
  return Padding(
    padding: const EdgeInsets.all(10),
    child: Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              width: MediaQuery.of(context).size.width,
              child: Column(children: [
                Container(
                  margin: const EdgeInsets.only(top: 10, bottom: 13),
                  height: 5, width: 50,
                  decoration: BoxDecoration(
                    color: Colors.black26,
                    borderRadius: BorderRadius.circular(5),
                  ),
                ),
                Text(
                  'Your Departure',
                  style: GoogleFonts.raleway(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                  ),),
                const SizedBox(height: 5),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                  /// Data inputs here...
                  /// firebase data
                  Text(
                    busTime,
                    style: GoogleFonts.raleway(
                      fontSize: 32,
                      fontWeight: FontWeight.w700,
                    ),),
                  const SizedBox(width: 5),
                  Text(
                    'Probable delay due to traffic',
                    style: GoogleFonts.raleway(
                      color: Colors.black45,
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                      height: 4.1,
                    ),),
                  const Spacer(),

                  /// bell icon button
                  Container(
                    height: 40, width: 40,
                    decoration: BoxDecoration(
                      color: const Color.fromRGBO(255,136,17,1),
                      borderRadius: BorderRadius.circular(12),
                    ),

                    /// on tap adds reminder to notification section...
                    /// custom notification announcement with bus number with its route.

                    child: Padding(
                      padding: const EdgeInsets.all(7),
                      child: SvgPicture.asset('asset/add_reminder.svg')),
                  ),
                ],),
                const SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      startLocation,
                      style: GoogleFonts.raleway(
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                      ),),
                    Text(
                      'To',
                      style: GoogleFonts.raleway(
                        fontSize: 20,
                      ),),
                    Text(
                      endLocation, 
                      style: GoogleFonts.raleway(
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                      ),),
                ],),
                const SizedBox(height: 30),
                Row(children: [
                  GestureDetector(
                    onTap: (){
                      Navigator.of(context).pop();
                      seatSelectionSheet(context);
                    },
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      height: 55, width: 170,
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.black54, width: 0.4),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Row(children: [
                        Text(
                          'Seats Ticket',
                          style: GoogleFonts.raleway(
                            fontSize: 18,
                            fontWeight: FontWeight.bold
                          )),
                        const Spacer(),
                        const Icon(Icons.keyboard_arrow_down, size: 20,)
                      ],),
                    ),
                  ),
                  const Spacer(),
                  GestureDetector(
                    onTap: () {
                      Navigator.of(context).pushReplacement(
                        MaterialPageRoute(builder: (context)=> TicketPurchaseScreen(
                          ticketPrice: ticketPrice,
                          startLocation: startLocation,
                          endLocation: endLocation,
                          departureTime: busTime,
                        ))
                      );
                    },
                    child: Container(
                      height: 55, width: 170,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        color: const Color.fromRGBO(26,21,40,1),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Text(
                        'Buy ₹$ticketPrice',   // ......................................................................
                        style: GoogleFonts.raleway(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.w700,
                        ),),
                    ),
                  ),
                ],),
                const SizedBox(height: 70),
              ],),
            ),
      ],),
  );
}