import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AppOpeningProvider extends ChangeNotifier {
  bool splashScreen = true;
  int splashScreenVal = 1;

  void splashScreenIsChanged() async {
    await Future.delayed(Duration(seconds: 3));
    splashScreenVal = 2;
    notifyListeners();
  }

  void splashScreenDone() async {
    await Future.delayed(Duration(seconds: 6));
    splashScreen = false;
    notifyListeners();
  }

  PageController pageController = PageController();
  String feature1Image = 'assets/images/app opening images/Deskripsi Fitur 1.png';
  String feature1Name = 'Info Cuaca Terkini';
  String feature1Desc = 'Mendapatkan informasi cuaca terkini sesuai lokasi yang diinginkan dan dapat mengetahui 7 hari ke depan';
  String feature2Image = 'assets/images/app opening images/Deskripsi Fitur 2.png';
  String feature2name = 'Menanam Tanaman';
  String feature2Desc = 'Dapat menanam tanaman yang diinginkan beserta informasi menanam yang kamu butuhkan';
  String feature3Image = 'assets/images/app opening images/Deskripsi Fitur 3.png';
  String feature3name = 'Pengingat Merawat Tanaman';
  Color colorFeatureText = Colors.white;
  String buttonText1 = 'Selanjutnya';
  String buttonText2 = 'Mulai';
  Color buttonColor = Color(0xff51AB8C);
  Color buttonTextColor = Colors.white;
  void nextPage(){
    if(pageController!=2){
      notifyListeners();
    }
    notifyListeners();
  }
}