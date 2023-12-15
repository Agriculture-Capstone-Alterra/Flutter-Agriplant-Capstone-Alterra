import 'package:capstone_project/data/home_text_style.dart';
import 'package:capstone_project/screens/implementasi_ai/chatbot/first_screen_chat_bot.dart';
import 'package:capstone_project/screens/informasi_cuaca/detail_cuaca.dart';
import 'package:flutter/material.dart';

import '../../widgets/informasi_cuaca/header_home.dart';
import '../../widgets/informasi_cuaca/pengingat_home.dart';
import '../../widgets/informasi_cuaca/tanaman_home.dart';
import '../../widgets/informasi_cuaca/temprature_home.dart';

class Home extends StatefulWidget {
  const Home({
    super.key,
  });

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(
                  left: 16,
                  top: 12,
                  right: 16,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Image.asset('assets/images/spa.png'),
                        const SizedBox(
                          width: 2,
                        ),
                        BodyLarge(text: 'Agriplant'),
                      ],
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const FirstScreenChatBot(),
                          ),
                        );
                      },
                      child: Image.asset(
                        'assets/images/implementasi_ai/chat_bot/button_chat_bot.png',
                        width: 138,
                        height: 32,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 16,
              ),
              const HeaderHome(),
              const SizedBox(
                height: 16,
              ),
              SizedBox(
                width: 352,
                height: 24,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    TitleMedium(text: 'Cuaca Hari Ini'),
                    InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const DetailCuaca(),
                          ),
                        );
                      },
                      child: Row(
                        children: [
                          TitleSmall(text: '7 Hari Selanjutnya'),
                          const Image(
                            image:
                                AssetImage('assets/images/navigate_next.png'),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 12,
              ),
              const TempratureHome(),
              const SizedBox(
                height: 16,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 16),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: SizedBox(
                    child: TitleMedium(text: 'Pengingat Merawat Tanaman'),
                  ),
                ),
              ),
              const SizedBox(
                height: 12,
              ),
              const PengingatHome(),
              const SizedBox(
                height: 16,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 16),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: SizedBox(
                    child: TitleMedium(text: 'Tanaman Kamu'),
                  ),
                ),
              ),
              const SizedBox(
                height: 12,
              ),
              const TanamanHome(),
              const SizedBox(
                height: 12,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 16),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: SizedBox(
                    child: TitleMedium(
                      text: 'Informasi Hama & Cara Menanganinya',
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
