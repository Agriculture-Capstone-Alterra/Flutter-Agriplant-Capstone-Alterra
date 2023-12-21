import 'package:capstone_project/data/home_text_style.dart';
import 'package:capstone_project/widgets/informasi_cuaca/temprature_home.dart';
import 'package:flutter/material.dart';
import 'package:glassmorphism/glassmorphism.dart';

class TempratureDetailCuaca extends StatelessWidget {
  final List<double> hourlyTemp;
  final List<String> hourlyTime;
  const TempratureDetailCuaca({
    super.key,
    required this.hourlyTemp,
    required this.hourlyTime,
  });

  @override
  Widget build(BuildContext context) {
    return GlassmorphicContainer(
      width: 384,
      height: 132,
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
        padding: const EdgeInsets.only(
          left: 12,
          top: 12,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 6),
              child: BodySmallBold(text: 'Sedia Payung Sebelum Hujan'),
            ),
            const SizedBox(
              height: 8,
            ),
            TempratureHome(
              colorText: Colors.white,
              leftPadding: 0,
              // hourlyTemp: hourlyTemp,
              // hourlyTime: hourlyTime,
            ),
          ],
        ),
      ),
    );
  }
}
