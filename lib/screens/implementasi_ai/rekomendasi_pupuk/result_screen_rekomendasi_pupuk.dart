import 'package:capstone_project/widgets/implementasi_ai/rekomendasi_pupuk/card_result_screen_rekomendasi_pupuk.dart';
import 'package:flutter/material.dart';

class ResultScreenRekomendasiPupuk extends StatelessWidget {
  final String resultText;

  const ResultScreenRekomendasiPupuk({
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
        child: CardResultScreenRekomendasiPupuk(resultText: resultText),
      ),
    );
  }
}
