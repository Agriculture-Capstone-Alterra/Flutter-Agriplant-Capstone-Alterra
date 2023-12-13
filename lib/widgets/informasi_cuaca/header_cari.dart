import 'package:capstone_project/data/home_text_style.dart';
import 'package:flutter/material.dart';

class HeaderCari extends StatefulWidget {
  const HeaderCari({super.key});

  @override
  State<HeaderCari> createState() => _HeaderCariState();
}

class _HeaderCariState extends State<HeaderCari> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        left: 16,
        top: 12,
      ),
      child: SizedBox(
        height: 28,
        width: 342,
        child: GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: Row(
            children: [
              const Image(
                image: AssetImage('assets/images/navigate_back.png'),
              ),
              const SizedBox(
                width: 10,
              ),
              BodyLarge(
                text: 'Cuaca',
                color: Colors.white,
              )
            ],
          ),
        ),
      ),
    );
  }
}
