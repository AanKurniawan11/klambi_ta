// To parse this JSON data, do
//
//     final showProfileResponse = showProfileResponseFromJson(jsonString);

import 'dart:convert';

ShowProfileResponse showProfileResponseFromJson(String str) => ShowProfileResponse.fromJson(json.decode(str));

String showProfileResponseToJson(ShowProfileResponse data) => json.encode(data.toJson());

class ShowProfileResponse {
  bool success;
  String message;
  Data data;

  ShowProfileResponse({
    required this.success,
    required this.message,
    required this.data,
  });

  factory ShowProfileResponse.fromJson(Map<String, dynamic> json) => ShowProfileResponse(
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
  dynamic image;

  Data({
    required this.name,  // Tambahkan ini
    required this.image,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    name: json["name"],  // Tambahkan ini
    image: json["image"],
  );

  Map<String, dynamic> toJson() => {
    "name": name,  // Tambahkan ini
    "image": image,
  };
}
