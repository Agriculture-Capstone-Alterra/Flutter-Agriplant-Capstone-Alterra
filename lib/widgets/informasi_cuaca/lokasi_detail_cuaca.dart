import 'package:capstone_project/data/home_text_style.dart';
import 'package:flutter/material.dart';

// List<String> label = [
// '9km/h',
// '85%',
// '25%',
// '25%',
// ];

// List<String> imagesLabel = [
// 'assets/images/wind.png',
// 'assets/images/drop_water.png',
// 'assets/images/drop_water.png',
// 'assets/images/drop_water.png'
// ];

// ignore: must_be_immutable
class LokasiDetailCuaca extends StatelessWidget {
  final double latitude;
  final double longitude;
  final String currentPlace;
  final double currentTemperature;
  final double currentWindSpeed;
  List<String> label;
  List<String> imagesLabel;

  LokasiDetailCuaca({
    super.key,
    required this.latitude,
    required this.longitude,
    required this.currentPlace,
    required this.currentTemperature,
    required this.currentWindSpeed,
  })  : label = [
          '$currentWindSpeed Km/h',
          '85%',
          '25%',
          '25%',
        ],
        imagesLabel = [
          'assets/images/wind.png',
          'assets/images/drop_water.png',
          'assets/images/drop_water.png',
          'assets/images/drop_water.png',
        ];

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 320,
      height: 190,
      child: Column(
        children: [
          HeadlineSmall(text: currentPlace),
          const SizedBox(
            height: 16,
          ),
          DisplayMedium(text: "$currentTemperature °C"),
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
