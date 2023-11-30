import 'package:capstone_project/data/menanam_tanaman/menanam_style.dart';
import 'package:capstone_project/providers/search_page_provider.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
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
    return Consumer<SearchPageProvider>(
      builder: (context, searchPageProvider, child) {
        return WillPopScope(
          child: Scaffold(
              appBar: searchPageProvider.isSearching==false?
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
                          searchPageProvider.isSearching==false?
                          Container() :
                          GestureDetector(
                            child: Container(
                              padding: EdgeInsets.only(left: 10),
                              child: Icon(Icons.arrow_back),
                            ),
                            onTap: (){searchPageProvider.setIsSearchingFalse();},
                          ),
                          Expanded(
                            child: SearchTanaman(
                              icon: Icon(Icons.search, color: Colors.black,),
                              searchController: searchPageProvider.searchController,
                              searchFocusNode: searchPageProvider.searchFocusNode,
                              hinText: searchPageProvider.hinText,
                              enableSearch: searchPageProvider.enableSearch,
                              onTap: (){
                                searchPageProvider.search();
                              },
                            ),
                          ),
                        ],
                      ),

                      Container(
                        margin: EdgeInsets.symmetric(horizontal: 40),
                        width: double.infinity,

                      )


                      // searchPageProvider.isSearching==false?
                      // IsSearchingFalse():
                      // IsSearchingTrue(),
                    ],
                  ),
                ),
              ),
          ),
          onWillPop: () async{
            // bool result = await searchPageProvider.setIsSearchingFalse();
            // return result;
            return await searchPageProvider.setIsSearchingFalse();
          },
        );
      } ,
    );
  }
}