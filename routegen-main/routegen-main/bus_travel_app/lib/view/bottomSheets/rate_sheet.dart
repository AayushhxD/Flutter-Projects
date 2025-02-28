import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

Widget ratingBottomSheet(BuildContext context) {
  double rating = 0.0; // Initialize rating to 0

  return Padding(
    padding: EdgeInsets.only(
      bottom: MediaQuery.of(context).viewInsets.bottom,
      top: 5, left: 10, right: 10,
    ),
    child: Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        const SizedBox(
          height: 5,
          width: double.infinity,
        ),
        Container(
          margin: const EdgeInsets.only(top: 10, bottom: 15),
          height: 3,
          width: 30,
          decoration: BoxDecoration(
            color: Colors.black26,
            borderRadius: BorderRadius.circular(5),
          ),
        ),
        Text(
          'Rate Us',
          style: GoogleFonts.raleway(
            fontSize: 26,
            fontWeight: FontWeight.w700,
          ),
        ),
        const SizedBox(height: 20),
        RatingBar.builder(
          initialRating: rating,
          minRating: 1,
          direction: Axis.horizontal,
          allowHalfRating: true,
          itemCount: 5,
          itemSize: 45,
          itemPadding: const EdgeInsets.symmetric(horizontal: 5.0),
          itemBuilder: (context, _) => const Icon(
            Icons.star,
            color: Colors.amber,
            shadows: [Shadow(
              color: Color.fromARGB(255, 170, 153, 0),
              offset: Offset(0,1.5),
              blurRadius: 20,
            )]
          ),
          onRatingUpdate: (newRating) {
            rating = newRating;
          },
        ),
        const SizedBox(height: 20),
        TextField(
          maxLines: 3,
          decoration: InputDecoration(
            hintText: 'Share your experience or report a problem',
            hintStyle: GoogleFonts.raleway(),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
            ),
          ),
        ),
        const SizedBox(height: 20),
        ElevatedButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          style: ElevatedButton.styleFrom(
            minimumSize: const Size(double.infinity, 50),
            backgroundColor: const Color.fromRGBO(21,26,17,1),
          ),
          child: Text(
            'Submit Feedback',
            style: GoogleFonts.raleway(
              fontSize: 18,
              fontWeight: FontWeight.w700,
              color: Colors.blue.shade300,
            ),
          ),
        ),
        const SizedBox(height: 40),
      ],
    ),
  );
}