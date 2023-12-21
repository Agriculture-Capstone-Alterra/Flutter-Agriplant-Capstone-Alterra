import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Preparation3TextHead extends StatelessWidget {
  String plantingPreparation3TextHead;

  Preparation3TextHead({
    Key? key,
    required this.plantingPreparation3TextHead
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 15),
      width: double.infinity,
      child: Text(
        plantingPreparation3TextHead,
        style: GoogleFonts.inter(fontSize: 14, fontWeight: FontWeight.w700,),
      ),
    );
  }
}