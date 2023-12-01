import 'dart:convert';

RegisterModel registerModelFromJson(String str) => RegisterModel.fromJson(json.decode(str));

String registerModelToJson(RegisterModel data) => json.encode(data.toJson());

class RegisterModel {
  String email;
  String firebaseDeviceToken;
  String name;
  String password;

  RegisterModel({
    required this.email,
    required this.firebaseDeviceToken,
    required this.name,
    required this.password,
  });

  factory RegisterModel.fromJson(Map<String, dynamic> json) => RegisterModel(
    email: json["email"],
    firebaseDeviceToken: json["firebase_device_token"],
    name: json["name"],
    password: json["password"],
  );

  Map<String, dynamic> toJson() => {
    "email": email,
    "firebase_device_token": firebaseDeviceToken,
    "name": name,
    "password": password,
  };
}