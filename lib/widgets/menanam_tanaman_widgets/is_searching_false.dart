import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../data/menanam_tanaman/menanam_tanaman_data.dart';
import '../../models/menanam_tanaman_model/menanam_tanaman_model.dart';
import '../../models/menanam_tanaman_model/plant_types_model.dart';
import '../../services/plant_api.dart';

class IsSearchingFalse extends StatefulWidget {
  const IsSearchingFalse({Key? key}) : super(key: key);

  @override
  State<IsSearchingFalse> createState() => _IsSearchingFalseState();
}

class _IsSearchingFalseState extends State<IsSearchingFalse> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 12,),

        Container(
          margin: EdgeInsets.symmetric(horizontal: 16),
          width: double.infinity,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Jenis Tanaman',
                style: GoogleFonts.inter(
                    textStyle:
                    TextStyle(fontSize: 16, fontWeight: FontWeight.w600,)),
              ),

              Text(
                'lihat semua',
                style: GoogleFonts.inter(
                    textStyle:
                    TextStyle(fontWeight: FontWeight.w600, color: Colors.blueAccent,)),
              )
            ],
          ),
        ),

        const SizedBox(height: 12,),

        StreamBuilder<PlantTypesModel>(
          stream: Stream.fromFuture(PlantApi().getPlantList()),
          builder: (_, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(child: CircularProgressIndicator());
            } else if (snapshot.hasError) {
              return Center(child: Text('Error: ${snapshot.error}'));
            } else if (snapshot.hasData) {
              // Memeriksa apakah data yang diterima memiliki struktur yang sesuai
              if (snapshot.data != null) {
                PlantTypesModel plantData = snapshot.data!;
                return plantList(plantData.data);
              } else {
                return Center(child: Text('Data tidak valid.'));
              }
            } else {
              return Center(child: Text('Tidak ada data.'));
            }
          },
        ),

        const SizedBox(height: 12,),

        Align(
          alignment: Alignment.bottomLeft,
          child: Container(
            margin: EdgeInsets.symmetric(horizontal: 16),
            width: double.infinity,
            child: Text(
              'Tanaman Terakhir',
              style: GoogleFonts.inter(
                textStyle: TextStyle(
                  fontSize: 16, fontWeight: FontWeight.w600,
                )
              )
            ),
          ),
        ),

        const SizedBox(height: 12,),
      ],
    );
  }

  Widget plantList(List<PlantList> plants){
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 40),
      width: double.infinity,
      child: GridView.builder(
        itemCount: plants.length,
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3,),
        itemBuilder: (_, index){
          final plant = plants[index];
          return Text(
            plant.name,
            textAlign: TextAlign.center,
          );
        },
      ),
    );
  }
}