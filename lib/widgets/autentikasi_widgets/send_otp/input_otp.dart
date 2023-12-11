import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
// import 'package:pin_code_fields/pin_code_fields.dart';

// ignore: must_be_immutable
class InputOtp extends StatefulWidget {
  String massageEmail;
  TextEditingController otpController;
  String otpFill;
  Color otpFieldColor;
  Function(String value) onChanged;
  // Function(String value) onChanged;
  // Functg value) onChanged;

  InputOtp({
    Key? key, 
    required this.massageEmail,
    required this.otpController,
    required this.otpFill,
    required this.otpFieldColor,
    required this.onChanged,
  }) : super(key: key);

  @override
  State<InputOtp> createState() => _InputOtpState();
}

class _InputOtpState extends State<InputOtp> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 36),
      width: double.infinity,
      child: Column(
        children: [
          Text(
            widget.massageEmail,
            style: GoogleFonts.inter(
              textStyle: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w700,
              ),
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 24,),

          Container(
            width: double.infinity,
            padding: EdgeInsets.symmetric(vertical: 8),
            decoration: BoxDecoration(
              color: widget.otpFieldColor,
              borderRadius: BorderRadius.circular(12),
            ),
            child: TextFormField(
              controller: widget.otpController,
              decoration: InputDecoration(border: InputBorder.none,),
              style: TextStyle(
                fontSize: 18,
              ),
              textAlign: TextAlign.center,
              // onChanged: (String value){
              //   if(value==4){
              //     widget.onChanged;
              //   }
              // },
              onChanged: widget.onChanged,
              // onTap: ,
            ),
          )
        ],
      ),
    );
  }
}