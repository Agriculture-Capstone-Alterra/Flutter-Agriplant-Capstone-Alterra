import 'package:capstone_project/data/pengingat_merawat_tanaman/theme_text_style.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class DetailReminder extends StatelessWidget {
  String plantName;
 
  DetailReminder({
    Key? key,
    required this.plantName,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 44.0),
              child: Text(
                plantName,
                style: ThemeTextStyle().font1,
              ),
            ),
          ],
        ),
      ],
    );
  }
}