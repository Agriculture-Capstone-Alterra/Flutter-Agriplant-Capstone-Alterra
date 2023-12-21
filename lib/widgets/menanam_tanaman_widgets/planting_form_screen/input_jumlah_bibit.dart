import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

// ignore: must_be_immutable
class InputJumlahBibit extends StatefulWidget {
  TextEditingController jumlahBibitController;
  String jumlahBibitHint;
  Color jumlahBibitHintColor;
  String jumlahBibitLabel;
  Color jumlahBibitLabelColor;
  String inputBibitWarntext;
  Color textFieldColor;

  InputJumlahBibit({
    Key? key,
    required this.jumlahBibitController,
    required this.jumlahBibitHint,
    required this.jumlahBibitHintColor,
    required this.jumlahBibitLabel,
    required this.jumlahBibitLabelColor,
    required this.inputBibitWarntext,
    required this.textFieldColor,
  }) : super(key: key);

  @override
  State<InputJumlahBibit> createState() => _InputJumlahBibitState();
}

class _InputJumlahBibitState extends State<InputJumlahBibit> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          margin: EdgeInsets.symmetric(horizontal: 15),
          width: double.infinity,
          child: TextFormField(
            controller: widget.jumlahBibitController,
            decoration: InputDecoration(
              hintText: widget.jumlahBibitHint,
              hintStyle: GoogleFonts.inter(fontSize: 12, fontWeight: FontWeight.w400, color: widget.jumlahBibitHintColor),
              labelText: widget.jumlahBibitLabel,
              labelStyle: GoogleFonts.inter(fontSize: 12, fontWeight: FontWeight.w700, color: widget.jumlahBibitLabelColor),
              border: OutlineInputBorder(
                borderSide: BorderSide(color: widget.textFieldColor, width: 1),
                borderRadius: BorderRadius.circular(4),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: widget.textFieldColor, width: 1),
                borderRadius: BorderRadius.circular(4),
              ),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: widget.textFieldColor, width: 1),
                borderRadius: BorderRadius.circular(4),
              ),
            ),
          ),
        ),

        const SizedBox(height: 4,),

        Container(
          margin: EdgeInsets.symmetric(horizontal: 15),
          width: double.infinity,
          child: Text(
            widget.inputBibitWarntext,
            style: GoogleFonts.inter(fontSize: 12, fontWeight: FontWeight.w400, color: widget.textFieldColor),
          ),
        ),
      ],
    );
  }
}