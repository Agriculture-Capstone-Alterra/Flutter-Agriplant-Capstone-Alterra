import 'package:capstone_project/models/pengingat_merawat_tanaman/reminder_time_model.dart';
import 'package:dio/dio.dart';

class ReminderTimeAPI{
  Dio dio = Dio();
  String baseUrl = 'https://6571fd40d61ba6fcc0142a0c.mockapi.io/agriculture';
 
  Future<ReminderTime> getAllPlants() async{
    try{
      final response  = await dio.get('$baseUrl/reminder');
      return ReminderTime.fromJson(response.data);
    } catch(e){rethrow;}
  }
}