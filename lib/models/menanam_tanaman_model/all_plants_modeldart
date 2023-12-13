// To parse this JSON data, do
//
//     final allPlantsModel = allPlantsModelFromJson(jsonString);

import 'dart:convert';

AllPlantsModel allPlantsModelFromJson(String str) => AllPlantsModel.fromJson(json.decode(str));

String allPlantsModelToJson(AllPlantsModel data) => json.encode(data.toJson());

class AllPlantsModel {
  List<PlantData> data;
  String message;
  String status;

  AllPlantsModel({
    required this.data,
    required this.message,
    required this.status,
  });

  factory AllPlantsModel.fromJson(Map<String, dynamic> json) => AllPlantsModel(
    data: List<PlantData>.from(json["data"].map((x) => PlantData.fromJson(x))),
    message: json["message"],
    status: json["status"],
  );

  Map<String, dynamic> toJson() => {
    "data": List<dynamic>.from(data.map((x) => x.toJson())),
    "message": message,
    "status": status,
  };
}

class PlantData {
  int id;
  String name;
  PlantType plantType;
  PlantType technology;
  String variety;
  String description;
  String fertilizerInfo;
  String pestInfo;
  DateTime drySeasonStartPlant;
  DateTime drySeasonFinishPlant;
  DateTime rainySeasonStartPlant;
  DateTime rainySeasonFinishPlant;
  String plantingSuggestions;
  String howToMaintain;
  DateTime createdAt;
  DateTime updatedAt;
  String plantImageThumbnail;

  PlantData({
    required this.id,
    required this.name,
    required this.plantType,
    required this.technology,
    required this.variety,
    required this.description,
    required this.fertilizerInfo,
    required this.pestInfo,
    required this.drySeasonStartPlant,
    required this.drySeasonFinishPlant,
    required this.rainySeasonStartPlant,
    required this.rainySeasonFinishPlant,
    required this.plantingSuggestions,
    required this.howToMaintain,
    required this.createdAt,
    required this.updatedAt,
    required this.plantImageThumbnail,
  });

  factory PlantData.fromJson(Map<String, dynamic> json) => PlantData(
    id: json["id"],
    name: json["name"] ?? 'get no data',
    plantType: PlantType.fromJson(json["plant_type"]),
    technology: PlantType.fromJson(json["technology"]),
    variety: json["variety"] ?? 'get no data',
    description: json["description"] ?? 'get no data',
    fertilizerInfo: json["fertilizer_info"] ?? 'get no data',
    pestInfo: json["pest_info"] ?? 'get no data',
    drySeasonStartPlant: DateTime.parse(json["dry_season_start_plant"]),
    drySeasonFinishPlant: DateTime.parse(json["dry_season_finish_plant"]),
    rainySeasonStartPlant: DateTime.parse(json["rainy_season_start_plant"]),
    rainySeasonFinishPlant: DateTime.parse(json["rainy_season_finish_plant"]),
    plantingSuggestions: json["planting_suggestions"] ?? 'get no data',
    howToMaintain: json["how_to_maintain"] ?? 'get no data',
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
    plantImageThumbnail: json["plant_image_thumbnail"]==''?
    'https://pertaniansehat.com/v01/wp-content/uploads/2015/08/default-placeholder.png' :
    json["plant_image_thumbnail"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "plant_type": plantType.toJson(),
    "technology": technology.toJson(),
    "variety": variety,
    "description": description,
    "fertilizer_info": fertilizerInfo,
    "pest_info": pestInfo,
    "dry_season_start_plant": "${drySeasonStartPlant.year.toString().padLeft(4, '0')}-${drySeasonStartPlant.month.toString().padLeft(2, '0')}-${drySeasonStartPlant.day.toString().padLeft(2, '0')}",
    "dry_season_finish_plant": "${drySeasonFinishPlant.year.toString().padLeft(4, '0')}-${drySeasonFinishPlant.month.toString().padLeft(2, '0')}-${drySeasonFinishPlant.day.toString().padLeft(2, '0')}",
    "rainy_season_start_plant": "${rainySeasonStartPlant.year.toString().padLeft(4, '0')}-${rainySeasonStartPlant.month.toString().padLeft(2, '0')}-${rainySeasonStartPlant.day.toString().padLeft(2, '0')}",
    "rainy_season_finish_plant": "${rainySeasonFinishPlant.year.toString().padLeft(4, '0')}-${rainySeasonFinishPlant.month.toString().padLeft(2, '0')}-${rainySeasonFinishPlant.day.toString().padLeft(2, '0')}",
    "planting_suggestions": plantingSuggestions,
    "how_to_maintain": howToMaintain,
    "created_at": createdAt.toIso8601String(),
    "updated_at": updatedAt.toIso8601String(),
    "plant_image_thumbnail": plantImageThumbnail,
  };
}

class PlantType {
  int id;
  String name;
  DateTime createdAt;
  DateTime updatedAt;
  String? description;

  PlantType({
    required this.id,
    required this.name,
    required this.createdAt,
    required this.updatedAt,
    this.description,
  });

  factory PlantType.fromJson(Map<String, dynamic> json) => PlantType(
    id: json["id"],
    name: json["name"],
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
    description: json["description"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "created_at": createdAt.toIso8601String(),
    "updated_at": updatedAt.toIso8601String(),
    "description": description,
  };
}