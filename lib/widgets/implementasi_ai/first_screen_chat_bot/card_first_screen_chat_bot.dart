import 'package:capstone_project/widgets/implementasi_ai/first_screen_chat_bot/button_navigator_chat_bot.dart';
import 'package:flutter/material.dart';

class CardFirstScreenChatBot extends StatelessWidget {
  const CardFirstScreenChatBot({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color(0xFFF6F6F7),
      child: Stack(
        alignment: Alignment.center,
        children: [
          Container(
            width: 343.0,
            height: 228.0,
            decoration: BoxDecoration(
              color: Colors.transparent,
              border: Border.all(
                color: const Color(0xFFE3E3E3),
                width: 2.0,
              ),
              borderRadius: const BorderRadius.all(
                Radius.circular(
                  20,
                ),
              ),
            ),
            child: const Align(
                alignment: Alignment.center,
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Padding(
                        padding: EdgeInsets.all(16.0),
                        child: Text(
                          "Halo, Senang bertemu Anda di sini! Dengan mengeklik tombol 'Mulai Percakapan', Anda setuju untuk memproses data pribadi Anda sebagaimana dijelaskan dalam Kebijakan Privasi kami.",
                          textAlign: TextAlign.center,
                        ),
                      ),
                      ButtonNavigationChatBot(),
                    ],
                  ),
                )),
          ),
          Align(
            alignment: Alignment.topCenter,
            child: Padding(
              padding: const EdgeInsets.only(
                top: 200,
              ),
              child: Container(
                width: 70,
                height: 70,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: Color(0xFF295646),
                ),
                child: const Icon(
                  Icons.message,
                  color: Colors.white,
                  size: 32,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
