import 'package:capstone_project/widgets/implementasi_ai/rekomendasi_tanaman/card_result_screen_rekomendasi_tanaman.dart';
import 'package:flutter/material.dart';

class ResultScreenRekomendasiTanaman extends StatefulWidget {
  const ResultScreenRekomendasiTanaman({super.key});

  @override
  State<ResultScreenRekomendasiTanaman> createState() =>
      _ResultScreenRekomendasiTanamanState();
}

class _ResultScreenRekomendasiTanamanState
    extends State<ResultScreenRekomendasiTanaman> {
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        return false;
      },
      child: const Scaffold(
        body: Center(
          child: SingleChildScrollView(
            child: CardResultScreenRekomendasiTanaman(
              data: '',
            ),
          ),
        ),
      ),
    );
  }
}
