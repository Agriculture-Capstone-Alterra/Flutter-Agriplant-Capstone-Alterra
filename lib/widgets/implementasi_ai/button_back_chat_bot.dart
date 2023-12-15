import 'package:flutter/material.dart';

class ButtonBackChatBot extends StatelessWidget {
  const ButtonBackChatBot({super.key});

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {
        Navigator.pop(context);
      },
      icon: const Icon(
        Icons.arrow_back_ios,
        size: 14,
      ),
    );
  }
}
