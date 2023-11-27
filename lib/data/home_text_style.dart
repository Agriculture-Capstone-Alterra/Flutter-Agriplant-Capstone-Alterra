// ignore_for_file: must_be_immutable
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class BodyLarge extends StatelessWidget {
  double size;
  final String text;
  final Color color;
  BodyLarge({
    super.key,
    required this.text,
    this.color = const Color(0xFF36725D),
    this.size = 20,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: GoogleFonts.inter(
        color: color,
        fontSize: size,
        fontWeight: FontWeight.w600,
      ),
    );
  }
}

class BodyNormal extends StatelessWidget {
  double size;
  final String text;
  final Color color;
  BodyNormal({
    super.key,
    required this.text,
    this.color = const Color(0xFFFFFFFF),
    this.size = 16,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: GoogleFonts.inter(
        color: color,
        fontSize: size,
        fontWeight: FontWeight.w600,
      ),
    );
  }
}

class BodySmall extends StatelessWidget {
  double size;
  final String text;
  final Color color;
  BodySmall({
    super.key,
    required this.text,
    this.color = const Color(0xFFFFFFFF),
    this.size = 12,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: GoogleFonts.inter(
        color: color,
        fontSize: size,
        fontWeight: FontWeight.w400,
      ),
    );
  }
}

class TitleMedium extends StatelessWidget {
  double size;
  final String text;
  final Color color;
  TitleMedium({
    super.key,
    required this.text,
    this.color = const Color(0xFF36725D),
    this.size = 16,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: GoogleFonts.roboto(
        color: color,
        fontSize: size,
        fontWeight: FontWeight.w700,
      ),
    );
  }
}

class TitleSmall extends StatelessWidget {
  double size;
  final String text;
  final Color color;
  TitleSmall({
    super.key,
    required this.text,
    this.color = const Color(0xFF51AB8C),
    this.size = 14,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: GoogleFonts.roboto(
        color: color,
        fontSize: size,
        fontWeight: FontWeight.w500,
      ),
    );
  }
}

class HeadlineSmall extends StatelessWidget {
  double size;
  final String text;
  final Color color;
  HeadlineSmall({
    super.key,
    required this.text,
    this.color = Colors.white,
    this.size = 24,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: GoogleFonts.roboto(
        color: color,
        fontSize: size,
        fontWeight: FontWeight.w400,
      ),
    );
  }
}

class DisplayMedium extends StatelessWidget {
  double size;
  final String text;
  final Color color;
  DisplayMedium({
    super.key,
    required this.text,
    this.color = Colors.white,
    this.size = 45,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: GoogleFonts.roboto(
        color: color,
        fontSize: size,
        fontWeight: FontWeight.w400,
      ),
    );
  }
}

class BodySmallBold extends StatelessWidget {
  double size;
  final String text;
  final Color color;
  BodySmallBold({
    super.key,
    required this.text,
    this.color = const Color(0xFFFFFFFF),
    this.size = 12,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: GoogleFonts.inter(
        color: color,
        fontSize: size,
        fontWeight: FontWeight.w700,
      ),
    );
  }
}