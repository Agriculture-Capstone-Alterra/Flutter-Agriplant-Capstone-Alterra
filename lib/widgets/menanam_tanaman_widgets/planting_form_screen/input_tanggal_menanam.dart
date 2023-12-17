import 'package:flutter/material.dart';

class InputTanggalMenanam extends StatefulWidget {
  const InputTanggalMenanam({Key? key}) : super(key: key);

  @override
  State<InputTanggalMenanam> createState() => _InputTanggalMenanamState();
}

class _InputTanggalMenanamState extends State<InputTanggalMenanam> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 15),
      padding: EdgeInsets.symmetric(vertical: 12, horizontal: 16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(4),
        border: Border.all(color: Colors.black),
      ),
      child: Row(
        children: [
          Expanded(
            child: Text('DateTime.noww'),
          ),
          Icon(Icons.calendar_today_sharp)
        ],
      ),
    );
  }
}
