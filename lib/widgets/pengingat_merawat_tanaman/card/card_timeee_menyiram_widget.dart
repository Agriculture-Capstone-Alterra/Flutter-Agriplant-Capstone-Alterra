import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CardTimeeeeMenyiramWidget extends StatelessWidget {
  const CardTimeeeeMenyiramWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      elevation: 7,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(5),
        side: const BorderSide(
          color: Colors.black,
          width: 1.0,
        ),
      ),
      
      child: SizedBox(
        width: 60,
        height: 30,
        child: Center(
          child: Text(
            '06.00',
            style: GoogleFonts.inter(
              fontSize: 15,
              fontWeight: FontWeight.w400,
              color: Colors.black,
            ),
          ),
        ),
      ),
    );
  }
}