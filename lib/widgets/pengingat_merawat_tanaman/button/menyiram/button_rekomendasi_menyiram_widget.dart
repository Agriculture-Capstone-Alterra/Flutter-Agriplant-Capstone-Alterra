import 'package:capstone_project/data/text_style/theme_text_style.dart';
import 'package:capstone_project/data/theme_color.dart';
import 'package:flutter/material.dart';

class ButtonRekomendasiMenyiram extends StatelessWidget {
  final String title;
  final Function()? onPressed;

  const ButtonRekomendasiMenyiram({
    Key? key,
    required this.title,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 320.0,
      height: 45.0,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          primary: ThemeColor().greenColor,
          padding: EdgeInsets.zero, 
        ),
        onPressed: onPressed,
        child: Container(
          width: 280.0,
          height: 40.0,
          alignment: Alignment.center,
          child: Text(
            'Gunakan Rekomendasi',
            style: ThemeTextStyle().rekomendasi,
          ),
        ),
      ),
    );
  }
}
