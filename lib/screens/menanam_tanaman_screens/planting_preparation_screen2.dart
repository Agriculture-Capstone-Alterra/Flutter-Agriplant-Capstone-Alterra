import 'package:capstone_project/providers/plant_provider.dart';
import 'package:capstone_project/widgets/menanam_tanaman_widgets/planting_preparation_screen2/image_suggestion.dart';
import 'package:capstone_project/widgets/menanam_tanaman_widgets/planting_preparation_screen2/indicator2.dart';
import 'package:capstone_project/widgets/menanam_tanaman_widgets/planting_preparation_screen2/suggestions.dart';
import 'package:capstone_project/widgets/menanam_tanaman_widgets/skip_and_next_button.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import '../../models/plant_by_id_model.dart';
import '../../services/menanam_tanaman/plant_api.dart';

class PlantingPreparationScreen2 extends StatefulWidget {
  const PlantingPreparationScreen2({Key? key}) : super(key: key);

  @override
  State<PlantingPreparationScreen2> createState() => _PlantingPreparationScreen2State();
}

class _PlantingPreparationScreen2State extends State<PlantingPreparationScreen2> {
  @override
  Widget build(BuildContext context) {
    return Consumer<PlantProvider>(
      builder: (context, plantProvider, child) {
        return Scaffold(
          appBar: AppBar(
            title: Text(
              plantProvider.appBarPreparationText,
              style: GoogleFonts.inter(fontSize: 16, fontWeight: FontWeight.w600,),
            ),
          ),
          body: Stack(
            children: [
              ListView(
                children: [
                  const SizedBox(height: 24,),

                  Indicator2(
                    indicatorNumber1: plantProvider.indicatorNumber1,
                    indicatorNumber2: plantProvider.indicatorNumber2,
                    indicatorNumber3: plantProvider.indicatorNumber3,
                    indicatorNumber4: plantProvider.indicatorNumber4,
                    indicatorNumber5: plantProvider.indicatorNumber5,
                    indicatorNumber2Text: plantProvider.indicatorNumber2Text,
                    textColor: plantProvider.formTextColor,
                    indicatorBlockColor: plantProvider.indicatorBlockColor,
                  ),

                  const SizedBox(height: 21,),

                  StreamBuilder(
                    stream: Stream.fromFuture(
                        PlantApi().getPlantById(id: plantProvider.idPlant)),
                    builder: (_, snapshot) {
                      // if (snapshot.connectionState == ConnectionState.waiting) {
                      //   return Center(child: CircularProgressIndicator());
                      // } else
                      if (snapshot.hasError) {
                        return Center(child: Text('Error: ${snapshot.error}'));
                      } else if (snapshot.hasData) {
                        // Memeriksa apakah data yang diterima memiliki struktur yang sesuai
                        if (snapshot.data != null) {
                          PlantByIdModel plantByIdModel = snapshot.data! as PlantByIdModel;
                          PlantByIdData plantByIdData = plantByIdModel.data;
                          return buildItem(
                            textHead: plantProvider.plantingPreparation2TextHead,
                            plantingMediumSuggestions: plantByIdData.plantingMediumSuggestions,
                            plantingMediumImages: plantByIdData.plantingMediumImages,
                          );
                        } else {
                          return Center(child: Text('Data tidak valid.'));
                        }
                      } else {
                        return Center(child: CircularProgressIndicator(),);
                      }
                    },
                  ),
                ],
            ),

              SkipAndNextButton(
                skipButtonText: plantProvider.skipButtonText,
                lanjutButtonText: plantProvider.lanjutButtonText,
                skipButtonColor: plantProvider.skipButtonColor,
                lanjutButtonColor: plantProvider.menanamButtonColor,
                onTapSkip: (){plantProvider.onTapSkip(context: context);},
                onTapLanjut: (){plantProvider.goToPlantingPreparationScreen3(context: context);},
              )
            ],
          ),
        );
      },
    );
  }

  Widget buildItem({
    required String textHead,
    required String plantingMediumSuggestions,
    required List<PlantImage> plantingMediumImages,
  }){
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Suggestions(
          textHead: textHead,
          textBody: plantingMediumSuggestions,
        ),

        const SizedBox(height: 42,),

        ImageSuggestion(
          plantingMediumImages: plantingMediumImages,
        ),
      ],
    );
  }
}