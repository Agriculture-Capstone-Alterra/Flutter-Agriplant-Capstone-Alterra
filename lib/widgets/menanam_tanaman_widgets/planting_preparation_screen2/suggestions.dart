import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

// ignore: must_be_immutable
class Suggestions extends StatelessWidget {
  String textHead;
  String textBody;

  Suggestions({
    Key? key,
    required this.textHead,
    required this.textBody,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            textHead,
            style: GoogleFonts.inter(fontSize: 20, fontWeight: FontWeight.w700),
          ),

          const SizedBox(height: 10,),

          Text(
            textBody,
            style: GoogleFonts.inter(fontSize: 10, fontWeight: FontWeight.w500),
          ),
        ],
      ),
    );
  }
}