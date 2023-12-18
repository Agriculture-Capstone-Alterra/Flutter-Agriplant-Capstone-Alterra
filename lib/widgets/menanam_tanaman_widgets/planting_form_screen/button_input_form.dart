import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ButtonInputForm extends StatelessWidget {
  Color menanamButtonColor;
  ButtonInputForm({
    Key? key,
    required this.menanamButtonColor
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 10),
        width: MediaQuery.of(context).size.width/2,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(100),
          color: menanamButtonColor,
        ),
        child: Center(
          child: Text(
            'Tanam', style: GoogleFonts.roboto(fontSize: 14, fontWeight: FontWeight.w500, color: Colors.white),
          ),
        ),
      ),
    );
  }
}
