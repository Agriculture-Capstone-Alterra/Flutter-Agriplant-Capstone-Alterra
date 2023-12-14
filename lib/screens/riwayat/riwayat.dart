import 'package:capstone_project/screens/implementasi_ai/chatbot/first_screen_chat_bot.dart';
import 'package:flutter/material.dart';

class Riwayat extends StatefulWidget {
  const Riwayat({Key? key}) : super(key: key);

  @override
  State<Riwayat> createState() => _RiwayatState();
}

class _RiwayatState extends State<Riwayat> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Column(
          children: [
            Text('Riwayat'),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => FirstScreenChatBot(),
                  ),
                );
              },
              child: Text('Chatbot'),
            ),
          ],
        ),
      ),
    );
  }
}
