import 'package:capstone_project/models/plant_by_id_model.dart';
import 'package:capstone_project/models/menanam_tanaman_model/plant_types_model.dart';
import 'package:dio/dio.dart';
import '../../models/all_plants_model.dart';

class PlantApi{
  Dio dio = Dio();
  String baseUrl = 'http://service.api-agriplant.xyz';
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
    dio.options.headers['Authorization'] = 'Bearer $token';
    try{
      final response  = await dio.get('$baseUrl/plants');
      final filterData = AllPlantsModel.fromJson(response.data);
      filterData.data.forEach((element) {
        if(element.id==17){
          print(element.id);
        }
      });
      return AllPlantsModel.fromJson(response.data);
    } catch(e){rethrow;}
  }

  Future<PlantByIdModel> getPlantById({required int id}) async{
    dio.options.headers['Authorization'] = 'Bearer $token';
    try{
      final response = await dio.get('$baseUrl/plants/$id');
      return PlantByIdModel.fromJson(response.data);
    }catch(e){rethrow;}
  }
}