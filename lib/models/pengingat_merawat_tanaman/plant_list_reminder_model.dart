import 'dart:convert';

PlantListReminder plantListReminderFromJson(String str) => PlantListReminder.fromJson(json.decode(str));

String plantListReminderToJson(PlantListReminder data) => json.encode(data.toJson());

class PlantListReminder {
    List<PlantList> data;
    String message;
    String status;

    PlantListReminder({
        required this.data,
        required this.message,
        required this.status,
    });

    factory PlantListReminder.fromJson(Map<String, dynamic> json) => PlantListReminder(
        data: List<PlantList>.from(json["data"].map((x) =>PlantList.fromJson(x))),
        message: json["message"],
        status: json["status"],
    );

    Map<String, dynamic> toJson() => {
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
        "message": message,
        "status": status,
    };
}

class PlantList {
    String createdAt;
    String description;
    String drySeasonFinishPlant;
    String drySeasonStartPlant;
    String fertilizerInfo;
    String howToMaintain;
    int id;
    String name;
    String pestInfo;
    String plantImageThumbnail;
    PlantType plantType;
    String plantingSuggestions;
    String rainySeasonFinishPlant;
    String rainySeasonStartPlant;
    PlantType technology;
    String updatedAt;
    String variety;

    PlantList({
        required this.createdAt,
        required this.description,
        required this.drySeasonFinishPlant,
        required this.drySeasonStartPlant,
        required this.fertilizerInfo,
        required this.howToMaintain,
        required this.id,
        required this.name,
        required this.pestInfo,
        required this.plantImageThumbnail,
        required this.plantType,
        required this.plantingSuggestions,
        required this.rainySeasonFinishPlant,
        required this.rainySeasonStartPlant,
        required this.technology,
        required this.updatedAt,
        required this.variety,
    });

    factory PlantList.fromJson(Map<String, dynamic> json) => PlantList(
        createdAt: json["created_at"],
        description: json["description"],
        drySeasonFinishPlant: json["dry_season_finish_plant"],
        drySeasonStartPlant: json["dry_season_start_plant"],
        fertilizerInfo: json["fertilizer_info"],
        howToMaintain: json["how_to_maintain"],
        id: json["id"],
        name: json["name"],
        pestInfo: json["pest_info"],
        plantImageThumbnail: json["plant_image_thumbnail"],
        plantType: PlantType.fromJson(json["plant_type"]),
        plantingSuggestions: json["planting_suggestions"],
        rainySeasonFinishPlant: json["rainy_season_finish_plant"],
        rainySeasonStartPlant: json["rainy_season_start_plant"],
        technology: PlantType.fromJson(json["technology"]),
        updatedAt: json["updated_at"],
        variety: json["variety"],
    );

    Map<String, dynamic> toJson() => {
        "created_at": createdAt,
        "description": description,
        "dry_season_finish_plant": drySeasonFinishPlant,
        "dry_season_start_plant": drySeasonStartPlant,
        "fertilizer_info": fertilizerInfo,
        "how_to_maintain": howToMaintain,
        "id": id,
        "name": name,
        "pest_info": pestInfo,
        "plant_image_thumbnail": plantImageThumbnail,
        "plant_type": plantType.toJson(),
        "planting_suggestions": plantingSuggestions,
        "rainy_season_finish_plant": rainySeasonFinishPlant,
        "rainy_season_start_plant": rainySeasonStartPlant,
        "technology": technology.toJson(),
        "updated_at": updatedAt,
        "variety": variety,
    };
}

class PlantType {
    String createdAt;
    int id;
    String name;
    String updatedAt;
    String? description;

    PlantType({
        required this.createdAt,
        required this.id,
        required this.name,
        required this.updatedAt,
        this.description,
    });

    factory PlantType.fromJson(Map<String, dynamic> json) => PlantType(
        createdAt: json["created_at"],
        id: json["id"],
        name: json["name"],
        updatedAt: json["updated_at"],
        description: json["description"],
    );

    Map<String, dynamic> toJson() => {
        "created_at": createdAt,
        "id": id,
        "name": name,
        "updated_at": updatedAt,
        "description": description,
    };
}