

import 'dart:convert';

RegisterResponseModel registerResponseModelFromJson(String str) => RegisterResponseModel.fromJson(json.decode(str));

String registerResponseModelToJson(RegisterResponseModel data) => json.encode(data.toJson());

class RegisterResponseModel {
  bool success;
  String message;
  Data? data; // Change to nullable

  RegisterResponseModel({
    required this.success,
    required this.message,
    this.data,
  });

  factory RegisterResponseModel.fromJson(Map<String, dynamic> json) => RegisterResponseModel(
    success: json["success"],
    message: json["message"],
    data: json["data"] == null ? null : Data.fromJson(json["data"]),
  );

  Map<String, dynamic> toJson() => {
    "success": success,
    "message": message,
    "data": data?.toJson(),
  };
}

class Data {
  List<String> name;
  List<String> email;
  List<String> password;
  List<String> confirmPassword;

  Data({
    required this.name,
    required this.email,
    required this.password,
    required this.confirmPassword,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    name: List<String>.from(json["name"].map((x) => x)),
    email: List<String>.from(json["email"].map((x) => x)),
    password: List<String>.from(json["password"].map((x) => x)),
    confirmPassword: List<String>.from(json["confirm_password"].map((x) => x)),
  );

  Map<String, dynamic> toJson() => {
    "name": List<dynamic>.from(name.map((x) => x)),
    "email": List<dynamic>.from(email.map((x) => x)),
    "password": List<dynamic>.from(password.map((x) => x)),
    "confirm_password": List<dynamic>.from(confirmPassword.map((x) => x)),
  };
}

