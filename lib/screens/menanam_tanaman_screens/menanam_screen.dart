import 'package:capstone_project/data/menanam_tanaman/menanam_style.dart';
import 'package:capstone_project/providers/plant_provider.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import '../../widgets/menanam_tanaman_widgets/menanam_screen/is_searching_false.dart';
import '../../widgets/menanam_tanaman_widgets/menanam_screen/is_searching_true.dart';
import '../../widgets/menanam_tanaman_widgets/menanam_screen/search_tanaman.dart';

class MenanamScreen extends StatefulWidget {
  const MenanamScreen({Key? key}) : super(key: key);

  @override
  State<MenanamScreen> createState() => _MenanamScreenState();
}

class _MenanamScreenState extends State<MenanamScreen> {
  @override
  Widget build(BuildContext context) {
    // final searchProvider = Provider.of<SearchPageProvider>(context);
    return Consumer<PlantProvider>(
      builder: (context, plantProvider, child) {
        return WillPopScope(
          child: Scaffold(
              appBar: plantProvider.isSearching==false && plantProvider.seeAllPlantType==false?
              AppBar(
                title: Text(
                  plantProvider.appBarText,
                  style: GoogleFonts.inter(textStyle: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600, color: Colors.white)),
                ),
                centerTitle: true,
                backgroundColor: MenanamStyle.mainColor,
              ) :
              PreferredSize(preferredSize: const Size.fromHeight(0), child: AppBar(backgroundColor: MenanamStyle.mainColor,)),

              body: Material(
                color: MenanamStyle.mainColor,
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(topRight: Radius.circular(20), topLeft: Radius.circular(20)),
                    color: Colors.white,
                  ),
                  child: ListView(
                    children: [
                      const SizedBox(height: 20,),

                      Row(
                        children: [
                          plantProvider.isSearching==false?
                          Container() :
                          GestureDetector(
                            child: Container(
                              padding: EdgeInsets.only(left: 10),
                              child: Icon(Icons.arrow_back),
                            ),
                            onTap: (){plantProvider.setIsSearchingFalse();},
                          ) ,
                          Expanded(
                            child: SearchTanaman(
                              icon: plantProvider.searchIcon,
                              searchController: plantProvider.searchController,
                              searchFocusNode: plantProvider.searchFocusNode,
                              searchHinText: plantProvider.searchHinText,
                              enableSearch: plantProvider.enableSearch,
                              formOnTap: (){plantProvider.search();},
                            ),
                          ),
                        ],
                      ),

                      plantProvider.isSearching==false?
                      IsSearchingFalse(
                        headPlantTypeText: plantProvider.headPlantTypeText,
                        allPlantNavigatorText: plantProvider.allPlantNavigatorText,
                        allPlantNavigatorOnTap: (){plantProvider.allPlantNavigatorOnTap(context);},
                        recomendPlantHeadText: plantProvider.recomendPlantHeadText,
                      ) :
                      // plantProvider.isSearching==false && plantProvider.seeAllPlantType==true?
                      // AllPlantScreen(appBarText: 'Tanaman',) :
                      IsSearchingTrue()
                          // : IsSearchingTrue(),
                    ],
                  ),
                ),
              ),
          ),
          onWillPop: () async{
            // bool result = await searchPageProvider.setIsSearchingFalse();
            // return result;
            return await plantProvider.setIsSearchingFalse();
          },
        );
      } ,
    );
  }
}