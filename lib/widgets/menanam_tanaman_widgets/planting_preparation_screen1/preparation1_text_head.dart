import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

// ignore: must_be_immutable
class PreparationTextHead1 extends StatelessWidget {
  String plantingPreparationTextHead;

  PreparationTextHead1({
    Key? key,
    required this.plantingPreparationTextHead
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 15),
      width: double.infinity,
      child: Text(
        plantingPreparationTextHead,
        style: GoogleFonts.inter(fontSize: 14, fontWeight: FontWeight.w700,),
      ),
    );
  }
}
