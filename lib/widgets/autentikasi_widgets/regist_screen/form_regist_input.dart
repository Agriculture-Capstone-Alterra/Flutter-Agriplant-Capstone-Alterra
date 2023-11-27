import 'package:flutter/material.dart';

// ignore: must_be_immutable
class FormRegistInput extends StatefulWidget {
  String formLabel;
  TextEditingController formController;
  String hintText;
  bool obscureText;
  Icon suffixIcon;
  Function() onChangedSuffixIcon;

  FormRegistInput({
    Key? key,
    required this.formLabel,
    required this.formController,
    required this.hintText,
    required this.obscureText,
    required this.suffixIcon,
    required this.onChangedSuffixIcon,
  }) : super(key: key);

  @override
  State<FormRegistInput> createState() => _FormRegistInputState();
}

class _FormRegistInputState extends State<FormRegistInput> {
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
          ),
        ),
        obscureText: widget.obscureText,
      ),
    );
  }
}
