import 'package:capstone_project/data/home_text_style.dart';
import 'package:flutter/material.dart';

class HeaderDetailCuaca extends StatelessWidget {
  const HeaderDetailCuaca({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        SizedBox(
          height: 28,
          child: InkWell(
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
                  text: '7 Hari Selanjutnya',
                  color: Colors.white,
                )
              ],
            ),
          ),
        ),
        IconButton(
          onPressed: () {},
          icon: const Icon(
            Icons.format_list_bulleted,
            color: Colors.white,
          ),
        )
      ],
    );
  }
}
