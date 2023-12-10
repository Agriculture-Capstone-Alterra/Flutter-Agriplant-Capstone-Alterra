import 'package:capstone_project/screens/menanam_tanaman_screens/all_plant_screen.dart';
import 'package:capstone_project/screens/menanam_tanaman_screens/detail_plant_screen.dart';
import 'package:capstone_project/services/menanam_tanaman/plant_api.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PlantProvider extends ChangeNotifier{
  String appBarText = 'Pilih Jenis Tanaman';
  Icon searchIcon = Icon(Icons.search, color: Colors.black,);

  //search field
  bool isSearching = false;
  bool seeAllPlantType = false;
  String searchHinText =  'Cari Tanaman';
  bool enableSearch = false;
  TextEditingController searchController = TextEditingController();
  FocusNode searchFocusNode = FocusNode();

  // FocusNode searchFocusNode = FocusNode();

  String headPlantTypeText = 'Jenis Tanaman';
  String allPlantNavigatorText = 'Lihat semua';

  void allPlantNavigatorOnTap(BuildContext context) async{
    // seeAllPlantType = true;
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => AllPlantScreen()),
    );
    notifyListeners();
  }

  bool setSeeAllPlantTypeFalse(){
    notifyListeners();
    return seeAllPlantType = false;
  }

  String headLastPlantText = 'Tanaman Terakhir';

  void search() async{
    isSearching = true;
    enableSearch = true;
    // _searchFocusNode.requestFocus();
    notifyListeners();
  }

  bool setIsSearchingFalse(){
    notifyListeners();
    enableSearch = false;
    return isSearching = false;
  }

  //IsSearchingFalse

  //see all plant
  String AllPlantScreenAppBarText = 'Semua Tanaman';
  TextEditingController searchAllPlantController = TextEditingController();
  String searchAllPlantHint = 'Cari tanaman';
  int idPlant = 0;

  void seeDetailPlant({
    required BuildContext context,
    int? id,
    // required int idPlant,
  }) async{
    try{
      this.idPlant = id!;
      await PlantApi().getPlantById(id: idPlant);
      print('id : $id');
      notifyListeners();
    }catch(e){}
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => DetailPlant())
    );
    // idPlant = this.idPlant;
    notifyListeners();
  }

  //detail plant by id
  String detailPlantAppBarText = 'Detail Halaman';
  String anjing = 'anjing';
}