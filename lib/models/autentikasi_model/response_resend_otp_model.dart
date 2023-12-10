// To parse this JSON data, do
//
//     final ResponseResendOtpModel = ResponseResendOtpModelFromJson(jsonString);

import 'dart:convert';

ResponseResendOtpModel ResponseResendOtpModelFromJson(String str) => ResponseResendOtpModel.fromJson(json.decode(str));

String ResponseResendOtpModelToJson(ResponseResendOtpModel data) => json.encode(data.toJson());

class ResponseResendOtpModel {
  String message;
  String status;

  ResponseResendOtpModel({
    required this.message,
    required this.status,
  });

  factory ResponseResendOtpModel.fromJson(Map<String, dynamic> json) => ResponseResendOtpModel(
    message: json["message"],
    status: json["status"],
  );

  Map<String, dynamic> toJson() => {
    "message": message,
    "status": status,
  };
}