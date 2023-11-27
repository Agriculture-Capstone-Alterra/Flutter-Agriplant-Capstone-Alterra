import 'package:flutter/material.dart';

// ignore: must_be_immutable
class LoginButton extends StatefulWidget {
  String textLoginButton;
  Color buttonColor;
  Function() onTap;

  LoginButton({
    Key? key,
    required this.textLoginButton,
    required this.buttonColor,
    required this.onTap,
  }) : super(key: key);

  @override
  State<LoginButton> createState() => _LoginButtonState();
}

class _LoginButtonState extends State<LoginButton> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container(
        width: double.infinity,
        margin: const EdgeInsets.symmetric(horizontal: 28),
        padding: const EdgeInsets.symmetric(vertical: 12),
        decoration: BoxDecoration(
          color: widget.buttonColor,
          borderRadius: BorderRadius.circular(16),
        ),
        child: Center(
          child: Text(
            widget.textLoginButton,
            style: TextStyle(
              fontSize: 17,
              fontWeight: FontWeight.w700,
              color: Colors.white,
            ),
          ),
        ),
      ),
      onTap: widget.onTap,
    );
  }
}
