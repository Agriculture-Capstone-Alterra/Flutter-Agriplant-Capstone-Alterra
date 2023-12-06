import 'package:dio/dio.dart';
import 'package:capstone_project/models/pengingat_merawat_tanaman/plant_list_reminder_model.dart';

class PlantListReminderAPI{
  Dio dio = Dio();
  String baseUrl = 'https://service.api-agriplant.xyz';
  String token =
      '''eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJhdXRob3JpemVkIjp0cnVlLCJleHAiOjE3MzI4NTMyMjYsInJvbGUiOiJBZG1pbiIsInVzZXJJZCI6MX0.qe-fV4gsgYx4ZhF5Iamr0FxKF8m2XQAaFoKuYmBL6G8''';

  Future<PlantListReminder> getAllPlants() async{
    dio.options.headers['Authorization'] = 'Bearer $token';
    try{
      final response  = await dio.get('$baseUrl/plants');
      return PlantListReminder.fromJson(response.data);
    } catch(e){rethrow;}
  }
}

//-----

// import 'package:capstone_project/models/pengingat_merawat_tanaman/plant_list_model.dart';
// import 'package:dio/dio.dart';

// class PlantListAPI{
//   String baseUrl = 'https://service.api-agriplant.xyz';

//   Dio dio = Dio();
//   String token =
//       '''eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJhdXRob3JpemVkIjp0cnVlLCJleHAiOjE3MzI4NTMyMjYsInJvbGUiOiJBZG1pbiIsInVzZXJJZCI6MX0.qe-fV4gsgYx4ZhF5Iamr0FxKF8m2XQAaFoKuYmBL6G8''';

//   Future<PlantListReminder> getPlantList() async {
//     dio.options.headers['Authorization'] = 'Bearer $token';
//     try {
//       final response = await dio.get('$baseUrl/plants');
//       return PlantListReminder.fromJson(response.data);
//     } catch (e) {
//       rethrow;
//     }
//   }
// }

// import 'dart:convert';
// import 'package:capstone_project/models/pengingat_merawat_tanaman/plant_list_model.dart';
// import 'package:dio/dio.dart';

// class PlantApiClient {
//   final Dio dio = Dio();
//   final String baseUrl;
//   final String bearerToken;

//   PlantApiClient({required this.baseUrl, required this.bearerToken});

//   Future<List<PlantData>> fetchPlantData() async {
//     try {
//       final response = await dio.get(
//         '$baseUrl/plants',
//         options: Options(
//           headers: {'Authorization': 'Bearer $bearerToken'},
//         ),
//       );

//       if (response.statusCode == 200) {
//         final jsonData = response.data;
//         return List<PlantData>.from(jsonData.map((data) => PlantData.fromJson(data)));
//       } else {
//         throw Exception('Failed to load data');
//       }
//     } catch (e) {
//       throw Exception('Error: $e');
//     }
//   }
// }

// final plantApiClient = PlantApiClient(baseUrl: 'https://service.api-agriplant.xyz', bearerToken: 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJhdXRob3JpemVkIjp0cnVlLCJleHAiOjE3MzMyMjgxMzQsInJvbGUiOiJBZG1pbiIsInVzZXJJZCI6MX0.b0Jh9cbZIwA6jssoNmafu0vtt2_baJdDxpiH2c1I9Hk');


