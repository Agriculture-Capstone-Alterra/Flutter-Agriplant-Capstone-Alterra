import 'package:capstone_project/data/pengingat_merawat_tanaman/theme_text_style.dart';
import 'package:flutter/material.dart';
import '../../../widgets/pengingat_merawat_tanaman/button/pupuk/button_add_reminder_pupuk_widget.dart';
import '../../../widgets/pengingat_merawat_tanaman/button/pupuk/button_rekomendasi_pupuk_widget.dart';
import '../../../widgets/pengingat_merawat_tanaman/button/pupuk/button_save_reminder_pupuk_widget.dart';
import '../../../widgets/pengingat_merawat_tanaman/card/pupuk/card_time_pupuk_widget.dart';

class TimePupuk extends StatelessWidget {
  const TimePupuk({Key? key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "REMINDER MEMBERI PUPUK",
          style: ThemeTextStyle().font1,
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 12),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 44.0),
                  child: Text(
                    "Kangkung",
                    style: ThemeTextStyle().font1,
                  ),
                ),
              ],
            ),
            
            const SizedBox(height: 13),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 44.0),
                  child: Text(
                    "Rekomendasi dari kami",
                    style: ThemeTextStyle().font2,
                  ),
                ),
              ],
            ),

            const SizedBox(height: 13),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 44.0),
                  child: Row(
                    children: [
                      Image.asset(
                        'assets/images/pengingat_merawat_tanaman/time.png', 
                        height: 24, 
                        width: 24, 
                      ),
                      const SizedBox(width: 8), 
                      Text(
                        "2x Sehari",
                        style: ThemeTextStyle().font3,
                      ),
                    ],
                  ),
                ),
              ],
            ),

            const SizedBox(height: 13),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 44.0),
                  child: Row(
                    children: [
                      const CardTimePupukWidget(),
                      const SizedBox(width: 4), 
                      Text(
                        "AM",
                        style: ThemeTextStyle().font3,
                      ),
                       const SizedBox(width: 16), 
                      Text(
                        "-",
                        style: ThemeTextStyle().font3,
                      ),
                      const SizedBox(width: 16),
                       const CardTimePupukWidget(),
                      const SizedBox(width: 7),
                      Text(
                        "AM",
                        style: ThemeTextStyle().font3,
                      ),
                    ],
                  ),
                ),
              ],
            ),

            const SizedBox(height: 13),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 44.0),
                  child: Row(
                    children: [
                       const CardTimePupukWidget(),
                      const SizedBox(width: 4), 
                      Text(
                        "PM",
                        style: ThemeTextStyle().font3,
                      ),
                       const SizedBox(width: 16), 
                      Text(
                        "-",
                        style: ThemeTextStyle().font3,
                      ),
                      const SizedBox(width: 16),
                       const CardTimePupukWidget(),
                      const SizedBox(width: 7),
                      Text(
                        "PM",
                        style: ThemeTextStyle().font3,
                      ),
                    ],
                  ),
                ),
              ],
            ), 

            const SizedBox(height: 45),
            ButtonRekomendasiPupuk(title: 'Gunakan Rekomendasi',onPressed: () {
              print('Button pressed!');
            }, ),

            const SizedBox(height: 25),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 22.0),
                  child: Row(
                    children: [
                      Text(
                        "Tambahan Pengingat",
                        style: ThemeTextStyle().addReminder,
                      ),
                       const SizedBox(width: 49), 
                       ButtonAddReminderPupuk(onPressed: () {
                        print('Button pressed!');
                        }, ),
                    ],
                  ),
                ),
              ],
            ),

            const SizedBox(height: 274),
            ButtonSaveReminderPupuk(title: 'Simpan Reminder',onPressed: () {
              print('Button pressed!');
            }, ),
           

          ],
        ),
      ),
    );
  }
}