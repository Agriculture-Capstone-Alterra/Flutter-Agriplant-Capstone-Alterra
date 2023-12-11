import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

// ignore: must_be_immutable
class GetBackOtpButton extends StatefulWidget {
  String textResendOtp;
  Color buttonColor;
  Function() onTap;

  GetBackOtpButton({
    Key? key,
    required this.textResendOtp,
    required this.buttonColor,
    required this.onTap,
  }) : super(key: key);

  @override
  State<GetBackOtpButton> createState() => _GetBackOtpButtonState();
}

class _GetBackOtpButtonState extends State<GetBackOtpButton> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        GestureDetector(
          child: Container(
            padding: EdgeInsets.symmetric(vertical: 12, horizontal: 16),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              color: widget.buttonColor,
            ),
            child: Center(
              child: Text(
                widget.textResendOtp,
                style: GoogleFonts.inter(
                  textStyle: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w700,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),
          onTap: widget.onTap,
        ),
      ],
    );
  }
}