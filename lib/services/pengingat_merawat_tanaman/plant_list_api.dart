
import 'package:capstone_project/models/pengingat_merawat_tanaman/plant_list_model.dart';
import 'package:dio/dio.dart';

class PlantListAPI{
  String baseUrl = 'https://service.api-agriplant.xyz';

  Dio dio = Dio();
  String token =
      '''eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJhdXRob3JpemVkIjp0cnVlLCJleHAiOjE3MzI4NTMyMjYsInJvbGUiOiJBZG1pbiIsInVzZXJJZCI6MX0.qe-fV4gsgYx4ZhF5Iamr0FxKF8m2XQAaFoKuYmBL6G8''';

  Future<PlantListReminder> getPlantList() async {
    dio.options.headers['Authorization'] = 'Bearer $token';
    try {
      final response = await dio.get('$baseUrl/plants');
      return PlantListReminder.fromJson(response.data);
    } catch (e) {
      rethrow;
    }
  }
}