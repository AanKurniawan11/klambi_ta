/// To parse this JSON data, do
//
//     final updateProfileResponse = updateProfileResponseFromJson(jsonString);

import 'dart:convert';

UpdateProfileResponse updateProfileResponseFromJson(String str) => UpdateProfileResponse.fromJson(json.decode(str));

String updateProfileResponseToJson(UpdateProfileResponse data) => json.encode(data.toJson());

class UpdateProfileResponse {
  bool success;
  String message;
  Datas data;

  UpdateProfileResponse({
    required this.success,
    required this.message,
    required this.data,
  });

  factory UpdateProfileResponse.fromJson(Map<String, dynamic> json) => UpdateProfileResponse(
    success: json["success"],
    message: json["message"],
    data: Datas.fromJson(json["data"]),
  );

  Map<String, dynamic> toJson() => {
    "success": success,
    "message": message,
    "data": data.toJson(),
  };
}

class Datas {
  String name;
  String username;
  String image;

  Datas({
    required this.name,
    required this.username,
    required this.image,
  });

  factory Datas.fromJson(Map<String, dynamic> json) => Datas(
    name: json["name"],
    username: json["username"],
    image: json["image"],
  );

  Map<String, dynamic> toJson() => {
    "name": name,
    "username": username,
    "image": image,
  };
}
