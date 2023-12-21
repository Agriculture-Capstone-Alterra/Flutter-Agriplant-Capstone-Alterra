import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

// ignore: must_be_immutable
class FormHead extends StatelessWidget {
  String formTextHead;

  FormHead({
    Key? key,
    required this.formTextHead
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 15),
      width: double.infinity,
      child: Text(formTextHead, style: GoogleFonts.inter(fontSize: 12, fontWeight: FontWeight.w700),),
    );
  }
}