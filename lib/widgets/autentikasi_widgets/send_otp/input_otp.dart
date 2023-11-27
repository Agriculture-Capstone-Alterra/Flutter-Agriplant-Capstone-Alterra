import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
// import 'package:pin_code_fields/pin_code_fields.dart';

class InputOtp extends StatefulWidget {
  String massageEmail;
  TextEditingController otpController;
  Color otpFieldColor;

  InputOtp({
    Key? key, 
    required this.massageEmail,
    required this.otpController,
    required this.otpFieldColor,
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
          // PinCodeTextField(
          //   appContext: context,
          //   length: 4,
          //   pinTheme: PinTheme(
          //     shape: PinCodeFieldShape.box,
          //     borderRadius: BorderRadius.circular(12),
          //     activeFillColor: Color(0xffC5E3D9),
          //     inactiveFillColor: Color(0xffC5E3D9),
          //     selectedFillColor: Color(0xffC5E3D9),
          //     activeColor: Color(0xffC5E3D9),
          //   ),
          //   onChanged: (valuse){},
          //   onCompleted: (value){},
          // )

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
            ),
          )
        ],
      ),
    );
  }
}