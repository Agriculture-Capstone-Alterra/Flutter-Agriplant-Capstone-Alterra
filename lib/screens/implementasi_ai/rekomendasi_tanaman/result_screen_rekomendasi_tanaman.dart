import 'package:capstone_project/models/implementasi_ai_model/implementasi_ai_model.dart';
import 'package:capstone_project/widgets/implementasi_ai/rekomendasi_tanaman/card_result_screen_rekomendasi_tanaman.dart';
import 'package:flutter/material.dart';

class ResultScreenRekomendasiTanaman extends StatelessWidget {
  const ResultScreenRekomendasiTanaman(
      {Key? key, required ImplementasiAiModel response})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CardResultScreenRekomendasiTanaman(),
    );
  }
}
