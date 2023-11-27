import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

// ignore: must_be_immutable
class Registration extends StatefulWidget {
  String question;
  String textRegist;
  Color textRegistColor;
  Function() onTap;

  Registration({
    Key? key,
    required this.question,
    required this.textRegist,
    required this.textRegistColor,
    required this.onTap,
  }) : super(key: key);

  @override
  State<Registration> createState() => _RegistrationState();
}

class _RegistrationState extends State<Registration> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          widget.question,
          style: GoogleFonts.inter(
              textStyle: const TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w700,
              )
          ),
        ),
        GestureDetector(
          child: Text(
            widget.textRegist,
            style: GoogleFonts.inter(
              textStyle: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w700,
                color: widget.textRegistColor,
              ),
            ),
          ),
          onTap: widget.onTap
        ),
      ],
    );
  }
}