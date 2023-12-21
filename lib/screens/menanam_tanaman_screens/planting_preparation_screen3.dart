import 'package:capstone_project/providers/plant_provider.dart';
import 'package:capstone_project/widgets/menanam_tanaman_widgets/planting_preparation_screen3/guide_item.dart';
import 'package:capstone_project/widgets/menanam_tanaman_widgets/planting_preparation_screen3/indicator3.dart';
import 'package:capstone_project/widgets/menanam_tanaman_widgets/planting_preparation_screen3/preparation3_text_head.dart';
import 'package:capstone_project/widgets/menanam_tanaman_widgets/skip_and_next_button.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import '../../models/plant_by_id_model.dart';
import '../../services/menanam_tanaman/plant_api.dart';

class PlantingPreparationScreen3 extends StatefulWidget {
  const PlantingPreparationScreen3({Key? key}) : super(key: key);

  @override
  State<PlantingPreparationScreen3> createState() => _PlantingPreparationScreen3State();
}

class _PlantingPreparationScreen3State extends State<PlantingPreparationScreen3> {
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
                  const SizedBox(
                    height: 24,
                  ),
                  Indicator3(
                    indicatorNumber1: plantProvider.indicatorNumber1,
                    indicatorNumber2: plantProvider.indicatorNumber2,
                    indicatorNumber3: plantProvider.indicatorNumber3,
                    indicatorNumber4: plantProvider.indicatorNumber4,
                    indicatorNumber5: plantProvider.indicatorNumber5,
                    indicatorNumber3Text: plantProvider.indicatorNumber3Text,
                    textColor: plantProvider.formTextColor,
                    indicatorBlockColor: plantProvider.indicatorBlockColor,
                  ),
                  const SizedBox(
                    height: 24,
                  ),
                  Preparation3TextHead(
                    plantingPreparation3TextHead: plantProvider.plantingPreparation3TextHead,
                  ),
                  const SizedBox(
                    height: 12,
                  ),
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
                            plantingGuidesList: plantByIdData.plantingGuides,
                            guideItemColor: plantProvider.itemColor,
                          );
                        } else {
                          return Center(child: Text('Data tidak valid.'));
                        }
                      } else {
                        return Center(
                          child: CircularProgressIndicator(),
                        );
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
                onTapSkip: (){},
                onTapLanjut: (){},
              ),
            ],
          ),
        );
      },
    );
  }

  Widget buildItem({
    required List plantingGuidesList,
    required Color guideItemColor,
  }){
    return ListView.builder(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      itemCount: plantingGuidesList.length,
      itemBuilder: (_, index){
        Planting plantingGuide = plantingGuidesList[index];
        return Column(
          children: [
            GuideItem(
              guideItemColor: guideItemColor,
              guideImage: plantingGuide.imagePath,
              guideName: plantingGuide.name,
              guideDesc: plantingGuide.description,
            ),

            const SizedBox(height: 12,),
          ],
        );
      },
    );
  }
}