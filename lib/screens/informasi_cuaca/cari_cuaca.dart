import 'package:capstone_project/widgets/informasi_cuaca/header_cari.dart';
import 'package:capstone_project/widgets/informasi_cuaca/kota.dart';
import 'package:capstone_project/widgets/pengingat_merawat_tanaman/text_field/text_field_search_widget.dart';
import 'package:flutter/material.dart';

class CariCuaca extends StatefulWidget {
  const CariCuaca({super.key});

  @override
  State<CariCuaca> createState() => _CariCuacaState();
}

class _CariCuacaState extends State<CariCuaca> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Column(
          children: [
            HeaderCari(),
            SizedBox(
              height: 10,
            ),
            Padding(
              padding: EdgeInsets.only(left: 16, right: 14),
              child: TextFieldSearchWidget(),
            ),
            SizedBox(
              height: 10,
            ),
            KotaCuaca()
          ],
        ),
      ),
    );
  }
}
