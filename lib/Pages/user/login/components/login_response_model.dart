// To parse this JSON data, do
//
//     final loginResponseModel = loginResponseModelFromJson(jsonString);

import 'dart:convert';

LoginResponseModel loginResponseModelFromJson(String str) => LoginResponseModel.fromJson(json.decode(str));

String loginResponseModelToJson(LoginResponseModel data) => json.encode(data.toJson());

class LoginResponseModel {
  bool success;
  String message;
  Data data;

  LoginResponseModel({
    required this.success,
    required this.message,
    required this.data,
  });

  factory LoginResponseModel.fromJson(Map<String, dynamic> json) => LoginResponseModel(
    success: json["success"],
    message: json["message"],
    data: Data.fromJson(json["data"]),
  );

  Map<String, dynamic> toJson() => {
    "success": success,
    "message": message,
    "data": data.toJson(),
  };
}

class Data {
  String name;
  String token;
  String email;

  Data({
    required this.name,
    required this.token,
    required this.email,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    name: json["name"],
    token: json["token"],
    email: json["email"],
  );

  Map<String, dynamic> toJson() => {
    "name": name,
    "token": token,
    "email": email,
  };
}
