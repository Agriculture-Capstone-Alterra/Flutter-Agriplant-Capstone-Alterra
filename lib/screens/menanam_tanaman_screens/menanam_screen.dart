import 'package:capstone_project/data/menanam_tanaman/menanam_style.dart';
import 'package:capstone_project/providers/plant_provider.dart';
import 'package:capstone_project/services/plant_api.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import '../../models/menanam_tanaman_model/plant_types_model.dart';
import '../../widgets/menanam_tanaman_widgets/is_searching_false.dart';
import '../../widgets/menanam_tanaman_widgets/is_searching_true.dart';
import '../../widgets/menanam_tanaman_widgets/search_tanaman.dart';

class Menanam extends StatefulWidget {
  const Menanam({Key? key}) : super(key: key);

  @override
  State<Menanam> createState() => _MenanamState();
}

class _MenanamState extends State<Menanam> {
  @override
  Widget build(BuildContext context) {
    // final searchProvider = Provider.of<SearchPageProvider>(context);
    return Consumer<PlantProvider>(
      builder: (context, plantProvider, child) {
        return WillPopScope(
          child: Scaffold(
              appBar: plantProvider.isSearching==false?
              AppBar(
                title: Text(
                  'Pilih Jenis Tanaman',
                  style: GoogleFonts.inter(textStyle: TextStyle(fontSize: 16, fontWeight: FontWeight.w600, color: Colors.white)),
                ),
                centerTitle: true,
                backgroundColor: MenanamStyle.mainColor,
              ) :
              PreferredSize(preferredSize: Size.fromHeight(0), child: AppBar(backgroundColor: MenanamStyle.mainColor,)),

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
                          ),
                          Expanded(
                            child: SearchTanaman(
                              icon: Icon(Icons.search, color: Colors.black,),
                              searchController: plantProvider.searchController,
                              searchFocusNode: plantProvider.searchFocusNode,
                              hinText: plantProvider.hinText,
                              enableSearch: plantProvider.enableSearch,
                              onTap: (){
                                plantProvider.search();
                              },
                            ),
                          ),
                        ],
                      ),

                      plantProvider.isSearching==false?
                      IsSearchingFalse():
                      IsSearchingTrue(),
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