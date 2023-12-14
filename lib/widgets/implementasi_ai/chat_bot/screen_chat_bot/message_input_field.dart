import 'package:flutter/material.dart';

Widget buildMessageInputField(
    TextEditingController textController, Function sendMessage) {
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: Row(
      children: [
        Expanded(
          child: TextField(
            controller: textController,
            decoration: const InputDecoration(
              hintText: 'Ketik pesan...',
            ),
          ),
        ),
        IconButton(
          icon: const Icon(Icons.send),
          onPressed: () {
            sendMessage(textController.text);
            textController.clear();
          },
        ),
      ],
    ),
  );
}
