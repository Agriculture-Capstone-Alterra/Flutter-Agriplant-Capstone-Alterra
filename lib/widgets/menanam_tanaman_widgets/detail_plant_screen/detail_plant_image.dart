import 'package:flutter/material.dart';

// ignore: must_be_immutable
class DetailPlantImage extends StatelessWidget {
  String image;

  DetailPlantImage({
    Key? key,
    required this.image,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: MediaQuery.of(context).size.height/3.5,
      child: Image.network(
        image,
        fit: BoxFit.cover,
      ),
    );
  }
}