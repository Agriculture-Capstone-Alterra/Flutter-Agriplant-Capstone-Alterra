import 'package:capstone_project/models/all_plants_model.dart';
import 'package:capstone_project/providers/plant_reminder_provider.dart';
import 'package:capstone_project/services/menanam_tanaman/plant_api.dart';
import 'package:capstone_project/widgets/pengingat_merawat_tanaman/text_field/search_reminder_widget.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class PlantReminder extends StatefulWidget {
  const  PlantReminder({Key? key,}) : super(key: key);

  @override
  State<PlantReminder> createState() => _PlantReminderState();
}

class _PlantReminderState extends State<PlantReminder> {
  @override
  Widget build(BuildContext context) {
    return Consumer<PlantReminderProvider>(
      builder: (context, plantReminderProvider, child) {
        return Scaffold(
            appBar: AppBar(
              centerTitle: true,
              title: Text(plantReminderProvider.PlantReminderAppBarText, style: GoogleFonts.inter(fontSize: 20, fontWeight: FontWeight.w600),
              ),
            ),
            body: ListView(
              children: [
                SearchAllPlants(), // search
                const SizedBox(height: 46,),
                StreamBuilder(
                  stream: Stream.fromFuture(PlantApi().getAllPlants()),
                  builder: (_, snapshot){
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return const Center(child: CircularProgressIndicator());
                    } else if (snapshot.hasError) {
                      return Center(child: Text('Error: ${snapshot.error}'));
                    } else if (snapshot.hasData) {
                      if (snapshot.data != null) {
                        AllPlantsModel plantData = snapshot.data!;
                        return Container(
                          margin: const EdgeInsets.symmetric(horizontal: 24),
                          width: double.infinity,
                          child: GridView.builder(
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 3,
                              crossAxisSpacing: MediaQuery.of(context).size.width/18,
                              mainAxisSpacing: MediaQuery.of(context).size.width/18,
                            ),
                            itemCount: plantData.data.length,
                            itemBuilder: (_, index){
                              final datum = plantData.data[index];
                              //search
                              final bool matchesSearch = datum.name.toLowerCase().contains(plantReminderProvider.searchQuery.toLowerCase());
                              if (!matchesSearch) {
                              return Container(); 
                              }
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
                                          // ignore: sort_child_properties_last
                                          child: Image.network(
                                            datum.plantImageThumbnail,
                                            fit: BoxFit.cover,
                                          ),
                                          footer:
                                          Container(
                                            padding: const EdgeInsets.symmetric(vertical: 5),
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
                                  plantReminderProvider.seeDetaiReminder(context: context, id: datum.id);
                                },
                                // onTap: seeDetail,
                              );
                            },
                          ),
                        );
                      } else {
                        return const Center(child: Text('Data tidak valid.'));
                      }
                    } else {
                      return const Center(child: Text('Tidak ada data.'));
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