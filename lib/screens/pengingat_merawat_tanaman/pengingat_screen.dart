import 'package:flutter/material.dart';
import 'package:capstone_project/data/pengingat_merawat_tanaman/theme_text_style.dart';
import 'package:capstone_project/widgets/pengingat_merawat_tanaman/card/card_menyiram_widget.dart';
import 'package:capstone_project/widgets/pengingat_merawat_tanaman/card/card_pupuk_widget.dart';
import 'package:capstone_project/screens/pengingat_merawat_tanaman/plant_reminder_screen.dart';

class Pengingat extends StatefulWidget {
  const Pengingat({Key? key}) : super(key: key);

  @override
  State<Pengingat> createState() => _PengingatState();
}

class _PengingatState extends State<Pengingat> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Image.asset(
                'assets/images/spa.png',
              ),
            ),
            Text(
              "Agriplant",
              style: ThemeTextStyle().appBar,
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 20),
            Center(
              child: Text(
                "REMINDER",
                style: ThemeTextStyle().reminder,
              ),
            ),
            const SizedBox(height: 70),
            InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const PlantReminder(),
                  ),
                );
              },
              child: const CardMenyiramWidget(),
            ),
            const SizedBox(height: 57),
            InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const PlantReminder(),
                  ),
                );
              },
              child: const CardPupukWidget(),
            ),
          ],
        ),
      ),
    );
  }
}
