import 'package:capstone_project/models/menanam_tanaman_model/plant_by_id_model.dart';
import 'package:capstone_project/services/menanam_tanaman/plant_api.dart';
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
                      PlantByIdModel data = snapshot.data!;
                      return Text('$data');
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
}