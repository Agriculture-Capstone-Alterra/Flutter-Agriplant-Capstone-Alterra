import 'package:capstone_project/providers/plant_provider.dart';
import 'package:capstone_project/widgets/menanam_tanaman_widgets/planting_form_screen/button_input_form.dart';
import 'package:capstone_project/widgets/menanam_tanaman_widgets/planting_form_screen/form_head.dart';
import 'package:capstone_project/widgets/menanam_tanaman_widgets/planting_form_screen/input_jumlah_bibit.dart';
import 'package:capstone_project/widgets/menanam_tanaman_widgets/planting_form_screen/input_tanggal_menanam.dart';
import 'package:capstone_project/widgets/menanam_tanaman_widgets/planting_form_screen/input_ukuran_pertumbuhan.dart';
import 'package:capstone_project/widgets/menanam_tanaman_widgets/planting_form_screen/plant_image_form.dart';
import 'package:capstone_project/widgets/menanam_tanaman_widgets/planting_form_screen/plant_name.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../models/plant_by_id_model.dart';
import '../../services/menanam_tanaman/plant_api.dart';


class PlantingFormScreen extends StatefulWidget {
  const PlantingFormScreen({Key? key}) : super(key: key);

  @override
  State<PlantingFormScreen> createState() => _PlantingFormScreenState();
}

class _PlantingFormScreenState extends State<PlantingFormScreen> {
  @override
  Widget build(BuildContext context) {
    return Consumer<PlantProvider>(
      builder: (context, plantProvider, child){
        return Scaffold(
          appBar: AppBar(),
          body: StreamBuilder(
            stream: Stream.fromFuture(PlantApi().getPlantById(id: plantProvider.idPlant)),
            builder: (context, snapshot) {
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
                    provider: plantProvider,
                    plantImage: plantByIdData.plantImageThumbnail,
                    plantName: plantByIdData.name
                  );
                } else {
                  return Center(child: Text('Data tidak valid.'));
                }
              } else {
                return Center(child: CircularProgressIndicator());
              }
            },
          ),
        );
      },
    );
  }

  Widget buildItem({
    required dynamic provider, //data dari consumer bisa dikirim ke variabel provider tapi tidak efektif
    required String plantImage,
    required String plantName,
  }){
    return Consumer<PlantProvider>(
      builder: (context, plantProvider, child){
        return ListView(
          children: [
            PlantImageForm(image: plantImage),

            const SizedBox(height: 20,),

            PlantName(plantName: plantName),

            const SizedBox(height: 14,),

            FormHead(formTextHead: plantProvider.formTextHead),

            const SizedBox(height: 10,),

            InputJumlahBibit(
              jumlahBibitController: plantProvider.jumlahBibitController,
              jumlahBibitHint: plantProvider.jumlahBibitHint,
              jumlahBibitHintColor: plantProvider.jumlahBibitHintColor,
              jumlahBibitLabel: plantProvider.jumlahBibitLabel,
              jumlahBibitLabelColor: plantProvider.formTextColor,
              inputBibitWarntext: plantProvider.inputBibitWarntext,
              textFieldColor: plantProvider.formBorderColor,
            ),

            const SizedBox(height: 18,),

            InputUkuranPertumbuhan(
              inputUkuranPertumbuhanTextHead: plantProvider.inputUkuranPertumbuhanTextHead,
              formTextColor: plantProvider.formTextColor,
              formBorderColor: plantProvider.formBorderColor,
              radio1TitleText: plantProvider.radio1TitleText,
              radio2TitleText: plantProvider.radio2TitleText,
              radio3TitleText: plantProvider.radio3TitleText,
              radioValue: plantProvider.radioValue,
              inputUkuranPertumbuhanWarntext: plantProvider.inputUkuranPertumbuhanWarntext,
              onChangedRadioValue: (dynamic value){plantProvider.onChangedRadioValue(value);},
            ),

            const SizedBox(height: 18,),

            InputTanggalMenanam(
              formBorderColor: plantProvider.formBorderColor,
              date: plantProvider.formattedDate,
              chooseDate: (){return plantProvider.chooseDate(context);},
            ),

            const SizedBox(height: 25,),

            ButtonInputForm(
              menanamButtonColor: plantProvider.menanamButtonColor,
              menanamButtonText: plantProvider.menanamButtonText,
              onTap: ()=>plantProvider.goToPlantingPreparationScreen1(context: context),
            ),
            
            const SizedBox(height: 25,),
          ],
        );
      },
    );
  }
}