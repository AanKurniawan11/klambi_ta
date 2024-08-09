// To parse this JSON data, do
//
//     final getUser = getUserFromJson(jsonString);

import 'dart:convert';

GetUser getUserFromJson(String str) => GetUser.fromJson(json.decode(str));

String getUserToJson(GetUser data) => json.encode(data.toJson());

class GetUser {
  bool success;
  String message;
  Data data;

  GetUser({
    required this.success,
    required this.message,
    required this.data,
  });

  factory GetUser.fromJson(Map<String, dynamic> json) => GetUser(
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
  String email;
  String image;

  Data({
    required this.name,
    required this.email,
    required this.image,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    name: json["name"],
    email: json["email"],
    image: json["image"],
  );

  Map<String, dynamic> toJson() => {
    "name": name,
    "email": email,
    "image": image,
  };
}
