import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class InputJumlahBibit extends StatefulWidget {
  TextEditingController jumlahBibitController;
  String jumlahBibitHint;
  String jumlahBibitLabel;

  InputJumlahBibit({
    Key? key,
    required this.jumlahBibitController,
    required this.jumlahBibitHint,
    required this.jumlahBibitLabel,
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
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(4),
            border: Border.all(color: Color(0xff6EB99F), width: 1),
          ),
          width: double.infinity,
          child: TextFormField(
            controller: widget.jumlahBibitController,
            decoration: InputDecoration(
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(4),
                // borderSide: BorderSide(color: Color(0xff6EB99F), width: 1),
              ),
              focusColor: Color(0xff6EB99F),
              focusedBorder: OutlineInputBorder(
                // borderSide: BorderSide(color: Color(0xff6EB99F), width: 1),
                borderRadius: BorderRadius.circular(4),
              ),
              hintText: widget.jumlahBibitHint,
              labelText: widget.jumlahBibitLabel,
              labelStyle: GoogleFonts.inter(fontSize: 12, fontWeight: FontWeight.w700, color: Color(0xff6EB99F)),
            ),
          ),
        ),

        const SizedBox(height: 4,),

        Text('Masukan jumlah bibit yang akan ditanam',),
      ],
    );
  }
}