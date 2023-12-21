import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

// ignore: must_be_immutable
class SkipAndNextButton extends StatelessWidget {
  String skipButtonText;
  String lanjutButtonText;
  Color skipButtonColor;
  Color lanjutButtonColor;
  Function() onTapSkip;
  Function() onTapLanjut;


  SkipAndNextButton({
    Key? key,
    required this.skipButtonText,
    required this.lanjutButtonText,
    required this.skipButtonColor,
    required this.lanjutButtonColor,
    required this.onTapSkip,
    required this.onTapLanjut,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Container(
        margin: EdgeInsets.only(bottom: 42),
        width: double.infinity,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            GestureDetector(
              child: Container(
                padding: EdgeInsets.symmetric(vertical: 10, horizontal: 44),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(100),
                  color: skipButtonColor,
                ),
                child: Text(
                  skipButtonText,
                  style: GoogleFonts.roboto(fontSize: 14, fontWeight: FontWeight.w500,),
                ),
              ),
              onTap: onTapSkip,
            ),

            GestureDetector(
              child: Container(
                padding: EdgeInsets.symmetric(vertical: 10, horizontal: 44),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(100),
                  color: lanjutButtonColor,
                ),
                child: Text(
                  lanjutButtonText,
                  style: GoogleFonts.roboto(fontSize: 14, fontWeight: FontWeight.w500, color: Colors.white,),
                ),
              ),
              onTap: onTapLanjut,
            ),
          ],
        ),
      ),
    );
  }
}