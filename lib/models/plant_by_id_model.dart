// To parse this JSON data, do
//
//     final plantByIdModel = plantByIdModelFromJson(jsonString);

import 'dart:convert';

PlantByIdModel plantByIdModelFromJson(String str) => PlantByIdModel.fromJson(json.decode(str));

String plantByIdModelToJson(PlantByIdModel data) => json.encode(data.toJson());

class PlantByIdModel {
  PlantByIdData data;
  String message;
  String status;

  PlantByIdModel({
    required this.data,
    required this.message,
    required this.status,
  });

  factory PlantByIdModel.fromJson(Map<String, dynamic> json) => PlantByIdModel(
    data: PlantByIdData.fromJson(json["data"]),
    message: json["message"],
    status: json["status"],
  );

  Map<String, dynamic> toJson() => {
    "data": data.toJson(),
    "message": message,
    "status": status,
  };
}

class PlantByIdData {
  int id;
  String name;
  int plantTypeId;
  String plantType;
  int technologyId;
  String technology;
  String variety;
  String description;
  String fertilizerInfo;
  String pestInfo;
  DateTime drySeasonStartPlant;
  DateTime drySeasonFinishPlant;
  DateTime rainySeasonStartPlant;
  DateTime rainySeasonFinishPlant;
  String plantingSuggestions;
  String plantingMediumSuggestions;
  String howToMaintain;
  DateTime createdAt;
  DateTime updatedAt;
  dynamic plantImageThumbnail;
  List<PlantImage> plantingMediumImages;
  List<Planting> plantingGuides;
  List<Planting> plantingTools;
  List<PlantImage> plantImages;

  PlantByIdData({
    required this.id,
    required this.name,
    required this.plantTypeId,
    required this.plantType,
    required this.technologyId,
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
    required this.plantingMediumSuggestions,
    required this.howToMaintain,
    required this.createdAt,
    required this.updatedAt,
    required this.plantImageThumbnail,
    required this.plantingMediumImages,
    required this.plantingGuides,
    required this.plantingTools,
    required this.plantImages,
  });

  factory PlantByIdData.fromJson(Map<String, dynamic> json) => PlantByIdData(
    id: json["id"],
    name: json["name"],
    plantTypeId: json["plant_type_id"],
    plantType: json["plant_type"],
    technologyId: json["technology_id"],
    technology: json["technology"],
    variety: json["variety"],
    description: json["description"],
    fertilizerInfo: json["fertilizer_info"],
    pestInfo: json["pest_info"],
    drySeasonStartPlant: DateTime.parse(json["dry_season_start_plant"]),
    drySeasonFinishPlant: DateTime.parse(json["dry_season_finish_plant"]),
    rainySeasonStartPlant: DateTime.parse(json["rainy_season_start_plant"]),
    rainySeasonFinishPlant: DateTime.parse(json["rainy_season_finish_plant"]),
    plantingSuggestions: json["planting_suggestions"],
    plantingMediumSuggestions: json["planting_medium_suggestions"],
    howToMaintain: json["how_to_maintain"],
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
    plantImageThumbnail: json["plant_image_thumbnail"]==null || json["plant_image_thumbnail"]==''?
    'https://pertaniansehat.com/v01/wp-content/uploads/2015/08/default-placeholder.png' :
    json["plant_image_thumbnail"],
    plantingMediumImages: List<PlantImage>.from(json["planting_medium_images"].map((x) => PlantImage.fromJson(x))),
    plantingGuides: List<Planting>.from(json["planting_guides"].map((x) => Planting.fromJson(x))),
    plantingTools: List<Planting>.from(json["planting_tools"].map((x) => Planting.fromJson(x))),
    plantImages: List<PlantImage>.from(json["plant_images"].map((x) => PlantImage.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "plant_type_id": plantTypeId,
    "plant_type": plantType,
    "technology_id": technologyId,
    "technology": technology,
    "variety": variety,
    "description": description,
    "fertilizer_info": fertilizerInfo,
    "pest_info": pestInfo,
    "dry_season_start_plant": "${drySeasonStartPlant.year.toString().padLeft(4, '0')}-${drySeasonStartPlant.month.toString().padLeft(2, '0')}-${drySeasonStartPlant.day.toString().padLeft(2, '0')}",
    "dry_season_finish_plant": "${drySeasonFinishPlant.year.toString().padLeft(4, '0')}-${drySeasonFinishPlant.month.toString().padLeft(2, '0')}-${drySeasonFinishPlant.day.toString().padLeft(2, '0')}",
    "rainy_season_start_plant": "${rainySeasonStartPlant.year.toString().padLeft(4, '0')}-${rainySeasonStartPlant.month.toString().padLeft(2, '0')}-${rainySeasonStartPlant.day.toString().padLeft(2, '0')}",
    "rainy_season_finish_plant": "${rainySeasonFinishPlant.year.toString().padLeft(4, '0')}-${rainySeasonFinishPlant.month.toString().padLeft(2, '0')}-${rainySeasonFinishPlant.day.toString().padLeft(2, '0')}",
    "planting_suggestions": plantingSuggestions,
    "planting_medium_suggestions": plantingMediumSuggestions,
    "how_to_maintain": howToMaintain,
    "created_at": createdAt.toIso8601String(),
    "updated_at": updatedAt.toIso8601String(),
    "plant_image_thumbnail": plantImageThumbnail,
    "planting_medium_images": List<dynamic>.from(plantingMediumImages.map((x) => x.toJson())),
    "planting_guides": List<dynamic>.from(plantingGuides.map((x) => x.toJson())),
    "planting_tools": List<dynamic>.from(plantingTools.map((x) => x.toJson())),
    "plant_images": List<dynamic>.from(plantImages.map((x) => x.toJson())),
  };
}

class PlantImage {
  int id;
  String imagePath;
  DateTime createdAt;

  PlantImage({
    required this.id,
    required this.imagePath,
    required this.createdAt,
  });

  factory PlantImage.fromJson(Map<String, dynamic> json) => PlantImage(
    id: json["id"],
    imagePath: json["image_path"],
    createdAt: DateTime.parse(json["created_at"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "image_path": imagePath,
    "created_at": createdAt.toIso8601String(),
  };
}

class Planting {
  int id;
  String name;
  String description;
  String imagePath;
  DateTime createdAt;
  DateTime updatedAt;

  Planting({
    required this.id,
    required this.name,
    required this.description,
    required this.imagePath,
    required this.createdAt,
    required this.updatedAt,
  });

  factory Planting.fromJson(Map<String, dynamic> json) => Planting(
    id: json["id"],
    name: json["name"],
    description: json["description"],
    imagePath: json["image_path"]==null || json["image_path"]=="" || json["image_path"]==''?
    'https://pertaniansehat.com/v01/wp-content/uploads/2015/08/default-placeholder.png':
    json["image_path"],
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "description": description,
    "image_path": imagePath,
    "created_at": createdAt.toIso8601String(),
    "updated_at": updatedAt.toIso8601String(),
  };
}