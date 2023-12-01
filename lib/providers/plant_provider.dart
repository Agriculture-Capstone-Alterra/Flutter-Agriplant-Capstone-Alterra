import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PlantProvider extends ChangeNotifier{
  String appBarText = 'Pilih Jenis Tanaman';

  //search field
  Icon searchIcon = Icon(Icons.search, color: Colors.black,);
  bool isSearching = false;
  String searchHinText =  'Cari Tanaman';
  bool enableSearch = false;
  TextEditingController searchController = TextEditingController();
  FocusNode searchFocusNode = FocusNode();

  // FocusNode searchFocusNode = FocusNode();

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

}