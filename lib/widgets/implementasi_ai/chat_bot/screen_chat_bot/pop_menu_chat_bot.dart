import 'package:capstone_project/screens/implementasi_ai/chatbot/first_screen_chat_bot.dart';
import 'package:flutter/material.dart';

class PopMenuButtonChatBot extends StatelessWidget {
  const PopMenuButtonChatBot({super.key});

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton(
      icon: const Icon(Icons.more_horiz),
      onSelected: (value) {
        handleMenuSelection(value, context);
      },
      itemBuilder: (BuildContext context) {
        return [
          const PopupMenuItem(
            value: 'menu1',
            child: Row(
              children: [
                Icon(Icons.chat_bubble_outline),
                SizedBox(
                  width: 10,
                ),
                Text('Akhiri Sesi'),
              ],
            ),
          ),
          const PopupMenuItem(
            value: 'menu2',
            child: Row(
              children: [
                Icon(Icons.ios_share),
                SizedBox(
                  width: 10,
                ),
                Text('Bagikan Percakapan'),
              ],
            ),
          ),
        ];
      },
      offset: const Offset(0, 60),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
        side: const BorderSide(color: Colors.blue),
      ),
    );
  }

  void handleMenuSelection(String value, BuildContext context) {
    switch (value) {
      case 'menu1':
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: const Center(
                child: Text(
                  "Akhiri Sesi ini?",
                  textAlign: TextAlign.center,
                ),
              ),
              content: const Text(
                "Jika mengakhiri sesi ini data chat akan terhapus",
                style: TextStyle(),
              ),
              actions: [
                TextButton(
                  onPressed: () {
                    Navigator.pop(context); // Tutup AlertDialog
                  },
                  child: const Text("Tidak"),
                ),
                TextButton(
                  onPressed: () {
                    Navigator.popUntil(context, (route) => route.isFirst);
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const FirstScreenChatBot(),
                      ),
                    );
                  },
                  child: const Text("Ya"),
                ),
              ],
            );
          },
        );
        break;
      case 'menu2':
        print('Menu Item 2 tapped');
        break;
    }
  }
}
