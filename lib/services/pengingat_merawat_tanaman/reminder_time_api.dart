// import 'package:capstone_project/models/pengingat_merawat_tanaman/reminder_time_model.dart';
// import 'package:dio/dio.dart';

// class ReminderTimeAPI{
//   Dio dio = Dio();
//   String baseUrl = 'https://6571fd40d61ba6fcc0142a0c.mockapi.io/agriculture';
 
//   Future<ReminderTime> getAllPlants() async{
//     try{
//       final response  = await dio.get('$baseUrl/reminder');
//       return ReminderTime.fromJson(response.data);
//     } catch(e){rethrow;}
//   }
// }

import 'package:dio/dio.dart';

class ReminderTimeAPI {
  final Dio _dio = Dio();

  Future<List<Map<String, dynamic>>> getReminders() async {
    try {
      final response = await _dio.get(
        "https://6571fd40d61ba6fcc0142a0c.mockapi.io/agriculture/reminder",
      );

      if (response.statusCode == 200) {
        return List<Map<String, dynamic>>.from(
          response.data.map((dynamic reminder) => reminder as Map<String, dynamic>),
        );
      } else {
        // ignore: avoid_print
        print("Failed to fetch reminders. Status code: ${response.statusCode}");
        return [];
      }
    } catch (error) {
      // ignore: avoid_print
      print("Error fetching reminders: $error");
      return [];
    }
  }

  Future<void> deleteReminder(String id) async {
    try {
      final response = await _dio.delete(
        "https://6571fd40d61ba6fcc0142a0c.mockapi.io/agriculture/reminder/$id",
      );

      if (response.statusCode != 200) {
        // ignore: avoid_print
        print("Failed to delete reminder. Status code: ${response.statusCode}");
      }
    } catch (error) {
      // ignore: avoid_print
      print("Error deleting reminder: $error");
    }
  }
}