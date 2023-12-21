import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

// ignore: must_be_immutable
class ButtonInputForm extends StatelessWidget {
  Color menanamButtonColor;
  String menanamButtonText;
  Function() onTap;

  ButtonInputForm({
    Key? key,
    required this.menanamButtonColor,
    required this.menanamButtonText,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: GestureDetector(
        child: Container(
          padding: EdgeInsets.symmetric(vertical: 10),
          width: MediaQuery.of(context).size.width/2,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(100),
            color: menanamButtonColor,
          ),
          child: Center(
            child: Text(
              menanamButtonText, style: GoogleFonts.roboto(fontSize: 14, fontWeight: FontWeight.w500, color: Colors.white),
            ),
          ),
        ),
        onTap: onTap,
      ),
    );
  }
}
