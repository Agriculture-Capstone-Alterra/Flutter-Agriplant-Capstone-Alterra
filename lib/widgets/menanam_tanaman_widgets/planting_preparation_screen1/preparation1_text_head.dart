import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

// ignore: must_be_immutable
class PreparationTextHead1 extends StatelessWidget {
  String plantingPreparation1TextHead;

  PreparationTextHead1({
    Key? key,
    required this.plantingPreparation1TextHead
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 15),
      width: double.infinity,
      child: Text(
        plantingPreparation1TextHead,
        style: GoogleFonts.inter(fontSize: 14, fontWeight: FontWeight.w700,),
      ),
    );
  }
}