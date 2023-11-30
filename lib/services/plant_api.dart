import 'package:capstone_project/models/menanam_tanaman_model/plant_types_model.dart';
import 'package:dio/dio.dart';

class PlantApi{
  String baseUrl = 'https://service.api-agriplant.xyz';

  Dio dio = Dio();

  // Future<PlantTypesModel> plantList() async{
  //   try{
  //     final response = await dio.get('$baseUrl/plant-types');
  //     return PlantTypesModel.fromJson(response.data);
  //   } catch(e){
  //     rethrow;
  //   }
  // }

  Future<List> getPlantList() async{
    try{
      final response = await dio.get('$baseUrl/plant-types');
      return PlantList.fromJson(response.data) as List;
    } catch(e){
      rethrow;
    }
  }
}