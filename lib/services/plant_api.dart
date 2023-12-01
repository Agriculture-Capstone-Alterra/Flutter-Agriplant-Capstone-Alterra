import 'package:capstone_project/models/menanam_tanaman_model/plant_types_model.dart';
import 'package:dio/dio.dart';

class PlantApi{
  String baseUrl = 'https://service.api-agriplant.xyz';

  Dio dio = Dio();
  String token =
      '''eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJhdXRob3JpemVkIjp0cnVlLCJleHAiOjE3MzI4NTMyMjYsInJvbGUiOiJBZG1pbiIsInVzZXJJZCI6MX0.qe-fV4gsgYx4ZhF5Iamr0FxKF8m2XQAaFoKuYmBL6G8''';

  Future<PlantTypesModel> getPlantList() async {
    dio.options.headers['Authorization'] = 'Bearer $token';
    try {
      final response = await dio.get('$baseUrl/plant-types');
      return PlantTypesModel.fromJson(response.data);
    } catch (e) {
      rethrow;
    }
  }
}