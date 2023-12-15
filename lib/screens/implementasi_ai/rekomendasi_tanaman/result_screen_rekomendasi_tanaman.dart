import 'package:capstone_project/widgets/implementasi_ai/rekomendasi_tanaman/card_result_screen_rekomendasi_tanaman.dart';
import 'package:flutter/material.dart';

class ResultScreenRekomendasiTanaman extends StatelessWidget {
  final String resultText;

  const ResultScreenRekomendasiTanaman({
    Key? key,
    required this.resultText,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 12,
      ),
      body: WillPopScope(
        onWillPop: () async {
          return false;
        },
        child: CardResultScreenRekomendasiTanaman(resultText: resultText),
      ),
    );
  }
}
