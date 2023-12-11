// To parse this JSON data, do
//
//     final reminderTime = reminderTimeFromJson(jsonString);

import 'dart:convert';

List<ReminderTime> reminderTimeFromJson(String str) => List<ReminderTime>.from(json.decode(str).map((x) => ReminderTime.fromJson(x)));

String reminderTimeToJson(List<ReminderTime> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class ReminderTime {
    String description;
    String time;
    String id;

    ReminderTime({
        required this.description,
        required this.time,
        required this.id,
    });

    factory ReminderTime.fromJson(Map<String, dynamic> json) => ReminderTime(
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
