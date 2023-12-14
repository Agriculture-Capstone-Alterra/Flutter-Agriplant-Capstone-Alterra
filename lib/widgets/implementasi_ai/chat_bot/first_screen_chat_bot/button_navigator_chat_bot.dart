import 'package:capstone_project/screens/implementasi_ai/chatbot/chat_bot.dart';
import 'package:flutter/material.dart';

class ButtonNavigationChatBot extends StatelessWidget {
  const ButtonNavigationChatBot({super.key});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(builder: (context) => const ChatBot()),
          (route) => false,
        );
      },
      style: ButtonStyle(
        fixedSize: MaterialStateProperty.all(const Size(295.0, 40.0)),
        backgroundColor: MaterialStateProperty.all(const Color(0xFF295646)),
      ),
      child: const Text(
        "Mulai Percakapan",
        style: TextStyle(
          color: Colors.white,
        ),
      ),
    );
  }
}
