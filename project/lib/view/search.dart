import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:project/view/home_Page_UI.dart';

class Search extends StatefulWidget {
  const Search({super.key});

  @override
  State<Search> createState() => _SearchState();
}

class _SearchState extends State<Search> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: GestureDetector(
          onTap: () {
            Navigator.of(context).pop(MaterialPageRoute(builder: (context) {
              return const home_Page();
            }));
          },
          child: const Icon(
            Icons.arrow_back_ios,
            size: 35,
            color: Colors.white,
          ),
        ),
        toolbarHeight: 80.0,
        flexibleSpace: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.centerLeft, // Start from the left
              end: Alignment.centerRight, // End at the right
              colors: [
                Color.fromRGBO(6, 40, 30, 1),
                Color.fromRGBO(12, 81, 61, 1),
              ],
            ),
          ),
        ),
        title: Text(
          "Search ",
          style: GoogleFonts.quicksand(
            fontSize: 27,
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),
      body: ListView(
        children: [],
      ),
    );
  }
}
