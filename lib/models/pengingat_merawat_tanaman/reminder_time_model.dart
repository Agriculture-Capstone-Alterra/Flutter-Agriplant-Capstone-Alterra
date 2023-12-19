// To parse this JSON data, do
//
//     final reminderTimeModel = reminderTimeModelFromJson(jsonString);

import 'dart:convert';

List<ReminderTimeModel> reminderTimeModelFromJson(String str) => List<ReminderTimeModel>.from(json.decode(str).map((x) => ReminderTimeModel.fromJson(x)));

String reminderTimeModelToJson(List<ReminderTimeModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class ReminderTimeModel {
    String description;
    String time;
    String id;

    ReminderTimeModel({
        required this.description,
        required this.time,
        required this.id,
    });

    factory ReminderTimeModel.fromJson(Map<String, dynamic> json) => ReminderTimeModel(
        description: json["description"],
        time: json["time"],
        id: json["id"],
    );

    Map<String, dynamic> toJson() => {
        "description": description,
        "time": time,
        "id": id,
    };
}
