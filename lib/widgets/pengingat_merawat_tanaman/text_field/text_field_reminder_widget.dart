import 'package:flutter/material.dart';

class TextFieldReminderWidget extends StatefulWidget {
  const TextFieldReminderWidget({
    Key? key,
    required this.controller,
  }) : super(key: key);

  final TextEditingController controller;

  @override
  // ignore: library_private_types_in_public_api
  _TextFieldReminderWidgetState createState() =>
      _TextFieldReminderWidgetState();
}

class _TextFieldReminderWidgetState extends State<TextFieldReminderWidget> {
  
  @override
  Widget build(BuildContext context) {
   return TextField(
      controller: widget.controller,
      decoration: const InputDecoration(
        hintText: 'Input Nama Pengingat',
        labelText: 'Nama Pengingat',
        floatingLabelBehavior: FloatingLabelBehavior.always,
        border: OutlineInputBorder(
          borderSide: BorderSide(color: Color(0xFF36725D)),
        ),

        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Color(0xFF36725D)),
        ),

        labelStyle: TextStyle(
          color: Color(0xFF36725D),
        ),
      ),
    );
  }
}