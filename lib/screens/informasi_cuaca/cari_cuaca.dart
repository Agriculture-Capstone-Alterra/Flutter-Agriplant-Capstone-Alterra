import 'package:capstone_project/widgets/informasi_cuaca/header_cari.dart';
import 'package:capstone_project/widgets/informasi_cuaca/kota.dart';
import 'package:flutter/material.dart';

class CariCuaca extends StatefulWidget {
  final String currentPlace;
  final double currentTemperature;
  const CariCuaca({
    super.key,
    required this.currentPlace,
    required this.currentTemperature,
  });

  @override
  State<CariCuaca> createState() => _CariCuacaState();
}

class _CariCuacaState extends State<CariCuaca> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SingleChildScrollView(
        child: Column(
          children: [
            const HeaderCari(),
            const SizedBox(
              height: 10,
            ),
            const Padding(
              padding: EdgeInsets.only(left: 16, right: 14),
            ),
            const SizedBox(
              height: 10,
            ),
            KotaCuaca(
              currentPlace: widget.currentPlace,
              currentTemperature: widget.currentTemperature,
            )
          ],
        ),
      ),
    );
  }
}
