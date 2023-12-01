// To parse this JSON data, do
//
//     final plantTypesModel = plantTypesModelFromJson(jsonString);

import 'dart:convert';

PlantTypesModel plantTypesModelFromJson(String str) => PlantTypesModel.fromJson(json.decode(str));

String plantTypesModelToJson(PlantTypesModel data) => json.encode(data.toJson());

class PlantTypesModel {
  List<PlantList> data;
  String message;
  String status;

  PlantTypesModel({
    required this.data,
    required this.message,
    required this.status,
  });

  factory PlantTypesModel.fromJson(Map<String, dynamic> json) => PlantTypesModel(
    data: List<PlantList>.from(json["data"].map((x) => PlantList.fromJson(x))),
    message: json["message"],
    status: json["status"],
  );

  Map<String, dynamic> toJson() => {
    "data": List<dynamic>.from(data.map((x) => x.toJson())),
    "message": message,
    "status": status,
  };
}

class PlantList{
  int id;
  String name;
  DateTime createdAt;
  DateTime updatedAt;

  PlantList({
    required this.id,
    required this.name,
    required this.createdAt,
    required this.updatedAt,
  });

  factory PlantList.fromJson(Map<String, dynamic> json) => PlantList(
    id: json["id"],
    name: json["name"],
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "created_at": createdAt.toIso8601String(),
    "updated_at": updatedAt.toIso8601String(),
  };
}