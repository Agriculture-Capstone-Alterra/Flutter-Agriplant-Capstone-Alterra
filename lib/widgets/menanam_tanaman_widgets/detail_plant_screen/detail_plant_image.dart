import 'package:flutter/material.dart';

class DetailPlantImage extends StatelessWidget {
  String image;

  DetailPlantImage({
    Key? key,
    required this.image,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: MediaQuery.of(context).size.height/3.5,
      child: Image.network(
        image,
        fit: BoxFit.cover,
      ),
    );
  }
}