import 'package:capstone_project/data/theme_color.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ThemeTextStyle {
  TextStyle appBar = GoogleFonts.roboto(
    fontSize: 22,
    fontWeight: FontWeight.w700,
    color: ThemeColor().greenColor,
  );

  TextStyle reminder = GoogleFonts.inter(
    fontSize: 22,
    fontWeight: FontWeight.w600,
    color: ThemeColor().blackColor,
  );

  TextStyle reminder2 = GoogleFonts.inter(
    fontSize: 18,
    fontWeight: FontWeight.w600,
    color: ThemeColor().blackColor,
  );

  TextStyle appBar2 = GoogleFonts.inter(
    fontSize: 18,
    fontWeight: FontWeight.w600,
    color: ThemeColor().blackColor,
  );

  TextStyle font1 = GoogleFonts.inter(
    fontSize: 20,
    fontWeight: FontWeight.w600,
    color: ThemeColor().blackColor,
  );

  TextStyle font2 = GoogleFonts.inter(
    fontSize: 16,
    fontWeight: FontWeight.w600,
    color: ThemeColor().grayColor,
  );

  TextStyle font3 = GoogleFonts.inter(
    fontSize: 16,
    fontWeight: FontWeight.w600,
    color: ThemeColor().blackColor,
  );

  TextStyle tanaman = GoogleFonts.inter(
    fontSize: 13,
    fontWeight: FontWeight.w500,
    color: ThemeColor().blackColor,
  );

  TextStyle rekomendasi = GoogleFonts.roboto(
    fontSize: 16,
    fontWeight: FontWeight.w500,
    color: ThemeColor().whiteColor,
  );

  TextStyle addReminder = GoogleFonts.inter(
    fontSize: 20,
    fontWeight: FontWeight.w600,
    color: ThemeColor().greenColor,
  );

}