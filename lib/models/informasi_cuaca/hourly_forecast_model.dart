// To parse this JSON data, do
//
//     final hourlyForecastModel = hourlyForecastModelFromJson(jsonString);

import 'dart:convert';

HourlyForecastModel hourlyForecastModelFromJson(String str) => HourlyForecastModel.fromJson(json.decode(str));

String hourlyForecastModelToJson(HourlyForecastModel data) => json.encode(data.toJson());

class HourlyForecastModel {
    Data data;
    String message;
    String status;

    HourlyForecastModel({
        required this.data,
        required this.message,
        required this.status,
    });

    factory HourlyForecastModel.fromJson(Map<String, dynamic> json) => HourlyForecastModel(
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
  int latitude;
  double longitude;
  double generationtimeMs;
  int utcOffsetSeconds;
  String timezone;
  String timezoneAbbreviation;
  int elevation;
  HourlyUnits hourlyUnits;
  Hourly hourly;

  Data({
    required this.latitude,
    required this.longitude,
    required this.generationtimeMs,
    required this.utcOffsetSeconds,
    required this.timezone,
    required this.timezoneAbbreviation,
    required this.elevation,
    required this.hourlyUnits,
    required this.hourly,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        latitude: json["latitude"],
        longitude: json["longitude"]?.toDouble(),
        generationtimeMs: json["generationtime_ms"]?.toDouble(),
        utcOffsetSeconds: json["utc_offset_seconds"],
        timezone: json["timezone"],
        timezoneAbbreviation: json["timezone_abbreviation"],
        elevation: json["elevation"],
        hourlyUnits: HourlyUnits.fromJson(json["hourly_units"]),
        hourly: Hourly.fromJson(json["hourly"]),
      );

    Map<String, dynamic> toJson() => {
        "latitude": latitude,
        "longitude": longitude,
        "generationtime_ms": generationtimeMs,
        "utc_offset_seconds": utcOffsetSeconds,
        "timezone": timezone,
        "timezone_abbreviation": timezoneAbbreviation,
        "elevation": elevation,
        "hourly_units": hourlyUnits.toJson(),
        "hourly": hourly.toJson(),
      };
}

class Hourly {
  List<String> time;
  List<double> temperature2M;
  List<int> weatherCode;
  List<Weather> weather;

  Hourly({
    required this.time,
    required this.temperature2M,
    required this.weatherCode,
    required this.weather,
  });

  factory Hourly.fromJson(Map<String, dynamic> json) => Hourly(
        time: List<String>.from(json["time"].map((x) => x)),
        temperature2M:
            List<double>.from(json["temperature_2m"].map((x) => x?.toDouble())),
        weatherCode: List<int>.from(json["weather_code"].map((x) => x)),
        weather: List<Weather>.from(
            json["weather"].map((x) => weatherValues.map[x]!)),
      );

  Map<String, dynamic> toJson() => {
        "time": List<dynamic>.from(time.map((x) => x)),
        "temperature_2m": List<dynamic>.from(temperature2M.map((x) => x)),
        "weather_code": List<dynamic>.from(weatherCode.map((x) => x)),
        "weather":
            List<dynamic>.from(weather.map((x) => weatherValues.reverse[x])),
      };
}

enum Weather { FOG, OVERCAST }

final weatherValues =
    EnumValues({"Fog": Weather.FOG, "Overcast": Weather.OVERCAST});

class HourlyUnits {
  String time;
  String temperature2M;
  String weatherCode;

  HourlyUnits({
    required this.time,
    required this.temperature2M,
    required this.weatherCode,
  });

  factory HourlyUnits.fromJson(Map<String, dynamic> json) => HourlyUnits(
        time: json["time"],
        temperature2M: json["temperature_2m"],
        weatherCode: json["weather_code"],
      );

    Map<String, dynamic> toJson() => {
        "time": time,
        "temperature_2m": temperature2M,
        "weather_code": weatherCode,
      };
}

class EnumValues<T> {
  Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    reverseMap = map.map((k, v) => MapEntry(v, k));
    return reverseMap;
  }
}
