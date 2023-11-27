import 'package:capstone_project/data/home_text_style.dart';
import 'package:flutter/material.dart';

class TambahTanaman extends StatelessWidget {
  const TambahTanaman({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: BodyLarge(text: 'Tambah Tanaman'),
      ),
      body: Center(
        child: BodyLarge(text: 'Tambah Tanaman Page'),
      ),
    );
  }
}
