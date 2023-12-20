import 'package:capstone_project/data/pengingat_merawat_tanaman/theme_color.dart';
import 'package:capstone_project/data/pengingat_merawat_tanaman/theme_text_style.dart';
import 'package:flutter/material.dart';

class ButtonTidakWidget extends StatelessWidget {
  final String title;
  final Function()? onPressed;

  const ButtonTidakWidget({
    Key? key,
    required this.title,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: ThemeColor().whiteColor,
        padding: const EdgeInsets.symmetric(horizontal: 30.0, vertical: 13.0),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30.0),
          side: const BorderSide(color: Color(0xFF36725D)), 
        ),
      ),
        onPressed: onPressed,
          child: Text(
          'Tidak',
          style: ThemeTextStyle().buttonTidak,
        ),
      );
    }
  }