import 'package:capstone_project/data/pengingat_merawat_tanaman/theme_text_style.dart';
import 'package:capstone_project/screens/pengingat_merawat_tanaman/pupuk/time_pupuk_screen.dart';
import 'package:flutter/material.dart';
import '../../../widgets/pengingat_merawat_tanaman/card/card_tanaman_widget.dart';
import '../../../widgets/pengingat_merawat_tanaman/text_field/text_field_search_widget.dart';

class Pupuk extends StatefulWidget {
  const Pupuk({Key? key}) : super(key: key);

  @override
  State<Pupuk> createState() => _PupukState();
}

class _PupukState extends State<Pupuk> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Tanaman Anda Pupuk",
          style: ThemeTextStyle().appBar2,
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(20.0, 16.0, 20.0, 16.0),
              child: Row(
                children: [
                  const Expanded(
                    child: SizedBox(
                      height: 50.0,
                      child: TextFieldSearchWidget(),
                    ),
                  ),
                  const SizedBox(width: 10.0),
                  GestureDetector(
                    onTap: () {
                     
                    },
                    child: const Image(image: AssetImage('assets/images/pengingat_merawat_tanaman/filter.png')),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 30),
            InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const TimePupuk(),
                  ),
                );
              },
              child: const CardTanamanWidget(),
            ),
          ],
        ),
      ),
    );
  }
}
