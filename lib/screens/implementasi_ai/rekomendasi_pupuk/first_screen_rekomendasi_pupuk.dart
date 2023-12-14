import 'package:capstone_project/widgets/implementasi_ai/button_back_chat_bot.dart';
import 'package:capstone_project/widgets/implementasi_ai/chat_bot/first_screen_chat_bot/card_first_screen_chat_bot.dart';
import 'package:flutter/material.dart';

class FirstScreenRekomendasiPupuk extends StatefulWidget {
  const FirstScreenRekomendasiPupuk({super.key});

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
      body: const Center(
        child: CardFirstScreenChatBot(),
      ),
    );
  }
}
