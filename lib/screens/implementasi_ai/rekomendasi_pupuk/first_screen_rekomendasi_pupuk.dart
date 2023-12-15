import 'package:capstone_project/widgets/implementasi_ai/button_back_chat_bot.dart';
import 'package:capstone_project/widgets/implementasi_ai/rekomendasi_pupuk/card_first_screen_rekomendasi_pupuk.dart';
import 'package:flutter/material.dart';

class FirstScreenRekomendasiPupuk extends StatefulWidget {
  const FirstScreenRekomendasiPupuk({
    Key? key,
  }) : super(key: key);

  @override
  State<FirstScreenRekomendasiPupuk> createState() =>
      _FirstScreenRekomendasiPupukState();
}

class _FirstScreenRekomendasiPupukState
    extends State<FirstScreenRekomendasiPupuk> {
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
        title: const Text('Rekomendasi Pupuk'),
        centerTitle: true,
      ),
      body: Center(
        child: CardFirstScreenRekomendasiPupuk(),
      ),
    );
  }
}
