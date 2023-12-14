import 'package:capstone_project/screens/implementasi_ai/rekomendasi_pupuk/result_screen_rekomendasi_pupuk.dart';
import 'package:capstone_project/screens/implementasi_ai/rekomendasi_tanaman/result_screen_rekomendasi_tanaman.dart';
import 'package:flutter/material.dart';

class CardFirstScreenRekomendasiTanaman extends StatelessWidget {
  final TextEditingController _textFieldController = TextEditingController();

  CardFirstScreenRekomendasiTanaman({Key? key}) : super(key: key);

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
                child: Image.asset('assets/images/implementasi_ai/Logo.png'),
              ),
              const SizedBox(height: 16),
              const Text(
                'Cari tanaman yang ingin diketahui',
                style: TextStyle(
                  fontSize: 20,
                ),
              ),
              const SizedBox(height: 16),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12),
                child: TextField(
                  controller: _textFieldController,
                  decoration: const InputDecoration(
                    hintText: 'Masukkan nama Tanaman',
                    border: OutlineInputBorder(),
                  ),
                ),
              ),
              const SizedBox(height: 16),
              ElevatedButton(
                onPressed: () {
                  Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(
                      builder: (context) =>
                          const ResultScreenRekomendasiTanaman(),
                    ),
                    (route) => false,
                  );
                },
                style: ElevatedButton.styleFrom(
                  fixedSize: const Size(220, 50),
                  backgroundColor: const Color(0xFF295646),
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
