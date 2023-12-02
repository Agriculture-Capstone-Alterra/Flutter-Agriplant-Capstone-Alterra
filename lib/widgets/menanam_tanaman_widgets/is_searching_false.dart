import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../models/menanam_tanaman_model/plant_types_model.dart';
import '../../services/menanam_tanaman/plant_api.dart';

class IsSearchingFalse extends StatefulWidget {
  String headPlantTypeText;
  String allPlantNavigatorText;
  Function() allPlantNavigatorOnTap;
  String headLastPlantText;

  IsSearchingFalse({
    Key? key,
    required this.headPlantTypeText,
    required this.allPlantNavigatorText,
    required this.allPlantNavigatorOnTap,
    required this.headLastPlantText,
  }) : super(key: key);

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
                widget.headPlantTypeText,
                style: GoogleFonts.inter(
                    textStyle:
                    TextStyle(fontSize: 16, fontWeight: FontWeight.w600,)),
              ),

              GestureDetector(
                child: Text(
                  widget.allPlantNavigatorText,
                  style: GoogleFonts.inter(
                      textStyle:
                      TextStyle(fontWeight: FontWeight.w600, color: Colors.blueAccent,)),
                ),
                onTap: widget.allPlantNavigatorOnTap,
              )
            ],
          ),
        ),

        const SizedBox(height: 12,),

        StreamBuilder<PlantTypesModel>(
          stream: Stream.fromFuture(PlantApi().getPlantTypetList()),
          builder: (_, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(child: CircularProgressIndicator());
            } else if (snapshot.hasError) {
              return Center(child: Text('Error: ${snapshot.error}'));
            } else if (snapshot.hasData) {
              // Memeriksa apakah data yang diterima memiliki struktur yang sesuai
              if (snapshot.data != null) {
                PlantTypesModel plantData = snapshot.data!;
                return plantType(plantData.data);
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
              widget.headLastPlantText,
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

  Widget plantType(List<PlantList> plants){
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