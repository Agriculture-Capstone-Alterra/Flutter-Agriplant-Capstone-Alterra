import 'package:flutter/material.dart';

// ignore: must_be_immutable
class RegistButton extends StatefulWidget {
  String textRegistButton;
  Color buttonColor;
  Function() onTap;

  RegistButton({
    Key? key,
    required this.textRegistButton,
    required this.buttonColor,
    required this.onTap,
  }) : super(key: key);

  @override
  State<RegistButton> createState() => _RegistButtonState();
}

class _RegistButtonState extends State<RegistButton> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 28),
        padding: const EdgeInsets.symmetric(vertical: 12),
        width: double.infinity,
        decoration: BoxDecoration(
          borderRadius:BorderRadius.circular(16),
          color: widget.buttonColor,
        ),
        child: Center(
          child: Text(
            widget.textRegistButton,
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
