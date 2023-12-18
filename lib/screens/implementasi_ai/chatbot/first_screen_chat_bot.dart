import 'package:capstone_project/widgets/implementasi_ai/button_back_chat_bot.dart';
import 'package:capstone_project/widgets/implementasi_ai/chat_bot/first_screen_chat_bot/button_menu_first_screen_chat_bot.dart';
import 'package:capstone_project/widgets/implementasi_ai/chat_bot/first_screen_chat_bot/card_first_screen_chat_bot.dart';
import 'package:flutter/material.dart';

class FirstScreenChatBot extends StatefulWidget {
  const FirstScreenChatBot({super.key});

  @override
  State<FirstScreenChatBot> createState() => _FirstScreenChatBotState();
}

class _FirstScreenChatBotState extends State<FirstScreenChatBot> {
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
        title: const Text('Layanan Pengguna'),
        centerTitle: true,
        actions: const [
          ButtonMenuFirstScreenChatBot(),
        ],
      ),
      body: const Center(
        child: CardFirstScreenChatBot(),
     ),
);
}
}