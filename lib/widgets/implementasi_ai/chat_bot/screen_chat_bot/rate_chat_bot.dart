import 'package:flutter/material.dart';

class RateChatBot extends StatefulWidget {
  const RateChatBot({super.key});

  @override
  State<RateChatBot> createState() => _RateChatBotState();
}

class _RateChatBotState extends State<RateChatBot> {
  final String profileChatBot =
      "assets/images/implementasi_ai/chat_bot/profile_chat_bot.png";
  bool isThumbUpPressed = false;
  bool isThumbDownPressed = false;
  bool isEnable = true;

  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: isEnable,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          children: [
            Column(
              children: [
                CircleAvatar(
                  backgroundColor: Colors.transparent,
                  radius: 16.0,
                  child: Stack(
                    fit: StackFit.expand,
                    children: [
                      Transform.scale(
                        scale: 0.7,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(126.0),
                          child: Image.asset(
                            profileChatBot,
                            width: 120,
                            height: 120,
                            fit: BoxFit.fill,
                          ),
                        ),
                      ),
                      Align(
                        alignment: Alignment.bottomRight,
                        child: Container(
                          width: 10.43,
                          height: 10.43,
                          decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.blue,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(width: 16.0),
            const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Chatbot',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 20.0,
                  ),
                ),
                Text(
                  'Agen Pendukung',
                  style: TextStyle(
                    color: Color(0xFFA5A5A5),
                    fontSize: 14.0,
                  ),
                ),
              ],
            ),
            const Spacer(),
            Padding(
              padding: const EdgeInsets.only(right: 6.0),
              child: Row(
                children: [
                  IconButton(
                    onPressed: () {
                      setState(() {
                        isThumbUpPressed = !isThumbUpPressed;
                        if (isThumbUpPressed) {
                          isThumbDownPressed = false;
                        }
                      });

                      Future.delayed(const Duration(seconds: 1), () {
                        setState(() {
                          isThumbUpPressed = false;

                          isEnable = false;
                        });
                      });
                    },
                    icon: Icon(
                      isThumbUpPressed
                          ? Icons.thumb_up_alt_rounded
                          : Icons.thumb_up_off_alt,
                      color: const Color(0xFF454B58),
                    ),
                  ),
                  IconButton(
                    onPressed: () {
                      setState(() {
                        isThumbDownPressed = !isThumbDownPressed;
                        if (isThumbDownPressed) {
                          isThumbUpPressed = false;
                        }
                      });

                      Future.delayed(const Duration(seconds: 1), () {
                        setState(() {
                          isThumbDownPressed = false;

                          isEnable = false;
                        });
                      });
                    },
                    icon: Icon(
                      isThumbDownPressed
                          ? Icons.thumb_down_alt_rounded
                          : Icons.thumb_down_off_alt,
                      color: const Color(0xFF454B58),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}