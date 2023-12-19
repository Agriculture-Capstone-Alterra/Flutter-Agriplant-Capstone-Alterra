import 'package:capstone_project/data/pengingat_merawat_tanaman/theme_color.dart';
import 'package:capstone_project/data/pengingat_merawat_tanaman/theme_text_style.dart';
import 'package:flutter/material.dart';

class ButtonBackWidget extends StatelessWidget {
  final String title;
  final Function()? onPressed;

  const ButtonBackWidget({
    Key? key,
    required this.title,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: ThemeColor().greenColor,
        padding: const EdgeInsets.symmetric(horizontal: 65.0, vertical: 13.0),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0), 
        ),
      ),
      onPressed: onPressed,
      child: Text(
        'Kembali Ke Pengingat',
        style: ThemeTextStyle().buttonBack,
      ),
    );
  }
}