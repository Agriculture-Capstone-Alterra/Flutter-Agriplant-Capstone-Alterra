import 'package:capstone_project/widgets/implementasi_ai/button_back_chat_bot.dart';
import 'package:capstone_project/widgets/implementasi_ai/rekomendasi_tanaman/card_first_screen_rekomendasi_tanaman.dart';
import 'package:flutter/material.dart';

class FirstScreenRekomendasiTanaman extends StatefulWidget {
  const FirstScreenRekomendasiTanaman({
    Key? key,
  }) : super(key: key);

  @override
  State<FirstScreenRekomendasiTanaman> createState() =>
      _FirstScreenRekomendasiTanamanState();
}

class _FirstScreenRekomendasiTanamanState
    extends State<FirstScreenRekomendasiTanaman> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: const Padding(
              padding: EdgeInsets.only(
                left: 12,
              ),
              child: ButtonBackChatBot()),
        ),
        title: const Text('Rekomendasi Tanaman'),
        centerTitle: true,
      ),
      body: Center(
        child: CardFirstScreenRekomendasiTanaman(),
      ),
    );
  }
}
