import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:travel_app/app_styles.dart';

class BookingScreen extends StatefulWidget {
  const BookingScreen({super.key});

  @override
  State<BookingScreen> createState() => _BookingScreenState();
}

class _BookingScreenState extends State<BookingScreen> {
  DateTime selectedDate = DateTime.now();
  TimeOfDay selectedTime = TimeOfDay.now();
  int numberOfAdults = 1;
  int numberOfChildren = 0;
  double discount = 0.0;
  String selectedPackage = 'Standard';
  bool isCouponApplied = false;
  List<String> packages = ['Standard', 'Premium', 'Deluxe'];
  TextEditingController couponController = TextEditingController();
  final Map<String, double> packagePrices = {
    'Standard': 59.0,
    'Premium': 79.0,
    'Deluxe': 99.0,
  };

  void _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: DateTime.now(),
      lastDate: DateTime(2025),
    );
    if (picked != null && picked != selectedDate) {
      setState(() {
        selectedDate = picked;
      });
    }
  }

  void _selectTime(BuildContext context) async {
    final TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime: selectedTime,
    );
    if (picked != null && picked != selectedTime) {
      setState(() {
        selectedTime = picked;
      });
    }
  }

  void _applyCoupon() {
    if (couponController.text == 'SAVE10') {
      setState(() {
        discount = 0.1;
        isCouponApplied = true;
      });
      _showCouponDialog(
          'Coupon Applied Successfully!', 'You received a 10% discount.');
    } else {
      setState(() {
        discount = 0.0;
        isCouponApplied = false;
      });
      _showCouponDialog(
          'Invalid Coupon', 'Please try again with a valid coupon code.');
    }
  }

  void _showCouponDialog(String title, String message) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(title,
              style: AppStyles.textStyle(fontWeight: FontWeight.bold)),
          content: Text(message, style: AppStyles.textStyle()),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text("OK", style: AppStyles.textStyle()),
            ),
          ],
        );
      },
    );
  }

  void _confirmBooking() {
    double basePrice = packagePrices[selectedPackage]!;
    double totalPrice = (basePrice * numberOfAdults) +
        (basePrice * numberOfChildren * 0.5); // Children pay half price
    double discountAmount = totalPrice * discount;
    double finalPrice = totalPrice - discountAmount;
    double tax = finalPrice * 0.1;
    double totalPriceWithTax = finalPrice + tax;

    // Show the receipt dialog first
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Center(
            child: Text(
              "Price Receipt",
              style: GoogleFonts.poppins(
                fontWeight: FontWeight.bold,
                color: const Color.fromRGBO(13, 110, 253, 1),
              ),
            ),
          ),
          content: _buildReceipt(totalPriceWithTax, discountAmount, tax),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); // Close receipt dialog
                _showBookingConfirmedDialog(); // Show booking confirmation dialog
              },
              child: Text("OK", style: GoogleFonts.poppins()),
            ),
          ],
        );
      },
    );
  }

  void _showBookingConfirmedDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Center(
            child: Text(
              "Booking Confirmed!",
              style: GoogleFonts.poppins(
                fontWeight: FontWeight.bold,
                color: const Color.fromRGBO(13, 110, 253, 1),
              ),
            ),
          ),
          content: Text(
            "Thank you for your booking!",
            style: GoogleFonts.poppins(),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text("OK", style: GoogleFonts.poppins()),
            ),
          ],
        );
      },
    );
  }

  Widget _buildReceipt(
      double totalPrice, double discountAmount, double taxAmount) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        const Divider(),
        _buildReceiptRow(
            "Booking Date", "${selectedDate.toLocal()}".split(' ')[0]),
        _buildReceiptRow("Booking Time", selectedTime.format(context)),
        const Divider(),
        _buildReceiptRow("Number of Adults", "$numberOfAdults"),
        _buildReceiptRow("Number of Children", "$numberOfChildren"),
        const Divider(),
        _buildReceiptRow("Package", selectedPackage),
        _buildReceiptRow("Price per Person",
            "\$${packagePrices[selectedPackage]!.toStringAsFixed(2)}"),
        const Divider(),
        if (isCouponApplied)
          _buildReceiptRow(
              "Discount", "-\$${discountAmount.toStringAsFixed(2)}"),
        _buildReceiptRow("Tax (10%)", "\$${taxAmount.toStringAsFixed(2)}"),
        const Divider(),
        _buildReceiptRow("Total Price", "\$${totalPrice.toStringAsFixed(2)}",
            isBold: true),
      ],
    );
  }

  Widget _buildReceiptRow(String label, String value, {bool isBold = false}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(label,
              style: GoogleFonts.poppins(
                  fontSize: 16,
                  fontWeight: isBold ? FontWeight.w600 : FontWeight.normal)),
          Text(value,
              style: GoogleFonts.poppins(
                  fontSize: 16,
                  fontWeight: isBold ? FontWeight.w600 : FontWeight.normal)),
        ],
      ),
    );
  }

  Widget _buildPersonCounter(
      String title, int count, ValueChanged<int> onChanged) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: GoogleFonts.poppins(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: Colors.white, // Changed text color to white
          ),
        ),
        Row(
          children: [
            IconButton(
              icon: Icon(
                Icons.remove,
                color: count > 0
                    ? Colors.red
                    : Colors.white, // White when disabled
              ),
              onPressed: count > 0 ? () => onChanged(count - 1) : null,
            ),
            Text(
              '$count',
              style: GoogleFonts.poppins(
                fontSize: 16,
                color: Colors.white, // Changed count number color to white
              ),
            ),
            IconButton(
              icon: const Icon(Icons.add, color: Colors.white), // White color
              onPressed: () => onChanged(count + 1),
            ),
          ],
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage(
                    'assets/7f47f9144194941 1.png'), // Add your image path here
                fit: BoxFit.cover,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Book Your Travel Package',
                    style: GoogleFonts.poppins(
                        fontSize: 24,
                        color: Colors.white,
                        fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 20),
                  _buildCard(
                    icon: Icons.calendar_today,
                    title: 'Select Date',
                    subtitle: "${selectedDate.toLocal()}".split(' ')[0],
                    onPressed: () => _selectDate(context),
                  ),
                  const SizedBox(height: 20),
                  _buildCard(
                    icon: Icons.access_time,
                    title: 'Select Time',
                    subtitle: "${selectedTime.format(context)}",
                    onPressed: () => _selectTime(context),
                  ),
                  const SizedBox(height: 20),
                  _buildDropdownCard(),
                  const SizedBox(height: 20),
                  _buildPersonCounter('Number of Adults', numberOfAdults,
                      (value) {
                    setState(() {
                      numberOfAdults = value;
                    });
                  }),
                  const SizedBox(height: 10),
                  _buildPersonCounter('Number of Children', numberOfChildren,
                      (value) {
                    setState(() {
                      numberOfChildren = value;
                    });
                  }),
                  const SizedBox(height: 20),
                  _buildCouponField(),
                  const SizedBox(height: 30),
                  ElevatedButton(
                    onPressed: _confirmBooking,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blueAccent,
                      padding: const EdgeInsets.symmetric(
                          vertical: 12.0, horizontal: 24.0),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                    ),
                    child: Text(
                      'Confirm Booking',
                      style: GoogleFonts.poppins(
                        fontSize: 18,
                        fontWeight: FontWeight.w400,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCouponField() {
    return Row(
      children: [
        Expanded(
          child: TextField(
            controller: couponController,
            decoration: InputDecoration(
              hintText: 'Enter coupon code',
              filled: true,
              fillColor: Colors.white.withOpacity(0.8),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
            ),
          ),
        ),
        const SizedBox(width: 10),
        ElevatedButton(
          onPressed: _applyCoupon,
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.green,
            padding:
                const EdgeInsets.symmetric(vertical: 12.0, horizontal: 16.0),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.0),
            ),
          ),
          child: Text(
            'Apply',
            style: GoogleFonts.poppins(
              fontSize: 16,
              fontWeight: FontWeight.w400,
              color: Colors.white,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildCard(
      {required IconData icon,
      required String title,
      required String subtitle,
      required VoidCallback onPressed}) {
    return Card(
      color: Colors.white.withOpacity(0.8),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: ListTile(
        leading: Icon(icon, color: Colors.blueAccent),
        title: Text(
          title,
          style: GoogleFonts.poppins(fontSize: 16, fontWeight: FontWeight.bold),
        ),
        subtitle: Text(
          subtitle,
          style: GoogleFonts.poppins(),
        ),
        trailing: const Icon(Icons.arrow_forward_ios, color: Colors.blueAccent),
        onTap: onPressed,
      ),
    );
  }

  Widget _buildDropdownCard() {
    return Card(
      color: Colors.white.withOpacity(0.8),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: ListTile(
        leading: const Icon(Icons.card_travel, color: Colors.blueAccent),
        title: Text(
          'Select Package',
          style: GoogleFonts.poppins(fontSize: 16, fontWeight: FontWeight.bold),
        ),
        subtitle: DropdownButton<String>(
          value: selectedPackage,
          isExpanded: true,
          items: packages.map((String value) {
            return DropdownMenuItem<String>(
              value: value,
              child: Text(value, style: GoogleFonts.poppins()),
            );
          }).toList(),
          onChanged: (String? newValue) {
            setState(() {
              selectedPackage = newValue!;
            });
          },
        ),
        trailing: const Icon(Icons.arrow_forward_ios, color: Colors.blueAccent),
      ),
    );
  }
}
