import 'package:capstone_project/models/autentikasi_model/login_model.dart';
import 'package:dio/dio.dart';
import '../models/autentikasi_model/response_resend_otp_model.dart';
import '../models/autentikasi_model/register_model.dart';
import '../models/autentikasi_model/verify_otp_model.dart';



class AuthApi{
  String baseUrl = 'http://service.api-agriplant.xyz';

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

  Future<VerifyOtpModel> verifyOtp({
    required String email,
    required String otp,
  }) async{
    try{
      final response = await dio.post(
        '$baseUrl/auth/verify-otp',
        data: {
          "email" : email,
          "otp" : otp,
        }
      );
      return VerifyOtpModel.fromJson(response.data);
    } catch(e){
      rethrow;
    }
  }

  Future<ResponseResendOtpModel> resendOtp({
    required String email,
  }) async{
    try{
      final response = await dio.post(
        '$baseUrl/auth/resend-otp',
        data: {
          "email": email,
        }
      );
      print(response.data);
      return ResponseResendOtpModel.fromJson(response.data);
    } catch(e){
      rethrow;
    }
  }
}