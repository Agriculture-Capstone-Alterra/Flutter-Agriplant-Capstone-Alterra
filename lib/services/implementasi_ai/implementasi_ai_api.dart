import 'package:capstone_project/models/implementasi_ai_model/implementasi_ai_model.dart';
import 'package:dio/dio.dart';

class ImplementasiAiAPI {
  Dio dio = Dio();
  String baseUrl = "https://service.api-agriplant.xyz";
  String token =
      '''eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJhdXRob3JpemVkIjp0cnVlLCJleHAiOjE3MzQwOTIxNTIsInJvbGUiOiJVc2VyIEFQSSIsInVzZXJJZCI6MX0.5NGPQKLQXg78s61uqCNdc8Ol9fChi5sIKILM_EyDzR0''';

  Future<ImplementasiAiModel> chatbot({
    required String message,
  }) async {
    dio.options.headers['Authorization'] = 'Bearer $token';

    try {
      print('Before Dio API call');
      final response = await dio.post(
        '$baseUrl/chatbot',
        data: {
          "message": 'Jawab dalam bahasa indonesia. $message',
        },
      );
      print('After Dio API call');
      return ImplementasiAiModel.fromJson(response.data);
    } catch (e) {
      print('Error during Dio API call: $e');
      rethrow;
    }
  }

  Future<ImplementasiAiModel> rekomendasiTanaman({
    required String message,
  }) async {
    dio.options.headers['Authorization'] = 'Bearer $token';

    try {
      final response = await dio.post(
        '$baseUrl/chatbot',
        data: {
          "message":
              "Berikan saya deskripsi tentang tanaman $message serta berikan langkah-langkah dalam menanam dan merawat tanamannya",
        },
      );
      return ImplementasiAiModel.fromJson(response.data);
    } catch (e) {
      rethrow;
    }
  }

  Future<ImplementasiAiModel> rekomendasiPupuk({
    required String message,
  }) async {
    dio.options.headers['Authorization'] = 'Bearer $token';

    try {
      final response = await dio.post(
        '$baseUrl/chatbot',
        data: {
          "message":
              "Berikan saya saran mengenai jenis dan jumlah pupuk yang tepat untuk tanaman $message",
        },
      );
      return ImplementasiAiModel.fromJson(response.data);
    } catch (e) {
      rethrow;
    }
  }
}
