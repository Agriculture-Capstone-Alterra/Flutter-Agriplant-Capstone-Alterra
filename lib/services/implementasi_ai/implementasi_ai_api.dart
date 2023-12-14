import 'package:capstone_project/models/autentikasi_model/login_model.dart';
import 'package:capstone_project/models/implementasi_ai_model/implementasi_ai_model.dart';
import 'package:dio/dio.dart';

class ImplementasiAiAPI {
  Dio dio = Dio();
  String baseUrl = "https://service.api-agriplant.xyz";
  String token = '';

  getToken(LoginModel loginModel) {
    return loginModel.data.token;
  }

  Future<ImplementasiAiModel> chatbot({
    required String message,
    required LoginModel loginModel,
  }) async {
    token = getToken(loginModel);
    dio.options.headers['Authorization'] = token;
    try {
      final response = await dio.post(
        '$baseUrl/chatbot',
        data: {
          "message": message,
        },
      );
      return ImplementasiAiModel.fromJson(response.data);
    } catch (e) {
      rethrow;
    }
  }

  Future<ImplementasiAiModel> rekomendasiPupuk({
    required String tanaman,
    required LoginModel loginModel,
  }) async {
    token = getToken(loginModel);
    dio.options.headers['Authorization'] = token;
    try {
      final response = await dio.post(
        '$baseUrl/chatbot',
        data: {
          "message":
              "Berikan saya saran mengenai jenis dan jumlah pupuk yang tepat untuk tanaman $tanaman",
        },
      );
      return ImplementasiAiModel.fromJson(response.data);
    } catch (e) {
      rethrow;
    }
  }

  Future<ImplementasiAiModel> rekomendasiTanaman({
    required String tanaman,
    required LoginModel loginModel,
  }) async {
    token = getToken(loginModel);
    dio.options.headers['Authorization'] = token;
    try {
      final response = await dio.post(
        '$baseUrl/chatbot',
        data: {
          "message":
              "Berikan saya deskripsi tentang tanaman $tanaman serta berikan langkah-langkah dalam menanam dan merawat tanamannya",
        },
      );
      return ImplementasiAiModel.fromJson(response.data);
    } catch (e) {
      rethrow;
    }
  }
}
