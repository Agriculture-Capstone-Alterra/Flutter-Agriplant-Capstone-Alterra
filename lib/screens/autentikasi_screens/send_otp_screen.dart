import 'package:capstone_project/providers/auth_provider.dart';
import 'package:capstone_project/widgets/autentikasi_widgets/send_otp/get_back_otp_button.dart';
import 'package:capstone_project/widgets/autentikasi_widgets/send_otp/input_otp.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
// import 'package:pin_code_fields/pin_code_fields.dart';

class SendOtpScreen extends StatefulWidget {
  const SendOtpScreen({Key? key}) : super(key: key);

  @override
  State<SendOtpScreen> createState() => _SendOtpScreenState();
}

class _SendOtpScreenState extends State<SendOtpScreen> {
  @override
  Widget build(BuildContext context) {
    return Consumer<AuthProvider>(
      builder: (context, authProvider, child) {
        return Scaffold(
          appBar: AppBar(
            leading: GestureDetector(
              child: const Icon(Icons.arrow_back_ios_new),
              onTap: () {
                authProvider.pop(context);
              },
            ),
            centerTitle: true,
            title: Text(
              'OTP',
              style: GoogleFonts.inter(
                  textStyle: const TextStyle(
                      fontSize: 16, fontWeight: FontWeight.w700)),
            ),
            backgroundColor: Colors.white,
          ),
          body: ListView(
            children: [

              const SizedBox(
                height: 14,
              ),

              InputOtp(
                massageEmail: authProvider.EmailOtpMessage,
                otpController: authProvider.otpController,
                otpFill: authProvider.otpFill,
                otpFieldColor: authProvider.otpFieldColor,
                onChanged: (value){
                  if(value.length==4){
                    authProvider.processOtp(context);
                    print(value);
                  }
                },
              ),

              const SizedBox(
                height: 72,
              ),

              GetBackOtpButton(
                textResendOtp : authProvider.textGetBackOtp,
                buttonColor : authProvider.mainColor,
                onTap: (){
                  authProvider.resendOtpProvider();
                },
              )
            ],
          ),
        );
      },
    );
  }
}