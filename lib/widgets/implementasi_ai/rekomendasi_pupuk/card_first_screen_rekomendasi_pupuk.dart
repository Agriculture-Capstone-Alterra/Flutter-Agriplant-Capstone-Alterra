import 'package:capstone_project/screens/implementasi_ai/rekomendasi_tanaman/result_screen_rekomendasi_tanaman.dart';
import 'package:capstone_project/services/implementasi_ai/implementasi_ai_api.dart';
import 'package:flutter/material.dart';

class CardFirstScreenRekomendasiPupuk extends StatelessWidget {
  final TextEditingController _textFieldController = TextEditingController();

  CardFirstScreenRekomendasiPupuk({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 150.0),
        child: Container(
          decoration: BoxDecoration(
            border: Border.all(
              color: Colors.grey,
            ),
            borderRadius: BorderRadius.circular(10),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: 200,
                height: 200,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Image.asset(
                  'assets/images/implementasi_ai/tanaman.png',
                  width: 350.0,
                  height: 350.0,
                ),
              ),
              const SizedBox(height: 16),
              const Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: 8.0,
                ),
                child: Text(
                  'Memberikan rekomendasi jenis dan jumlah pupuk yang tepat untuk tanaman',
                  style: TextStyle(
                    fontSize: 18.7,
                  ),
                  textAlign: TextAlign.justify,
                ),
              ),
              const SizedBox(height: 16),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12),
                child: TextField(
                  controller: _textFieldController,
                  decoration: const InputDecoration(
                    hintText: 'Masukkan nama tanaman',
                    border: OutlineInputBorder(),
                  ),
                ),
              ),
              const SizedBox(height: 16),
              ElevatedButton(
                onPressed: () async {
                  try {
                    final result = await ImplementasiAiAPI().rekomendasiPupuk(
                      message: _textFieldController.text,
                    );
                    Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ResultScreenRekomendasiTanaman(
                            resultText: result.data.response),
                      ),
                      (route) => false,
                    );
                  } catch (e) {
                    rethrow;
                  }
                },
                style: ElevatedButton.styleFrom(
                  fixedSize: const Size(220, 50),
                  backgroundColor: const Color(0xFF295646),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(
                      10.0,
                    ),
                  ),
                ),
                child: const Text(
                  'Cari',
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
              ),
              const SizedBox(height: 8),
            ],
          ),
        ),
      ),
    );
  }
}
