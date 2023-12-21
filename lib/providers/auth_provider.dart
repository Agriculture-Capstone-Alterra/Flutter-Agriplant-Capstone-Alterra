import 'package:capstone_project/screens/autentikasi_screens/send_otp_screen.dart';
import 'package:capstone_project/screens/autentikasi_screens/regist_screen.dart';
import 'package:capstone_project/screens/navigation_bar.dart';
import 'package:capstone_project/services/auth_api.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import '../screens/autentikasi_screens/login_screen.dart';

class AuthProvider extends ChangeNotifier {
  Color mainColor = const Color(0xff51AB8C);
  FirebaseMessaging firebaseMessaging = FirebaseMessaging.instance;
  String firebaseDeviceToken = 'null';

  void pop(BuildContext context){
    Navigator.of(context).pop();
    notifyListeners();
  }

  //untuk halaman login
  String logoApkDiHalamanLogin = 'assets/images/app opening images/Logo 3.png';
  String usernameFormLabel = 'username';
  String passwordFormLabel = 'password';
  String usernameOrEmailHint = 'Username/Email';
  String passwordHint = 'Password';
  TextEditingController usernameContorller = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  bool usernameObscureText = false;
  bool visiblePassword = false;
  bool passwordObscureTextTrue = true;
  bool passwordObscureTextFalse = false;
  Icon usernameSuffixIcon = const Icon(Icons.person);
  Icon passwordSuffixIconOff = const Icon(Icons.visibility_off);
  Icon passwordSuffixIconOn = const Icon(Icons.visibility);
  String textLoginButton = 'Masuk';
  String haveNoAccount = 'Anda belum mempunya Akun? ';
  String textRegist = 'Daftar';
  Color textRegistColor = const Color(0xff448E75);

  void showPassword() {
    if(visiblePassword==false){
      visiblePassword = true;
      notifyListeners();
    } else if(visiblePassword==true){
      visiblePassword = false;
      notifyListeners();
    }
  }

  void postLogin(BuildContext context) async{
    try{
      await AuthApi().login(
        email: usernameContorller.text,
        password: passwordController.text,
      );

      Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(
          builder: (context){return NavBar();},
        ), (_) => false,
      );
    } catch(e){}
    notifyListeners();
  }

  void getToken() async{
    await firebaseMessaging.getToken().then((token) {
      firebaseDeviceToken = token!;
      print('token is $firebaseDeviceToken');
    });
    notifyListeners();
  }

  void onRegist(BuildContext context) async{
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const RegistScreen()),
    );
    getToken();
    notifyListeners();
  }

  //untuk registrasi
  String usernameRegistHint = 'Username';
  String emailRegistHint = 'Email';
  String passwordRegistHint = 'Password';
  String confirmPasswordRegistHint = 'Konfirmasi Password';
  TextEditingController usernameRegistController = TextEditingController();
  TextEditingController emailRegistController = TextEditingController();
  TextEditingController passwordRegistController = TextEditingController();
  TextEditingController confirmPasswordRegistController = TextEditingController();
  bool usernameRegistObscureText = false;
  bool emailRegistObscureText = false;
  bool visiblePasswordRegist = false;
  bool visiblePasswordConfirmRegist = false;
  bool passwordRegistObscureTextTrue = true;
  bool passwordRegistObscureTextFalse = false;
  bool confirmPasswordRegistObscureTextTrue = true;
  bool confirmPasswordRegistObscureTextFalse = false;
  Icon usernameRegistSuffixIcon = const Icon(Icons.person);
  Icon emailRegistSuffixIcon = const Icon(Icons.email_outlined);
  Icon passwordRegistSuffixIconOff = const Icon(Icons.visibility_off);
  Icon passwordRegistSuffixIconOn = const Icon(Icons.visibility);
  Icon confirmPasswordRegistSuffixIconOff = const Icon(Icons.visibility_off);
  Icon confirmPasswordRegistSuffixIconOn = const Icon(Icons.visibility);
  String textRegistButton = 'Selanjutnya';

  void showRegistPassword(){
    if(visiblePasswordRegist==false){
      visiblePasswordRegist = true;
      notifyListeners();
    } else if(visiblePasswordRegist==true){
      visiblePasswordRegist = false;
      notifyListeners();
    }
    notifyListeners();
  }

  void showRegistConfirmPassword(){
    if(visiblePasswordConfirmRegist==false){
      visiblePasswordConfirmRegist = true;
      notifyListeners();
    } else if(visiblePasswordConfirmRegist==true){
      visiblePasswordConfirmRegist = false;
      notifyListeners();
    }
    notifyListeners();
  }

  void register(BuildContext context) async{
    if(passwordRegistController.text==confirmPasswordRegistController.text){
      try{
        await AuthApi().register(
          email: emailRegistController.text,
          firebase_device_token: firebaseDeviceToken,
          name: usernameRegistController.text,
          password: passwordRegistController.text,
        );
        notifyListeners();
      } catch(e){}

      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => SendOtpScreen(),),
      );
      notifyListeners();
    } else{
      SnackBar snackbarMessage = const SnackBar(content: Text('konfirmasikan password dengan benar'));
      ScaffoldMessenger.of(context).showSnackBar(snackbarMessage);
      notifyListeners();
    }
    notifyListeners();
  }

  //untuk menerima code otp
  Color otpFieldColor = const Color(0xffC5E3D9);
  TextEditingController otpController = TextEditingController();
  String otpFill = '';
  String get EmailOtpMessage => 'Cek email ${emailRegistController.text} untuk mengetahui OTP anda';

  void processOtp(BuildContext context) async{
    print('repsonse object');
      try{
        final response = await AuthApi().verifyOtp(
          email: emailRegistController.text,
          otp: otpController.text,
        );
        Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(builder: (context){
            return LoginScreen();
          }), (_) => false,
        );
        print('response : $response');
      } catch(e){
        rethrow;
      }
    notifyListeners();
  }

  String textGetBackOtp = 'Kirim Ulang OTP';
  void resendOtpProvider() async{
    print('object');
    try{
      await AuthApi().resendOtp(email: emailRegistController.text);
      notifyListeners();
    }catch(e){}
    notifyListeners();
  }
}