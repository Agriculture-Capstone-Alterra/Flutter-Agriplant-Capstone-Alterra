import 'package:capstone_project/data/home_text_style.dart';
import 'package:capstone_project/screens/navigation_bar.dart';
import 'package:flutter/material.dart';

class CardCariCuaca extends StatelessWidget {
  final String imgBackground;
  final String kota;
  final String temp;
  final String timeNow;
  const CardCariCuaca({
    super.key,
    required this.imgBackground,
    required this.kota,
    required this.temp,
    required this.timeNow,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10),
      child: GestureDetector(
        onTap: () {
          Navigator.pushAndRemoveUntil(context,
              MaterialPageRoute(builder: (context) {
            return const NavBar();
          }), (route) => false);
        },
        child: SizedBox(
          width: 360,
          height: 108,
          child: DecoratedBox(
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage(imgBackground), fit: BoxFit.cover),
                borderRadius: BorderRadius.circular(16)),
            child: Padding(
              padding: const EdgeInsets.only(left: 16, top: 8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(right: 8),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        BodyLarge(
                          text: kota,
                          color: Colors.black,
                        ),
                        BodyLarge(
                          text: temp,
                          color: Colors.black,
                          size: 32,
                        ),
                      ],
                    ),
                  ),
                  BodyNormal(text: timeNow),
                  const SizedBox(
                    height: 8,
                  ),
                  BodySmall(text: 'Hujan Deras'),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
