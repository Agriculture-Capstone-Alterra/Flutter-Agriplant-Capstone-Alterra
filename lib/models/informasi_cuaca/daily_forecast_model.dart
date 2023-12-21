// To parse this JSON data, do
//
//     final daillyForecastModel = daillyForecastModelFromJson(jsonString);

import 'dart:convert';

DaillyForecastModel daillyForecastModelFromJson(String str) =>
    DaillyForecastModel.fromJson(json.decode(str));

String daillyForecastModelToJson(DaillyForecastModel data) =>
    json.encode(data.toJson());

class DaillyForecastModel {
  Data data;
  String message;
  String status;

  DaillyForecastModel({
    required this.data,
    required this.message,
    required this.status,
  });

  factory DaillyForecastModel.fromJson(Map<String, dynamic> json) =>
      DaillyForecastModel(
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
  DailyUnits dailyUnits;
  Daily daily;

  Data({
    required this.latitude,
    required this.longitude,
    required this.generationtimeMs,
    required this.utcOffsetSeconds,
    required this.timezone,
    required this.timezoneAbbreviation,
    required this.elevation,
    required this.dailyUnits,
    required this.daily,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        latitude: json["latitude"],
        longitude: json["longitude"]?.toDouble(),
        generationtimeMs: json["generationtime_ms"]?.toDouble(),
        utcOffsetSeconds: json["utc_offset_seconds"],
        timezone: json["timezone"],
        timezoneAbbreviation: json["timezone_abbreviation"],
        elevation: json["elevation"],
        dailyUnits: DailyUnits.fromJson(json["daily_units"]),
        daily: Daily.fromJson(json["daily"]),
      );

  Map<String, dynamic> toJson() => {
        "latitude": latitude,
        "longitude": longitude,
        "generationtime_ms": generationtimeMs,
        "utc_offset_seconds": utcOffsetSeconds,
        "timezone": timezone,
        "timezone_abbreviation": timezoneAbbreviation,
        "elevation": elevation,
        "daily_units": dailyUnits.toJson(),
        "daily": daily.toJson(),
      };
}

class Daily {
  List<DateTime> time;
  List<int> weatherCode;
  List<String> weather;
  List<double> temperature2MMax;
  List<double> temperature2MMin;

  Daily({
    required this.time,
    required this.weatherCode,
    required this.weather,
    required this.temperature2MMax,
    required this.temperature2MMin,
  });

  factory Daily.fromJson(Map<String, dynamic> json) => Daily(
        time: List<DateTime>.from(json["time"].map((x) => DateTime.parse(x))),
        weatherCode: List<int>.from(json["weather_code"].map((x) => x)),
        weather: List<String>.from(json["weather"].map((x) => x)),
        temperature2MMax: List<double>.from(
            json["temperature_2m_max"].map((x) => x?.toDouble())),
        temperature2MMin: List<double>.from(
            json["temperature_2m_min"].map((x) => x?.toDouble())),
      );

  Map<String, dynamic> toJson() => {
        "time": List<dynamic>.from(time.map((x) =>
            "${x.year.toString().padLeft(4, '0')}-${x.month.toString().padLeft(2, '0')}-${x.day.toString().padLeft(2, '0')}")),
        "weather_code": List<dynamic>.from(weatherCode.map((x) => x)),
        "weather": List<dynamic>.from(weather.map((x) => x)),
        "temperature_2m_max":
            List<dynamic>.from(temperature2MMax.map((x) => x)),
        "temperature_2m_min":
            List<dynamic>.from(temperature2MMin.map((x) => x)),
      };
}

class DailyUnits {
  String time;
  String weatherCode;
  String temperature2MMax;
  String temperature2MMin;

  DailyUnits({
    required this.time,
    required this.weatherCode,
    required this.temperature2MMax,
    required this.temperature2MMin,
  });

  factory DailyUnits.fromJson(Map<String, dynamic> json) => DailyUnits(
        time: json["time"],
        weatherCode: json["weather_code"],
        temperature2MMax: json["temperature_2m_max"],
        temperature2MMin: json["temperature_2m_min"],
      );

  Map<String, dynamic> toJson() => {
        "time": time,
        "weather_code": weatherCode,
        "temperature_2m_max": temperature2MMax,
        "temperature_2m_min": temperature2MMin,
      };
}
