import 'package:flutter/material.dart';

// ignore: must_be_immutable
class InputTanggalMenanam extends StatefulWidget {
  Color formBorderColor;
  String date;
  Function() chooseDate;

  InputTanggalMenanam({
    Key? key,
    required this.formBorderColor,
    required this.date,
    required this.chooseDate,
  }) : super(key: key);

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
        border: Border.all(color: widget.formBorderColor, width: 1,),
      ),
      child: Row(
        children: [
          Expanded(
            child: Text(widget.date),
          ),
          GestureDetector(
            child: Icon(
              Icons.calendar_today_sharp,
              color: widget.formBorderColor,
            ),
            onTap: widget.chooseDate,
          )
        ],
      ),
    );
  }
}
