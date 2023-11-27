import 'package:flutter/material.dart';

// ignore: must_be_immutable
class FormLoginInput extends StatefulWidget {
  String formLabel;
  TextEditingController formController;
  String hintText;
  bool obscureText;
  Icon suffixIcon;
  Function() onChangedSuffixIcon;

  FormLoginInput({
    Key? key,
    required this.formLabel,
    required this.formController,
    required this.hintText,
    required this.obscureText,
    required this.suffixIcon,
    required this.onChangedSuffixIcon(),
  }) : super(key: key);

  @override
  State<FormLoginInput> createState() => _FormLoginInputState();
}

class _FormLoginInputState extends State<FormLoginInput> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 28),
      width: double.infinity,
      child: TextFormField(
        controller: widget.formController,
        decoration: InputDecoration(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          hintText: widget.hintText,
          suffixIcon: GestureDetector(
            child: widget.suffixIcon,
            onTap: widget.onChangedSuffixIcon,
          )
        ),
        obscureText: widget.obscureText,
      ),
    );
  }
}