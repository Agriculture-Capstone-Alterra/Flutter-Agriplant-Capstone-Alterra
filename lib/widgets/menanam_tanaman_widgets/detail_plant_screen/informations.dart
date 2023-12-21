import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

// ignore: must_be_immutable
class Informations extends StatelessWidget {
  String aboutFertilizerTextHead;
  String aboutPestTextHead;
  String fertilizerInfo;
  String pestInfo;
  bool customExpandedIconFertilizer;
  Function(bool expnaded) onExpansionChangedFertilizer;
  bool customExpandedIconPest;
  Function(bool expnaded) onExpansionChangedPest;

  Informations({
    Key? key,
    required this.aboutFertilizerTextHead,
    required this.aboutPestTextHead,
    required this.fertilizerInfo,
    required this.pestInfo,
    required this.customExpandedIconFertilizer,
    required this.onExpansionChangedFertilizer,
    required this.customExpandedIconPest,
    required this.onExpansionChangedPest,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 12),
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ExpansionTile(
            title: Text(
              aboutFertilizerTextHead,
              style: GoogleFonts.inter(fontSize: 16, fontWeight: FontWeight.w600),
            ),
            trailing: customExpandedIconFertilizer==false?
            Text('+', style: GoogleFonts.inter(fontSize: 22, fontWeight: FontWeight.w600),):
            Text('-', style: GoogleFonts.inter(fontSize: 22, fontWeight: FontWeight.w600),),
            children: [
              ListTile(
                leading: Text(
                  fertilizerInfo,
                  style: GoogleFonts.inter(fontSize: 12, fontWeight: FontWeight.w400),
                  textAlign: TextAlign.start,
                ),
              ),
            ],
            onExpansionChanged: onExpansionChangedFertilizer,
          ),
          ExpansionTile(
            title: Text(
              aboutPestTextHead,
              style: GoogleFonts.inter(fontSize: 16, fontWeight: FontWeight.w600),
            ),
            trailing: customExpandedIconPest==false?
            Text('+', style: GoogleFonts.inter(fontSize: 22, fontWeight: FontWeight.w600),):
            Text('-', style: GoogleFonts.inter(fontSize: 22, fontWeight: FontWeight.w600),),
            children: [
              ListTile(
                leading: Text(
                  pestInfo,
                  style: GoogleFonts.inter(fontSize: 12, fontWeight: FontWeight.w400),
                  textAlign: TextAlign.start,
                ),
              ),
            ],
            onExpansionChanged: onExpansionChangedPest,
          ),
        ],
      ),
    );
  }
}