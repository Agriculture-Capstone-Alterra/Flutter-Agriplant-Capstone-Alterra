import 'package:capstone_project/models/implementasi_ai_model/implementasi_ai_model.dart';
import 'package:dio/dio.dart';

class ImplementasiAiAPI {
  Dio dio = Dio();
  String baseUrl = "https://service.api-agriplant.xyz";

  Future<ImplementasiAiModel> chatbot({
    required String message,
  }) async {
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
  }) async {
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
  }) async {
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
