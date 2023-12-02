import 'package:capstone_project/models/menanam_tanaman_model/plant_types_model.dart';
import 'package:dio/dio.dart';

import '../../models/menanam_tanaman_model/all_plants_model.dart';

class PlantApi{
  String baseUrl = 'https://service.api-agriplant.xyz';

  Dio dio = Dio();
  String token =
      '''eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJhdXRob3JpemVkIjp0cnVlLCJleHAiOjE3MzI4NTMyMjYsInJvbGUiOiJBZG1pbiIsInVzZXJJZCI6MX0.qe-fV4gsgYx4ZhF5Iamr0FxKF8m2XQAaFoKuYmBL6G8''';

  Future<PlantTypesModel> getPlantTypetList() async {
    dio.options.headers['Authorization'] = 'Bearer $token';
    try {
      final response = await dio.get('$baseUrl/plant-types');
      return PlantTypesModel.fromJson(response.data);
    } catch (e) {
      rethrow;
    }
  }

  Future<AllPlantsModel> getAllPlants() async{
    dio.options.headers['Authorization'] = 'Bearer $token/plants';
    try{
      final response  = await dio.get('$baseUrl');
      return AllPlantsModel.fromJson(response.data);
    } catch(e){rethrow;}
  }
}