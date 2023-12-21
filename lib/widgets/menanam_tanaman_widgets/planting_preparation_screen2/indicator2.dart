import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

// ignore: must_be_immutable
class Indicator2 extends StatelessWidget {
  String indicatorNumber1;
  String indicatorNumber2;
  String indicatorNumber3;
  String indicatorNumber4;
  String indicatorNumber5;
  String indicatorNumber2Text;
  Color textColor;
  Color indicatorBlockColor;

  Indicator2({
    Key? key,
    required this.indicatorNumber1,
    required this.indicatorNumber2,
    required this.indicatorNumber3,
    required this.indicatorNumber4,
    required this.indicatorNumber5,
    required this.indicatorNumber2Text,
    required this.textColor,
    required this.indicatorBlockColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 34,),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: EdgeInsets.symmetric(vertical: 8, horizontal: 12),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: indicatorBlockColor,
              border: Border.all(color: indicatorBlockColor, width: 2),
            ),
            child: Text(
              indicatorNumber1,
              style: GoogleFonts.inter(fontSize: 12, fontWeight: FontWeight.w700, color: Colors.white),
            ),
          ),

          Column(
            children: [
              Container(
                padding: EdgeInsets.symmetric(vertical: 8, horizontal: 12),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(color: textColor, width: 2),
                ),
                child: Text(
                  indicatorNumber2,
                  style: GoogleFonts.inter(fontSize: 12, fontWeight: FontWeight.w700, color: textColor,),
                ),
              ),
              const SizedBox(height: 11,),
              Text(
                indicatorNumber2Text,
                style: GoogleFonts.inter(fontSize: 12, fontWeight: FontWeight.w600, color: textColor),
              )
            ],
          ),

          Container(
            padding: EdgeInsets.symmetric(vertical: 8, horizontal: 12),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(color: textColor, width: 2),
            ),
            child: Text(
              indicatorNumber3,
              style: GoogleFonts.inter(fontSize: 12, fontWeight: FontWeight.w700, color: textColor,),
            ),
          ),

          Container(
            padding: EdgeInsets.symmetric(vertical: 8, horizontal: 12),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(color: textColor, width: 2),
            ),
            child: Text(
              indicatorNumber4,
              style: GoogleFonts.inter(fontSize: 12, fontWeight: FontWeight.w700, color: textColor,),
            ),
          ),

          Container(
            padding: EdgeInsets.symmetric(vertical: 8, horizontal: 12),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(color: textColor, width: 2),
            ),
            child: Text(
              indicatorNumber5,
              style: GoogleFonts.inter(fontSize: 12, fontWeight: FontWeight.w700, color: textColor,),
            ),
          ),
        ],
      ),
    );
  }
}
