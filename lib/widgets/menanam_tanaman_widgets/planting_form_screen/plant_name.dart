import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

// ignore: must_be_immutable
class PlantName extends StatelessWidget {
  String plantName;

  PlantName({
    Key? key,
    required this.plantName
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 15),
      width: double.infinity,
      child: Text(
        plantName,
        style: GoogleFonts.inter(fontSize: 24, fontWeight: FontWeight.w800),
      ),
    );
  }
}
