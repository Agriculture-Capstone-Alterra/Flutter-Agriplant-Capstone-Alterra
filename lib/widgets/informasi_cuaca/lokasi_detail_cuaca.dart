import 'package:capstone_project/data/home_text_style.dart';
import 'package:flutter/material.dart';

List<String> label = ['9km/h', '85%', '25%', '25%'];
List<String> imagesLabel = [
  'assets/images/wind.png',
  'assets/images/drop_water.png',
  'assets/images/drop_water.png',
  'assets/images/drop_water.png'
];

class LokasiDetailCuaca extends StatelessWidget {
  const LokasiDetailCuaca({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 320,
      height: 190,
      child: Column(
        children: [
          HeadlineSmall(text: 'Jakarta'),
          const SizedBox(
            height: 16,
          ),
          DisplayMedium(text: '27°C'),
          const SizedBox(
            height: 12,
          ),
          SizedBox(
            width: 320,
            height: 58,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: 4,
              itemBuilder: (BuildContext context, int index) {
                return Padding(
                  padding: const EdgeInsets.only(right: 54),
                  child: Row(
                    children: [
                      Column(
                        children: [
                          Image(
                            image: AssetImage(imagesLabel[index]),
                          ),
                          const SizedBox(
                            height: 4,
                          ),
                          BodySmall(text: label[index])
                        ],
                      )
                    ],
                  ),
                );
              },
            ),
          )
        ],
      ),
    );
  }
}
