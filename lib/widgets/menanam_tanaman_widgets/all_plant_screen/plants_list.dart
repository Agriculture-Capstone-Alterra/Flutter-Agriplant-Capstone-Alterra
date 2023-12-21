import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../models/all_plants_model.dart';
import '../../../services/menanam_tanaman/plant_api.dart';

// ignore: must_be_immutable
class PlantsList extends StatefulWidget {
  Function() seeDetail;

  PlantsList({
    Key? key,
    required this.seeDetail,
  }) : super(key: key);

  @override
  State<PlantsList> createState() => _PlantsListState();
}

class _PlantsListState extends State<PlantsList> {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: Stream.fromFuture(PlantApi().getAllPlants()),
      builder: (_, snapshot){
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(child: CircularProgressIndicator());
        } else if (snapshot.hasError) {
          return Center(child: Text('Error: ${snapshot.error}'));
        } else if (snapshot.hasData) {
          // Memeriksa apakah data yang diterima memiliki struktur yang sesuai
          if (snapshot.data != null) {
            AllPlantsModel plantData = snapshot.data!;
            return result(
              data: plantData.data,
              seeDetail: widget.seeDetail,
            );
          } else {
            return Center(child: Text('Data tidak valid.'));
          }
        } else {
          return Center(child: Text('Tidak ada data.'));
        }
      },
    );
  }

  Widget result({
    required List<PlantData> data,
    required Function(/*{required int id,}*/) seeDetail,
  }){
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 24),
      width: double.infinity,
      child: GridView.builder(
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          crossAxisSpacing: MediaQuery.of(context).size.width/18,
          mainAxisSpacing: MediaQuery.of(context).size.width/18,
        ),
        itemCount: data.length,
        itemBuilder: (_, index){
          final datum = data[index];
          return GestureDetector(
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
              ),
              child: Card(
                elevation: 6,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: GridTile(
                    child: Image.network(
                      datum.plantImageThumbnail,
                      fit: BoxFit.cover,
                    ),
                    footer:
                    Container(
                      padding: EdgeInsets.symmetric(vertical: 5),
                      color: Colors.white,
                      child: Center(
                        child: Text(
                          datum.name,
                          style: GoogleFonts.inter(fontSize: 12),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    )
                  ),
                ),
              ),
            ),
            onTap: seeDetail,
          );
        },
      ),
    );
  }
}