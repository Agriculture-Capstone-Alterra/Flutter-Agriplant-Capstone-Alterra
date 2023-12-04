import 'package:flutter/material.dart';

class DetailPlant extends StatefulWidget {
  const DetailPlant({Key? key}) : super(key: key);

  @override
  State<DetailPlant> createState() => _DetailPlantState();
}

class _DetailPlantState extends State<DetailPlant> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: ListView(
        children: [
          Center(child: Text('detail plant'),)
        ],
      ),
    );
  }
}
