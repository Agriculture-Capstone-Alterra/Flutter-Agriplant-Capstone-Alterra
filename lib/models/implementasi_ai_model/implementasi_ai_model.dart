// To parse this JSON data, do
//
//     final implementasiAiModel = implementasiAiModelFromJson(jsonString);

import 'dart:convert';

ImplementasiAiModel implementasiAiModelFromJson(String str) =>
    ImplementasiAiModel.fromJson(json.decode(str));

String implementasiAiModelToJson(ImplementasiAiModel data) =>
    json.encode(data.toJson());

class ImplementasiAiModel {
  Data data;
  String message;
  String status;

  ImplementasiAiModel({
    required this.data,
    required this.message,
    required this.status,
  });

  factory ImplementasiAiModel.fromJson(Map<String, dynamic> json) =>
      ImplementasiAiModel(
        data: Data.fromJson(json["data"]),
        message: json["message"],
        status: json["status"],
      );

  Map<String, dynamic> toJson() => {
        "data": data.toJson(),
        "message": message,
        "status": status,
      };
}

class Data {
  String response;

  Data({
    required this.response,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        response: json["response"],
      );

  Map<String, dynamic> toJson() => {
        "response": response,
      };
}
