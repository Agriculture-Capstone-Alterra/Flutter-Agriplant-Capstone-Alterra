// To parse this JSON data, do
//
//     final currentWeatherModel = currentWeatherModelFromJson(jsonString);

import 'dart:convert';

CurrentWeatherModel currentWeatherModelFromJson(String str) =>
    CurrentWeatherModel.fromJson(json.decode(str));

String currentWeatherModelToJson(CurrentWeatherModel data) =>
    json.encode(data.toJson());

class CurrentWeatherModel {
  Data data;
  String message;
  String status;

  CurrentWeatherModel({
    required this.data,
    required this.message,
    required this.status,
  });

  factory CurrentWeatherModel.fromJson(Map<String, dynamic> json) =>
      CurrentWeatherModel(
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
  double latitude;
  double longitude;
  double generationtimeMs;
  int utcOffsetSeconds;
  String timezone;
  String timezoneAbbreviation;
  int elevation;
  CurrentUnits currentUnits;
  Current current;

  Data({
    required this.latitude,
    required this.longitude,
    required this.generationtimeMs,
    required this.utcOffsetSeconds,
    required this.timezone,
    required this.timezoneAbbreviation,
    required this.elevation,
    required this.currentUnits,
    required this.current,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        latitude: json["latitude"]?.toDouble(),
        longitude: json["longitude"]?.toDouble(),
        generationtimeMs: json["generationtime_ms"]?.toDouble(),
        utcOffsetSeconds: json["utc_offset_seconds"],
        timezone: json["timezone"],
        timezoneAbbreviation: json["timezone_abbreviation"],
        elevation: json["elevation"],
        currentUnits: CurrentUnits.fromJson(json["current_units"]),
        current: Current.fromJson(json["current"]),
      );

  Map<String, dynamic> toJson() => {
        "latitude": latitude,
        "longitude": longitude,
        "generationtime_ms": generationtimeMs,
        "utc_offset_seconds": utcOffsetSeconds,
        "timezone": timezone,
        "timezone_abbreviation": timezoneAbbreviation,
        "elevation": elevation,
        "current_units": currentUnits.toJson(),
        "current": current.toJson(),
      };
}

class Current {
  String time;
  int interval;
  double temperature2M;
  int precipitation;
  int weatherCode;
  String weather;
  double windSpeed10M;

  Current({
    required this.time,
    required this.interval,
    required this.temperature2M,
    required this.precipitation,
    required this.weatherCode,
    required this.weather,
    required this.windSpeed10M,
  });

  factory Current.fromJson(Map<String, dynamic> json) => Current(
        time: json["time"],
        interval: json["interval"],
        temperature2M: json["temperature_2m"]?.toDouble(),
        precipitation: json["precipitation"],
        weatherCode: json["weather_code"],
        weather: json["weather"],
        windSpeed10M: json["wind_speed_10m"]?.toDouble(),
      );

  Map<String, dynamic> toJson() => {
        "time": time,
        "interval": interval,
        "temperature_2m": temperature2M,
        "precipitation": precipitation,
        "weather_code": weatherCode,
        "weather": weather,
        "wind_speed_10m": windSpeed10M,
      };
}

class CurrentUnits {
  String time;
  String interval;
  String temperature2M;
  String precipitation;
  String weatherCode;
  String windSpeed10M;

  CurrentUnits({
    required this.time,
    required this.interval,
    required this.temperature2M,
    required this.precipitation,
    required this.weatherCode,
    required this.windSpeed10M,
  });

  factory CurrentUnits.fromJson(Map<String, dynamic> json) => CurrentUnits(
        time: json["time"],
        interval: json["interval"],
        temperature2M: json["temperature_2m"],
        precipitation: json["precipitation"],
        weatherCode: json["weather_code"],
        windSpeed10M: json["wind_speed_10m"],
      );

  Map<String, dynamic> toJson() => {
        "time": time,
        "interval": interval,
        "temperature_2m": temperature2M,
        "precipitation": precipitation,
        "weather_code": weatherCode,
        "wind_speed_10m": windSpeed10M,
      };
}
