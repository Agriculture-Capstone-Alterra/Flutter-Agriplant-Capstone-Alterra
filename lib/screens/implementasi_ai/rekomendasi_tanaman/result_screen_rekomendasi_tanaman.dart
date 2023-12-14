import 'package:capstone_project/screens/implementasi_ai/rekomendasi_tanaman/first_screen_rekomendasi_tanaman.dart';
import 'package:capstone_project/widgets/implementasi_ai/rekomendasi_tanaman/card_result_screen_rekomendasi_tanaman.dart';
import 'package:flutter/material.dart';

class ResultScreenRekomendasiTanaman extends StatelessWidget {
  const ResultScreenRekomendasiTanaman({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        return false;
      },
      child: Scaffold(
        body: CardResultScreenRekomendasiTanaman(),
      ),
    );
  }
}
