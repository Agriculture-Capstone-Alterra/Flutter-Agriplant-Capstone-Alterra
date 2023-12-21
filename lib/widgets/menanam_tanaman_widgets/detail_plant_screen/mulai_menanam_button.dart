import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

// ignore: must_be_immutable
class MulaiMenanamButton extends StatelessWidget {
  String mulaiMenanamButton;
  Color menanamButtonColor;
  Function() onTap;

  MulaiMenanamButton({
    Key? key,
    required this.mulaiMenanamButton,
    required this.menanamButtonColor,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 66),
        padding: EdgeInsets.symmetric(vertical: 10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(100),
          color: menanamButtonColor,
        ),
        child: Center(
          child: Text(
            mulaiMenanamButton,
            style: GoogleFonts.roboto(
              fontSize: 14,
              fontWeight: FontWeight.w500,
              color: Colors.white
            ),
          ),
        ),
      ),
      onTap: onTap,
    );
  }
}
