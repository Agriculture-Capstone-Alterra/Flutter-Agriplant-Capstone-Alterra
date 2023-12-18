import 'package:capstone_project/widgets/informasi_cuaca/glassmorph_list_hari_detail_cuaca.dart';
import 'package:capstone_project/widgets/informasi_cuaca/glassmorph_temprature_detail_cuaca.dart';
import 'package:capstone_project/widgets/informasi_cuaca/header_detail_cuaca.dart';
import 'package:flutter/material.dart';

List<String> label = ['9km/h', '85%', '25%', '25%'];
List<String> imagesLabel = [
  'assets/images/wind.png',
  'assets/images/drop_water.png',
  'assets/images/drop_water.png',
  'assets/images/drop_water.png'
];

class DetailCuaca extends StatelessWidget {
  const DetailCuaca({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(
        child: SizedBox(
          height: double.maxFinite,
          width: double.maxFinite,
          child: DecoratedBox(
            decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage(
                    'assets/images/rain.jpg',
                  ),
                  fit: BoxFit.cover),
            ),
            child: SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.only(
                  left: 16,
                  top: 2,
                  right: 16,
                ),
                child: Column(
                  children: [
                    HeaderDetailCuaca(),
                    SizedBox(
                      height: 16,
                    ),
                    // LokasiDetailCuaca(),
                    SizedBox(
                      height: 16,
                    ),
                    TempratureDetailCuaca(),
                    SizedBox(
                      height: 10,
                    ),
                    ListHariDetailCuaca(),
                    SizedBox(
                      height: 14,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}