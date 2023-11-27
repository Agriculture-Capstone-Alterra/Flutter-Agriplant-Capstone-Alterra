import 'package:capstone_project/models/autentikasi_model/login_model.dart';
import 'package:dio/dio.dart';
import '../models/autentikasi_model/register_model.dart';

String baseUrl = 'http://13.213.19.179:8000';

class AuthApi{
  Dio dio = Dio();

  Future<Data> login({
    required String email,
    required String password,
  }) async{
    try{
      final response = await dio.post(
        '$baseUrl/auth/login',
        data: {
          "email" : email,
          "password" : password,
        }
      );
      return Data.fromJson(response.data['data']);
    } catch(e){
      rethrow;
    }
  }

  Future<RegisterModel> register({
    required String email,
    required String firebase_device_token,
    required String name,
    required String password,
  }) async{
    try{
      final response = await dio.post(
        '$baseUrl/auth/register',
        data: {
          "email" : email,
          "firebase_device_token" : firebase_device_token,
          "name" : name,
          "password" : password,
        },
      );
      return RegisterModel.fromJson(response.data);
    } catch(e){
      rethrow;
    }
  }

  // Future verifyOtp({
  //   required String email,
  // }){
  //   return;
  // }

}