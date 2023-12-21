import 'package:flutter/material.dart';
import '../../../models/plant_by_id_model.dart';

// ignore: must_be_immutable
class ImageSuggestion extends StatelessWidget {
  List plantingMediumImages;

  ImageSuggestion({Key? key, required this.plantingMediumImages}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 24),
      width: double.infinity,
      child: GridView.builder(
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        itemCount: plantingMediumImages.length,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          crossAxisSpacing: 8,
          mainAxisSpacing: 8,
        ),
        itemBuilder: (_, index) {
          PlantImage image = plantingMediumImages[index];
          return Container(
            padding: EdgeInsets.all(10),
            decoration: BoxDecoration(
                border: Border.all(color: Color(0xff9CA3AF), width: 1)
            ),
            child: SizedBox(
              width: MediaQuery.of(context).size.width/4.2,
              height: MediaQuery.of(context).size.width/4.2,
              child: Image.network(image.imagePath, fit: BoxFit.cover,),
            ),
          );
        },
      ),
    );
  }
}