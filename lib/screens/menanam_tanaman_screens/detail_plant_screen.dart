import 'package:capstone_project/models/menanam_tanaman_model/plant_by_id_model.dart';
import 'package:capstone_project/services/menanam_tanaman/plant_api.dart';
import 'package:capstone_project/widgets/menanam_tanaman_widgets/detail_plant_screen/detail_plant_image.dart';
import 'package:capstone_project/widgets/menanam_tanaman_widgets/detail_plant_screen/detail_plant_explanation.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import '../../providers/plant_provider.dart';

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
          body: ListView(
            children: [
              StreamBuilder(
                stream: Stream.fromFuture(PlantApi().getPlantById(id: plantProvider.idPlant)),
                builder: (_, snapshot){
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return Center(child: CircularProgressIndicator());
                  } else if (snapshot.hasError) {
                    return Center(child: Text('Error: ${snapshot.error}'));
                  }else if (snapshot.hasData) {
                    // Memeriksa apakah data yang diterima memiliki struktur yang sesuai
                    if (snapshot.data != null){
                      PlantByIdModel plantByIdModel = snapshot.data! as PlantByIdModel;
                      // PlantImage plantImage = plantByIdModel.

                      PlantByIdData plantByIdData = plantByIdModel.data;
                      return buildItem(
                        provider: plantProvider,
                        image: plantByIdData.plantImageThumbnail,
                        plantName: plantByIdData.name,
                        aboutPlant: plantByIdData.description,
                        plantingTools: plantByIdData.plantingTools,
                        plantType: plantByIdData.plantType,
                        technology: plantByIdData.technology,
                        variety: plantByIdData.variety,
                      );
                    }else {
                      return Center(child: Text('Data tidak valid.'));
                    }
                  } else {
                    return Center(child: Text('Tidak ada data.'));
                  }
                }
              )
            ],
          ),
        );
      },
    );
  }

  Widget buildItem({
    required dynamic provider,
    required String image,
    required String plantName,
    required String aboutPlant,
    required String plantType,
    required String technology,
    required String variety,
    required List plantingTools,
  }){
    return Column(
      children: [
        DetailPlantImage(image: image),

        const SizedBox(height: 16,),

        DetailPlantExplanation(
          aboutPlantColor: provider.aboutPlantColor,
          plantName: plantName,
          aboutPlant: aboutPlant,
          plantType: plantType,
          technology: technology,
          variety: variety,
        ),

        const SizedBox(height: 46,),


      ],
    );
  }
}