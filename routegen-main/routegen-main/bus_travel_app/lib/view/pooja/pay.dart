import 'package:flutter/material.dart';
import 'package:routegen/view/common_appbar.dart';
import 'package:routegen/view/bottomnav.dart';
import './your_ticket.dart';
import "package:google_fonts/google_fonts.dart";
// import 'package:flutter_svg/flutter_svg.dart';

class TicketPurchaseScreen extends StatefulWidget {
  final int ticketPrice;
  final String startLocation;
  final String endLocation;
  final String departureTime;
  const TicketPurchaseScreen({
    super.key,
    required this.ticketPrice,
    required this.startLocation,
    required this.endLocation,
    required this.departureTime,
  });

  @override
  State createState() => _TicketPurchaseScreenState();
}

class _TicketPurchaseScreenState extends State<TicketPurchaseScreen> {
  int _selectedPaymentMethod = 0;

  Color? mainColor({double opacity = 1}) => Color.fromRGBO(255,136,17,opacity);
  final String paymentMethod = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CommonAppbar(isNotificationOpen: false),
      body: Column(
        children: [
          Container(
            height: 130,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              gradient: LinearGradient(colors: [
                mainColor(opacity: 0.4)!,
                mainColor()!,
              ],
              stops: const [0.3, 0.7],
              begin: Alignment.bottomCenter, end: Alignment.topCenter,
              ),
            ),
            child: Container(
              margin: const EdgeInsets.all(20),
              padding: const EdgeInsets.all(15),
              decoration: BoxDecoration(
                color: const Color.fromRGBO(26,21,40,1),
                borderRadius: BorderRadius.circular(20),
              ),
              child: Row(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Ticket Purchase',
                        style: GoogleFonts.raleway(
                          color: Colors.white,
                          fontSize: 22,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      Text(
                        'One-Way Ticket',
                        style: GoogleFonts.raleway(
                          color: Colors.white60,
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),

          const SizedBox(height: 20),

          Text(
            'Select Payment Method',
            style: GoogleFonts.raleway(
              fontSize: 18, 
              fontWeight: FontWeight.bold, 
              color: Colors.black
            ),
          ),
          const SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              _buildPaymentMethodChip(0, 'Pay with QR'),
              _buildPaymentMethodChip(1, 'Cash'),
              _buildPaymentMethodChip(2, 'Credit Card'),
            ],
          ),
          const SizedBox(height: 30),
          
          AnimatedContainer(
            duration: const Duration(milliseconds: 300),
            height: 200,
            width: 250,
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              image: _selectedPaymentMethod == 0 
                ? const DecorationImage(
                    image: AssetImage('asset/qr_code_payscreen.jpg'), 
                    fit: BoxFit.cover
                  )
                : null,
              color: _selectedPaymentMethod != 0 
                ? Colors.grey[200] 
                : Colors.white,
              borderRadius: BorderRadius.circular(20),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.3),
                  spreadRadius: 2,
                  blurRadius: 5,
                ),
              ],
            ),
            child: _selectedPaymentMethod != 0 
              ? Center(
                  child: Text(
                    _getPaymentMethodMessage(),
                    style: GoogleFonts.raleway(
                      fontSize: 16,
                      color: Colors.black54
                    ),
                    textAlign: TextAlign.center,
                  ),
                )
              : null,
          ),
          
          const SizedBox(height: 14),
          Text(
            'Ticket Price',
            style: GoogleFonts.raleway(
              fontSize: 18, 
              fontWeight: FontWeight.bold,
              color: Colors.black
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(5.0),
            child: Text(
              "${widget.ticketPrice}",
              style: GoogleFonts.raleway(
                fontSize: 32, 
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
          ),
          
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              'Travel guarantee included in the purchase', 
              style: GoogleFonts.raleway(
                fontSize: 16
              ),
            ),
          ),
          
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: ElevatedButton(
              onPressed: _proceedToTicketDetails,
              style: ElevatedButton.styleFrom(
                backgroundColor: mainColor(),
                minimumSize: const Size.fromHeight(50),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              child: Text(
                'Proceed to Payment',
                style: GoogleFonts.raleway(
                  color: Colors.white, 
                  fontSize: 18
                ),
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: const OneBottomnav(),
    );
  }

  Widget _buildPaymentMethodChip(int index, String label) {
    return ChoiceChip(
      label: Text(
        label, 
        style: GoogleFonts.raleway(
          fontSize: 12,
          color: _selectedPaymentMethod == index ? Colors.white : Colors.black
        ),
      ),
      selected: _selectedPaymentMethod == index,
      onSelected: (bool selected) {
        setState(() {
          _selectedPaymentMethod = index;
        });
      },
      backgroundColor: Colors.grey[200],
      selectedColor: mainColor(),
    );
  }

  String _getPaymentMethodMessage() {
    switch (_selectedPaymentMethod) {
      case 1:
        return 'Please prepare exact cash amount, pay to Conductor';
      case 2:
        return 'Credit card payment will be processed at Check-In';
      default:
        return '';
    }
  }

  void _proceedToTicketDetails() {
    // Show dialog based on selected payment method
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(
            'Confirm Payment',
            style: GoogleFonts.raleway(fontWeight: FontWeight.bold),
          ),
          content: Text(
            _getConfirmationMessage(),
            style: GoogleFonts.raleway(),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: Text(
                'Cancel',
                style: GoogleFonts.raleway(color: Colors.red),
              ),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pop();
                Navigator.of(context).pushReplacement(
                  MaterialPageRoute(builder: (context) => TicketDetailsScreen(
                    startLocation: widget.startLocation,
                    endLocation: widget.endLocation,
                    departureTime: widget.departureTime,
                    ticketPrice: widget.ticketPrice,
                    busLine: 'Line P', paymenttype: _getPaymentMethodName(),
                  )),
                );
              },
              style: ElevatedButton.styleFrom(backgroundColor: mainColor()),
              child: Text(
                'Confirm',
                style: GoogleFonts.raleway(color: Colors.white),
              ),
            ),
          ],
        );
      },
    );
  }

  String _getPaymentMethodName() {
    switch (_selectedPaymentMethod) {
      case 0:
        return 'QR Code';
      case 1:
        return 'Cash';
      case 2:
        return 'Credit Card';
      default:
        return 'Unknown';
    }
  }

  String _getConfirmationMessage() {
    switch (_selectedPaymentMethod) {
      case 0:
        return 'Proceed with QR code payment for ${widget.ticketPrice}?';
      case 1:
        return 'Confirm cash payment of ${widget.ticketPrice}?';
      case 2:
        return 'Process credit card payment for ${widget.ticketPrice}?';
      default:
        return 'Confirm payment?';
    }
  }
}