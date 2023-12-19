import 'package:flutter/material.dart';
import 'package:capstone_project/data/pengingat_merawat_tanaman/theme_text_style.dart';

class CardMenyiramWidget extends StatelessWidget {
  const CardMenyiramWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white, 
      elevation: 4,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20), 
      ),
      child: SizedBox(
        width: 275,
        height: 170,
        child: Padding(
          padding: const EdgeInsets.all(0.0),
          child: Column(
            children: [
              Image.asset(
                'assets/images/pengingat_merawat_tanaman/pengingat_menyiram.png',
                width: 275, 
                height: 126, 
              ),
              
              const SizedBox(height: 7), 
              Text(
                "Pengingat Menyiram",
                style: ThemeTextStyle().reminder2,
              ),
            ],
          ),
        ),
      ),
    );
  }
}