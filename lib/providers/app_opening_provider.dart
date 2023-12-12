import 'package:flutter/material.dart';
import '../screens/autentikasi_screens/login_screen.dart';

class AppOpeningProvider extends ChangeNotifier {
  String splashScreen1Image = 'assets/images/app opening images/Logo.png';
  String splashScreen2Image1 = 'assets/images/app opening images/Logo 2.png';
  String splashScreen2Image2 = 'assets/images/app opening images/Tangan 1.png';
  String splashScreen2Image3 = 'assets/images/app opening images/Tangan 2.png';

  bool splashScreen = true;
  int splashScreenVal = 1;

  void splashScreenIsChanged() async {
    await Future.delayed(Duration(seconds: 4));
    splashScreenVal = 2;
    notifyListeners();
  }

  void splashScreenDone() async {
    await Future.delayed(Duration(seconds: 8));
    splashScreen = false;
    notifyListeners();
  }

  PageController pageController = PageController();
  String skipText = 'Lewati';
  Color skipTextColor = Colors.white;

  void skipToLoginScreen(BuildContext context){
    Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(builder: (context){
        return LoginScreen();
      }), (_) => false,
    );
    notifyListeners();
  }

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
  Color buttonColor = const Color(0xff51AB8C);
  Color buttonTextColor = Colors.white;
  void nextPage(BuildContext context){
    if(pageController.page!=2){
      pageController.nextPage(duration: Duration(seconds: 1), curve: Curves.ease);
      notifyListeners();
    } else{
      skipToLoginScreen(context);

      notifyListeners();
    }
    notifyListeners();
  }
}