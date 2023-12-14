import 'package:capstone_project/providers/plant_provider.dart';
import 'package:capstone_project/widgets/menanam_tanaman_widgets/all_plant_screen/search_all_plants.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import '../../models/all_plants_model.dart';
import '../../services/menanam_tanaman/plant_api.dart';

class AllPlantScreen extends StatefulWidget {
  const  AllPlantScreen({Key? key,}) : super(key: key);

  @override
  State<AllPlantScreen> createState() => _AllPlantScreenState();
}

class _AllPlantScreenState extends State<AllPlantScreen> {
  @override
  Widget build(BuildContext context) {
    return Consumer<PlantProvider>(
      builder: (context, plantProvider, child) {
        return Scaffold(
            appBar: AppBar(
              title: Text(plantProvider.AllPlantScreenAppBarText, style: GoogleFonts.inter(fontSize: 16, fontWeight: FontWeight.w600),),),
            body: ListView(
              children: [
                SearchAllPlant(
                  icon: plantProvider.searchIcon,
                  searchAllPlantController: plantProvider.searchAllPlantController,
                  searchAllPlantHint: plantProvider.searchAllPlantHint,
                  onChanged: (){},
                ),

                const SizedBox(height: 46,),

                // found(),

                // PlantsList(
                //   seeDetail: (){
                //     plantProvider.seeDetailPlant(
                //       context: context,
                //       // idPlant: 1
                //     );
                //   },
                // ),
                StreamBuilder(
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
                            itemCount: plantData.data.length,
                            itemBuilder: (_, index){
                              final datum = plantData.data[index];
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
                                onTap: (){
                                  plantProvider.seeDetailPlant(context: context, id: datum.id);
                                },
                                // onTap: seeDetail,
                              );
                            },
                          ),
                        );
                      } else {
                        return Center(child: Text('Data tidak valid.'));
                      }
                    } else {
                      return Center(child: Text('Tidak ada data.'));
                    }
                  },
                )
              ],
            )
        );
      } ,
    );
  }
}