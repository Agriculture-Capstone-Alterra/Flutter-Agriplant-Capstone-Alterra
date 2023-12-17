import 'package:capstone_project/providers/plant_provider.dart';
import 'package:capstone_project/widgets/menanam_tanaman_widgets/planting_form_screen/button_input_form.dart';
import 'package:capstone_project/widgets/menanam_tanaman_widgets/planting_form_screen/input_jumlah_bibit.dart';
import 'package:capstone_project/widgets/menanam_tanaman_widgets/planting_form_screen/input_tanggal_menanam.dart';
import 'package:capstone_project/widgets/menanam_tanaman_widgets/planting_form_screen/input_ukuran_pertumbuhan.dart';
import 'package:capstone_project/widgets/menanam_tanaman_widgets/planting_form_screen/plant_image_form.dart';
import 'package:capstone_project/widgets/menanam_tanaman_widgets/planting_form_screen/plant_name.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import '../../models/plant_by_id_model.dart';
import '../../services/plant_api.dart';


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
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Center(child: CircularProgressIndicator());
              } else if (snapshot.hasError) {
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
                return Center(child: Text('Tidak ada data.'));
              }
            },
          ),
        );
      },
    );
  }

  Widget buildItem({
    required dynamic provider,
    required String plantImage,
    required String plantName,
  }){
    return ListView(
      children: [
        PlantImageForm(image: plantImage),

        const SizedBox(height: 20,),

        PlantName(plantName: plantName),

        const SizedBox(height: 14,),

        //form input pengukuran
        Text(provider.formTextHead, style: GoogleFonts.inter(fontSize: 12, fontWeight: FontWeight.w700),),

        const SizedBox(height: 10,),

        InputJumlahBibit(
          jumlahBibitController: provider.jumlahBibitController,
          jumlahBibitHint: provider.jumlahBibitHint,
          jumlahBibitLabel: provider.jumlahBibitLabel,
        ),

        const SizedBox(height: 18,),

        InputUkuranPertumbuhan(),

        const SizedBox(height: 18,),

        InputTanggalMenanam(),

        const SizedBox(height: 25,),

        ButtonInputForm(),
      ],
    );
  }
}