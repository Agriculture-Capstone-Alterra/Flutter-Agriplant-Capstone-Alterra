import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SearchPageProvider extends ChangeNotifier{
  bool _isSearching = false;
  bool get isSearching => _isSearching;

  String _hinText =  'Cari Tanaman';
  String get hinText => _hinText;

  bool _enableSearch = false;
  bool get enableSearch => _enableSearch;

  TextEditingController _searchController = TextEditingController();
  TextEditingController get searchController => _searchController;

  FocusNode _searchFocusNode = FocusNode();
  FocusNode get searchFocusNode => _searchFocusNode;

  // FocusNode searchFocusNode = FocusNode();

  void search() async{
    _isSearching = true;
    _enableSearch = true;
    // _searchFocusNode.requestFocus();
    notifyListeners();
  }

  bool setIsSearchingFalse(){
    notifyListeners();
    _enableSearch = false;
    return _isSearching = false;
  }
}