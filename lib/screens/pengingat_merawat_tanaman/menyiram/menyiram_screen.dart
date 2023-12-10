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

                PlantsList(
                  seeDetail: (){
                    plantProvider.seeDetailPlant(
                      context: context,
                      // idPlant: 1
                    );
                  },
                ),
              ],
            )
        );
      } ,
    );
  }
}

// import 'package:flutter/material.dart';
// import 'package:capstone_project/data/text_style/theme_text_style.dart';
// import 'package:capstone_project/screens/pengingat_merawat_tanaman/menyiram/time_menyiram_screen.dart';
// import '../../../widgets/pengingat_merawat_tanaman/card/card_tanaman_widget.dart';
// import '../../../widgets/pengingat_merawat_tanaman/text_field/text_field_search_widget.dart';

// class Menyiram extends StatefulWidget {
//   const Menyiram({Key? key}) : super(key: key);

//   @override
//   State<Menyiram> createState() => _MenyiramState();
// }

// class _MenyiramState extends State<Menyiram> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text(
//           "Tanaman Anda Menyiram",
//           style: ThemeTextStyle().appBar2,
//         ),
//         centerTitle: true,
//       ),
//       body: SingleChildScrollView(
//         child: Column(
//           children: [
//             Padding(
//               padding: const EdgeInsets.fromLTRB(20.0, 16.0, 20.0, 16.0),
//               child: Row(
//                 children: [
//                   const Expanded(
//                     child: SizedBox(
//                       height: 50.0,
//                       child: TextFieldSearchWidget(),
//                     ),
//                   ),
//                   const SizedBox(width: 10.0),
//                   GestureDetector(
//                     onTap: () {
//                     },
//                     child: const Image(image: AssetImage('assets/images/pengingat_merawat_tanaman/filter.png')),
//                   ),
//                 ],
//               ),
//             ),
//             const SizedBox(height: 30),
//             InkWell(
//               onTap: () {
//                 Navigator.push(
//                   context,
//                   MaterialPageRoute(
//                     builder: (context) => const TimeMenyiram(),
//                   ),
//                 );
//               },
//               child: const CardTanamanWidget(),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }