import 'package:capstone_project/data/home_text_style.dart';
import 'package:flutter/material.dart';
import 'package:glassmorphism/glassmorphism.dart';

List<String> hari = [
  'Senin',
  'Selasa',
  'Rabu',
  'Kamis',
  'Jumat',
  'Sabtu',
  'Minggu',
];

class ListHariDetailCuaca extends StatelessWidget {
  const ListHariDetailCuaca({super.key});

  @override
  Widget build(BuildContext context) {
    return GlassmorphicContainer(
      width: 384,
      height: 380,
      borderRadius: 14,
      linearGradient: LinearGradient(
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
        colors: [
          const Color(0xFFffffff).withOpacity(0.1),
          const Color(0xFFFFFFFF).withOpacity(0.05),
        ],
        stops: const [
          0.1,
          1,
        ],
      ),
      border: 0,
      blur: 20,
      borderGradient: LinearGradient(
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
        colors: [
          const Color(0xFFffffff).withOpacity(0.5),
          const Color((0xFFFFFFFF)).withOpacity(0.5),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.only(top: 10),
        child: ListView.builder(
          itemCount: 7,
          itemBuilder: (BuildContext context, int index) {
            return Column(
              children: [
                SizedBox(
                  height: 36,
                  width: 318,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      SizedBox(
                        width: 70,
                        child: BodySmallBold(
                          text: hari[index],
                          color: Colors.white,
                          size: 16,
                        ),
                      ),
                      const Image(
                        image: AssetImage('assets/images/cloud.png'),
                      ),
                      BodySmallBold(
                        text: '24°',
                        color: Colors.white,
                        size: 16,
                      ),
                      const Image(
                        image: AssetImage(
                            'assets/images/indicator_temprature.png'),
                      ),
                      BodySmallBold(
                        text: '30°',
                        color: Colors.white,
                        size: 16,
                      ),
                    ],
                  ),
                ),
                const Divider(
                  color: Colors.black,
                  indent: 34,
                  endIndent: 34,
                  thickness: 0.5,
                )
              ],
            );
          },
        ),
      ),
    );
  }
}
