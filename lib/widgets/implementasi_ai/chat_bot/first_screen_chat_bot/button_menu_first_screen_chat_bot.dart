import 'package:capstone_project/screens/implementasi_ai/rekomendasi_pupuk/first_screen_rekomendasi_pupuk.dart';
import 'package:capstone_project/screens/implementasi_ai/rekomendasi_tanaman/first_screen_rekomendasi_tanaman.dart';
import 'package:flutter/material.dart';

class ButtonMenuFirstScreenChatBot extends StatelessWidget {
  const ButtonMenuFirstScreenChatBot({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        right: 12.0,
      ),
      child: PopupMenuButton(
        icon: const Icon(Icons.more_horiz),
        onSelected: (value) {
          handleMenuSelection(value, context);
        },
        itemBuilder: (BuildContext context) {
          return [
            const PopupMenuItem(
              value: 'menu1',
              child: Text('Rekomendasi Pupuk'),
            ),
            const PopupMenuItem(
              value: 'menu2',
              child: Text('Rekomendasi Tanaman'),
            ),
          ];
        },
        offset: const Offset(0, 60),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
          side: const BorderSide(color: Colors.blue),
        ),
      ),
    );
  }

  void handleMenuSelection(String value, BuildContext context) {
    switch (value) {
      case 'menu1':
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const FirstScreenRekomendasiPupuk(),
          ),
        );
        break;
      case 'menu2':
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const FirstScreenRekomendasiTanaman(),
          ),
        );
        break;
    }
  }
}
