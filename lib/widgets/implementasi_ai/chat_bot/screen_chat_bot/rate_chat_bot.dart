import 'package:flutter/material.dart';

class RateChatBot extends StatefulWidget {
  const RateChatBot({super.key});

  @override
  State<RateChatBot> createState() => _RateChatBotState();
}

class _RateChatBotState extends State<RateChatBot> {
  final String profileChatBot =
      "https://img.id.my-best.com/product_images/e252dc0caddfb4eee8ef54412dcc7466.png?ixlib=rails-4.3.1&q=70&lossless=0&w=800&h=800&fit=clip&s=13bd51345ee9a4cd89ba173628fe451e";
  bool isThumbUpPressed = false;
  bool isThumbDownPressed = false;
  bool isVisible = true;

  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: isVisible,
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
                      ClipRRect(
                        borderRadius: BorderRadius.circular(126.0),
                        child: Image.network(
                          profileChatBot,
                          width: 126,
                          height: 126,
                          fit: BoxFit.fill,
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

                          isVisible = false;
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

                          isVisible = false;
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