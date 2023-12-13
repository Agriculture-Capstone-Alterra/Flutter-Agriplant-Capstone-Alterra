import 'package:capstone_project/widgets/implementasi_ai/rekomendasi_pupuk/card_result_screen_rekomendasi_pupuk.dart';
import 'package:flutter/material.dart';

class ResultScreenRekomendasiPupuk extends StatefulWidget {
  final String data;
  const ResultScreenRekomendasiPupuk({super.key, required this.data});

  @override
  State<ResultScreenRekomendasiPupuk> createState() =>
      _ResultScreenRekomendasiPupukState();
}

class _ResultScreenRekomendasiPupukState
    extends State<ResultScreenRekomendasiPupuk> {
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        return false;
      },
      child: const Scaffold(
        body: Center(
          child: SingleChildScrollView(
            child: CardResultScreenRekomendasiPupuk(),
          ),
        ),
      ),
    );
  }
}
