import 'package:capstone_project/screens/implementasi_ai/chatbot/chat_bot.dart';
import 'package:capstone_project/widgets/implementasi_ai/chat_bot/screen_chat_bot/message_bubble_chat_bot.dart';
import 'package:flutter/material.dart';

class ButtonNavigationChatBot extends StatelessWidget {
  const ButtonNavigationChatBot({super.key});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        messages.add(
          Message(
            text:
                'Selamat datang di Chatbot Pertanian Kami! Bagaimana saya bisa membantu Anda hari ini?',
            isMe: false,
            timestamp: DateTime.now(),
          ),
        );
        messages.add(
          Message(
            text: 'Silakan ketik pertanyaan atau kata kunci untuk memulai.',
            isMe: false,
            timestamp: DateTime.now(),
          ),
        );
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => const ChatBot()),
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