import 'package:capstone_project/providers/plant_provider.dart';
import 'package:capstone_project/widgets/menanam_tanaman_widgets/all_plant_screen/plants_list.dart';
import 'package:capstone_project/widgets/menanam_tanaman_widgets/all_plant_screen/search_all_plants.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

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

                PlantsList(),
              ],
            )
        );
      } ,
    );
  }
}


