import 'package:capstone_project/widgets/implementasi_ai/button_back_chat_bot.dart';
import 'package:capstone_project/widgets/implementasi_ai/chat_bot/screen_chat_bot/message_bubble_chat_bot.dart';
import 'package:capstone_project/widgets/implementasi_ai/chat_bot/screen_chat_bot/message_input_field.dart';
import 'package:capstone_project/widgets/implementasi_ai/chat_bot/screen_chat_bot/pop_menu_chat_bot.dart';
import 'package:capstone_project/widgets/implementasi_ai/chat_bot/screen_chat_bot/rate_chat_bot.dart';
import 'package:flutter/material.dart';

class ChatBot extends StatefulWidget {
  const ChatBot({Key? key}) : super(key: key);

  @override
  State<ChatBot> createState() => _ChatBotState();
}

class _ChatBotState extends State<ChatBot> {
  final String profileChatBot =
      "https://img.id.my-best.com/product_images/e252dc0caddfb4eee8ef54412dcc7466.png?ixlib=rails-4.3.1&q=70&lossless=0&w=800&h=800&fit=clip&s=13bd51345ee9a4cd89ba173628fe451e";
  bool isThumbUpPressed = false;
  bool isThumbDownPressed = false;
  bool isVisible = true;
  final TextEditingController textController = TextEditingController();

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
            child: ButtonBackChatBot(),
          ),
        ),
        title: const Text('Layanan Pengguna'),
        centerTitle: true,
        actions: const [
          PopMenuButtonChatBot(),
        ],
      ),
      body: Container(
        color: const Color(0xFFF6F6F7),
        child: Column(
          children: [
            const RateChatBot(),
            const Divider(height: 1.0, color: Colors.grey),
            Expanded(
              child: ListView.builder(
                itemCount: messages.length,
                itemBuilder: (context, index) {
                  return MessageBubbleChatBot(
                    message: messages[index],
                    profileImageUrl: !messages[index].isMe
                        ? 'https://img.id.my-best.com/product_images/e252dc0caddfb4eee8ef54412dcc7466.png?ixlib=rails-4.3.1&q=70&lossless=0&w=800&h=800&fit=clip&s=13bd51345ee9a4cd89ba173628fe451e'
                        : '',
                  );
                },
              ),
            ),
            buildMessageInputField(
              textController,
              sendMessage,
            ),
          ],
        ),
      ),
    );
  }

  void sendMessage(String text) {
    setState(() {
      messages.add(Message(text: text, isMe: true, timestamp: DateTime.now()));
    });
  }
}
