import 'package:capstone_project/data/pengingat_merawat_tanaman/theme_color.dart';
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
    color: ThemeColor().grayColor,
  );

  TextStyle batalkan = GoogleFonts.inter(
    fontSize: 16,
    fontWeight: FontWeight.w600,
    color: ThemeColor().redColor,
  );

  TextStyle selesai = GoogleFonts.inter(
    fontSize: 16,
    fontWeight: FontWeight.w600,
    color: ThemeColor().greenColor,
  );

  TextStyle berhasil = GoogleFonts.inter(
    fontSize: 32,
    fontWeight: FontWeight.w800,
    color: ThemeColor().blackColor,
  );

  TextStyle berhasil2 = GoogleFonts.inter(
    fontSize: 14,
    fontWeight: FontWeight.w400,
    color: ThemeColor().blackColor,
  );

  TextStyle buttonYa = GoogleFonts.roboto(
    fontSize: 16,
    fontWeight: FontWeight.w500,
    color: ThemeColor().whiteColor,
  );

  TextStyle buttonTidak = GoogleFonts.roboto(
    fontSize: 16,
    fontWeight: FontWeight.w500,
    color: ThemeColor().greenColor,
  );

  TextStyle buttonBack = GoogleFonts.inter(
    fontSize: 15,
    fontWeight: FontWeight.w600,
    color: ThemeColor().whiteColor,
  );
}