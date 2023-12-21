import 'package:capstone_project/widgets/menanam_tanaman_widgets/planting_preparation_screen1/indicator1.dart';
import 'package:capstone_project/widgets/menanam_tanaman_widgets/planting_preparation_screen1/preparation1_text_head.dart';
import 'package:capstone_project/widgets/menanam_tanaman_widgets/skip_and_next_button.dart';
import 'package:capstone_project/widgets/menanam_tanaman_widgets/planting_preparation_screen1/tool_item.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import '../../models/plant_by_id_model.dart';
import '../../providers/plant_provider.dart';
import '../../services/menanam_tanaman/plant_api.dart';

class PlantingPreparationScreen1 extends StatefulWidget {
  const PlantingPreparationScreen1({Key? key}) : super(key: key);

  @override
  State<PlantingPreparationScreen1> createState() => _PlantingPreparationScreen1State();
}

class _PlantingPreparationScreen1State extends State<PlantingPreparationScreen1> {
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

                  Indicator1(
                    indicatorNumber1: plantProvider.indicatorNumber1,
                    indicatorNumber2: plantProvider.indicatorNumber2,
                    indicatorNumber3: plantProvider.indicatorNumber3,
                    indicatorNumber4: plantProvider.indicatorNumber4,
                    indicatorNumber5: plantProvider.indicatorNumber5,
                    indicatorNumber1Text: plantProvider.indicatorNumber1Text,
                    textColor: plantProvider.formTextColor,
                  ),

                  const SizedBox(height: 24,),

                  PreparationTextHead1(plantingPreparation1TextHead: plantProvider.plantingPreparation1TextHead,),

                  const SizedBox(height: 12,),

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
                            plantingToolsList: plantByIdData.plantingTools,
                            toolItemColor: plantProvider.itemColor,
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
                onTapSkip: (){plantProvider.onTapSkip(context: context);},
                onTapLanjut: (){plantProvider.goToPlantingPreparationScreen2(context: context);},
              )
            ],
          ),
        );
      },
    );
  }

  Widget buildItem({
    required List<Planting> plantingToolsList,
    required Color toolItemColor
  }){
    return ListView.builder(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      itemCount: plantingToolsList.length,
      itemBuilder: (_, index) {
        Planting plantingTool = plantingToolsList[index];
        return Column(
          children: [
            ToolItem(
              toolItemColor: toolItemColor,
              toolImage: plantingTool.imagePath,
              toolName: plantingTool.name,
              toolDesc: plantingTool.description,
            ),

            const SizedBox(height: 12,),
          ],
        );
      },
    );
  }
}