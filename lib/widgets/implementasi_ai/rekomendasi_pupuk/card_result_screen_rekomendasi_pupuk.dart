import 'package:flutter/material.dart';
import 'package:capstone_project/screens/implementasi_ai/rekomendasi_tanaman/first_screen_rekomendasi_tanaman.dart';

class CardResultScreenRekomendasiPupuk extends StatelessWidget {
  const CardResultScreenRekomendasiPupuk({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          decoration: BoxDecoration(
            border: Border.all(
              color: Colors.grey,
              width: 2.0,
            ),
            borderRadius: BorderRadius.circular(10.0),
          ),
          margin: const EdgeInsets.all(12.0),
          padding: const EdgeInsets.symmetric(
            horizontal: 16.0,
            vertical: 8.0,
          ),
          child: Column(
            children: [
              const Text(
                'Nilai TextField dari screen sebelumnya: ',
                textAlign: TextAlign.justify,
              ),
              const SizedBox(height: 75),
              ElevatedButton(
                onPressed: () {
                  Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(
                      builder: (context) =>
                          const FirstScreenRekomendasiTanaman(),
                    ),
                    (route) => false,
                  );
                },
                style: ButtonStyle(
                  fixedSize: MaterialStateProperty.all(
                    const Size(
                      150.0,
                      25.0,
                    ),
                  ),
                  backgroundColor:
                      MaterialStateProperty.all(const Color(0xFF295646)),
                ),
                child: const Text(
                  "Selesai",
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
