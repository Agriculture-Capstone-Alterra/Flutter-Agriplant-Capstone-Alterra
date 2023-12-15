// To parse this JSON data, do
//
//     final geocodeLocationModel = geocodeLocationModelFromJson(jsonString);

import 'dart:convert';

GeocodeLocationModel geocodeLocationModelFromJson(String str) =>
    GeocodeLocationModel.fromJson(json.decode(str));

String geocodeLocationModelToJson(GeocodeLocationModel data) =>
    json.encode(data.toJson());

class GeocodeLocationModel {
  List<Datum> data;
  String message;
  String status;

  GeocodeLocationModel({
    required this.data,
    required this.message,
    required this.status,
  });

  factory GeocodeLocationModel.fromJson(Map<String, dynamic> json) =>
      GeocodeLocationModel(
        data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
        message: json["message"],
        status: json["status"],
      );

  Map<String, dynamic> toJson() => {
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
        "message": message,
        "status": status,
      };
}

class Datum {
  int id;
  String name;
  double latitude;
  double longitude;
  int elevation;
  String featureCode;
  String countryCode;
  int admin1Id;
  String timezone;
  int population;
  int countryId;
  String country;
  String admin1;

  Datum({
    required this.id,
    required this.name,
    required this.latitude,
    required this.longitude,
    required this.elevation,
    required this.featureCode,
    required this.countryCode,
    required this.admin1Id,
    required this.timezone,
    required this.population,
    required this.countryId,
    required this.country,
    required this.admin1,
  });

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json["id"],
        name: json["name"],
        latitude: json["latitude"]?.toDouble(),
        longitude: json["longitude"]?.toDouble(),
        elevation: json["elevation"],
        featureCode: json["feature_code"],
        countryCode: json["country_code"],
        admin1Id: json["admin1_id"],
        timezone: json["timezone"],
        population: json["population"],
        countryId: json["country_id"],
        country: json["country"],
        admin1: json["admin1"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "latitude": latitude,
        "longitude": longitude,
        "elevation": elevation,
        "feature_code": featureCode,
        "country_code": countryCode,
        "admin1_id": admin1Id,
        "timezone": timezone,
        "population": population,
        "country_id": countryId,
        "country": country,
        "admin1": admin1,
      };
}
