import 'package:capstone_project/screens/chat_bot/chat_bot.dart';
import 'package:flutter/material.dart';

class FirstScreenChatBot extends StatefulWidget {
  const FirstScreenChatBot({super.key});

  @override
  State<FirstScreenChatBot> createState() => _FirstScreenChatBotState();
}

class _FirstScreenChatBotState extends State<FirstScreenChatBot> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFFE3E3E3),
        leading: GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: Padding(
              padding: const EdgeInsets.only(
                left: 12,
              ),
              child: IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.arrow_back_ios,
                  size: 14,
                ),
              )),
        ),
        title: const Text('Layanan Pengguna'),
        centerTitle: true,
        actions: [
          Padding(
            padding: const EdgeInsets.only(
              right: 12.0,
            ),
            child: IconButton(
              onPressed: () {},
              icon: const Icon(Icons.more_horiz),
            ),
          ),
        ],
      ),
      body: Center(
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
              child: Align(
                  alignment: Alignment.center,
                  child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const Padding(
                          padding: EdgeInsets.all(16.0),
                          child: Text(
                            "Halo, Senang bertemu Anda di sini! Dengan mengeklik tombol 'Mulai Percakapan', Anda setuju untuk memproses data pribadi Anda sebagaimana dijelaskan dalam Kebijakan Privasi kami.",
                            textAlign: TextAlign.center,
                          ),
                        ),
                        ElevatedButton(
                          onPressed: () {
                            Navigator.pushAndRemoveUntil(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const ChatBot()),
                              (route) => false,
                            );
                          },
                          style: ButtonStyle(
                            fixedSize: MaterialStateProperty.all(
                                const Size(295.0, 40.0)),
                            backgroundColor: MaterialStateProperty.all(
                                const Color(0xFF295646)),
                          ),
                          child: const Text(
                            "Mulai Percakapan",
                            style: TextStyle(
                              color: Colors.white,
                            ),
                          ),
                        )
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
      ),
    );
  }
}
