import 'package:capstone_project/models/informasi_cuaca/hourly_forecast_model.dart';
import 'package:dio/dio.dart';

class HourlyForecastAPI {
  Dio dio = Dio();
  String baseUrl = "https://service.api-agriplant.xyz";
  String token =
      "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJhdXRob3JpemVkIjp0cnVlLCJleHAiOjE3MzQwOTIxNTIsInJvbGUiOiJVc2VyIEFQSSIsInVzZXJJZCI6MX0.5NGPQKLQXg78s61uqCNdc8Ol9fChi5sIKILM_EyDzR0";

  Future<HourlyForecastModel> getHourlyForecast(
      double latitude, double longitude) async {
    dio.options.headers['Authorization'] = 'Bearer $token';
    try {
      final response = await dio.get(
          '$baseUrl/weather/hourly?latitude=$latitude&longitude=$longitude');
      return HourlyForecastModel.fromJson(response.data);
    } catch (e) {
      rethrow;
    }
  }
}
