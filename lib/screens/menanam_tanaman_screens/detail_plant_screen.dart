import 'package:capstone_project/models/plant_by_id_model.dart';
import 'package:capstone_project/services/menanam_tanaman/plant_api.dart';
import 'package:capstone_project/widgets/menanam_tanaman_widgets/detail_plant_screen/detail_plant_image.dart';
import 'package:capstone_project/widgets/menanam_tanaman_widgets/detail_plant_screen/detail_plant_explanation.dart';
import 'package:capstone_project/widgets/menanam_tanaman_widgets/detail_plant_screen/informations.dart';
import 'package:capstone_project/widgets/menanam_tanaman_widgets/detail_plant_screen/mulai_menanam_button.dart';
import 'package:capstone_project/widgets/menanam_tanaman_widgets/detail_plant_screen/plant_times.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:intl/intl.dart';
import '../../providers/plant_provider.dart';
import '../../widgets/menanam_tanaman_widgets/detail_plant_screen/planting_guides.dart';
import '../../widgets/menanam_tanaman_widgets/detail_plant_screen/planting_tools.dart';

class DetailPlant extends StatefulWidget {
  const DetailPlant({Key? key}) : super(key: key);

  @override
  State<DetailPlant> createState() => _DetailPlantState();
}

class _DetailPlantState extends State<DetailPlant> {
  @override
  Widget build(BuildContext context) {
    return Consumer<PlantProvider>(
      builder: (context, plantProvider, child){
        return Scaffold(
          appBar: AppBar(
            title: Text(plantProvider.detailPlantAppBarText,style: GoogleFonts.inter(fontSize: 16, fontWeight: FontWeight.w600),),
          ),
          body: StreamBuilder(
            stream: Stream.fromFuture(PlantApi().getPlantById(id: plantProvider.idPlant)),
            builder: (_, snapshot){
              // if (snapshot.connectionState == ConnectionState.waiting) {
              //   return Center(child: CircularProgressIndicator());
              // } else
              if (snapshot.hasError) {
                return Center(child: Text('Error: ${snapshot.error}'));
              }else if (snapshot.hasData) {
                // Memeriksa apakah data yang diterima memiliki struktur yang sesuai
                if (snapshot.data != null){
                  PlantByIdModel plantByIdModel = snapshot.data! as PlantByIdModel;
                  PlantByIdData plantByIdData = plantByIdModel.data;
                  return buildItem(
                    provider: plantProvider,
                    id: plantByIdData.id,
                    image: plantByIdData.plantImageThumbnail,
                    plantName: plantByIdData.name,
                    aboutPlant: plantByIdData.description,
                    plantType: plantByIdData.plantType,
                    technology: plantByIdData.technology,
                    variety: plantByIdData.variety,
                    plantingToolsList: plantByIdData.plantingTools,
                    plantingGuidelsList: plantByIdData.plantingGuides,
                    drySeasonStartPlant: DateFormat.yMd().format(plantByIdData.drySeasonStartPlant),
                    drySeasonFinishPlant: DateFormat.yMd().format(plantByIdData.drySeasonFinishPlant),
                    rainySeasonStartPlant: DateFormat.yMd().format(plantByIdData.rainySeasonStartPlant),
                    rainySeasonFinishPlant: DateFormat.yMd().format(plantByIdData.rainySeasonFinishPlant),
                    aboutFertilizerTextHead: plantProvider.aboutFertilizerTextHead,
                    aboutPestTextHead: plantProvider.aboutPestTextHead,
                    fertilizerInfo: plantByIdData.fertilizerInfo,
                    pestInfo: plantByIdData.pestInfo,
                  );
                }else {
                  return Center(child: Text('Data tidak valid.'));
                }
              } else {
                return Center(child: CircularProgressIndicator(),);
              }
            }
          ),
        );
      },
    );
  }

  Widget buildItem({
    required dynamic provider,
    required int id,
    required String image,
    required String plantName,
    required String aboutPlant,
    required String plantType,
    required String technology,
    required String variety,
    required List<Planting> plantingToolsList,
    required List<Planting> plantingGuidelsList,
    required String drySeasonStartPlant,
    required String drySeasonFinishPlant,
    required String rainySeasonStartPlant,
    required String rainySeasonFinishPlant,
    required String aboutFertilizerTextHead,
    required String aboutPestTextHead,
    required String fertilizerInfo,
    required String pestInfo,
  }){
    return ListView(
      children: [
        DetailPlantImage(image: image),

        const SizedBox(
          height: 16,
        ),

        DetailPlantExplanation(
          aboutPlantColor: provider.aboutPlantColor,
          plantName: plantName,
          aboutPlant: aboutPlant,
          plantType: plantType,
          technology: technology,
          variety: variety,
          jenisTanamanIcon: provider.jenisTanamanIcon,
          techIcon: provider.techIcon,
          varietyIcon: provider.varietyIcon,
        ),

        const SizedBox(height: 46,),

        PlantingTools(
          toolTextHead: provider.toolTextHead,
          plantingToolsList: plantingToolsList,
        ),

        const SizedBox(height: 16,),

        PlantingGuides(
          guideTextHead: provider.guideTextHead,
          plantingGuidesList: plantingGuidelsList,
        ),

        const SizedBox(height: 16,),

        PlantTimes(
          headText: provider.musimTextHead,
          subHeadKemarau: provider.subHeadKemarau,
          subHeadHujan: provider.subHeadHujan,
          drySeasonStartPlant: drySeasonStartPlant,
          drySeasonFinishPlant: drySeasonFinishPlant,
          rainySeasonStartPlant: rainySeasonStartPlant,
          rainySeasonFinishPlant: rainySeasonFinishPlant,
        ),

        const SizedBox(height: 16,),

        Informations(
          aboutFertilizerTextHead: provider.aboutFertilizerTextHead,
          aboutPestTextHead: provider.aboutPestTextHead,
          fertilizerInfo: fertilizerInfo,
          pestInfo: pestInfo,
          customExpandedIconFertilizer: provider.customExpandedIconFertilizer,
          onExpansionChangedFertilizer: (bool expanded){provider.onExpansionChangedFertilizer(expanded);},
          customExpandedIconPest: provider.customExpandedIconPest,
          onExpansionChangedPest: (bool expanded){provider.onExpansionChangedPest(expanded);},
        ),

        const SizedBox(height: 28,),

        MulaiMenanamButton(
          mulaiMenanamButton: provider.mulaiMenanamButton,
          menanamButtonColor: provider.menanamButtonColor,
          onTap: (){
            provider.goToPlantingForm(
              context: context,
              // plantImagePlantingForm: image,
              // plantName = plantName,
            );
          },
        ),

        const SizedBox(height: 28,),
      ],
    );
  }
}