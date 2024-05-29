

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
  List<String> email;
  List<String> password;

  Data({
    required this.email,
    required this.password,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    email: List<String>.from(json["email"].map((x) => x)),
    password: List<String>.from(json["password"].map((x) => x)),
  );

  Map<String, dynamic> toJson() => {
    "email": List<dynamic>.from(email.map((x) => x)),
    "password": List<dynamic>.from(password.map((x) => x)),
  };
}
