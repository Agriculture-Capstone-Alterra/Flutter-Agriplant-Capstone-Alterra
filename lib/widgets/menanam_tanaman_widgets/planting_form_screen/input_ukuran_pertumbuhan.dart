import 'package:flutter/material.dart';

class InputUkuranPertumbuhan extends StatelessWidget {
  const InputUkuranPertumbuhan({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          margin: EdgeInsets.symmetric(horizontal: 15),
          width: double.infinity,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(4),
            border: Border.all(color: Colors.black),
          ),
          child: ExpansionTile(
            title: Text('Mengukur Pertumbuhan'),
            children: [
              Container(
                width: double.infinity,
                color: Colors.grey,
                child: Column(
                  children: [
                    Text('Berat'),
                    Text('Tinggi'),
                    Text('Jumlah'),
                  ],
                ),
              ),
            ],
          ),
        ),

        const SizedBox(height: 4,),

        Text('Pilih pengukuran yang sesuai untuk tanaman'),
      ],
    );
  }
}