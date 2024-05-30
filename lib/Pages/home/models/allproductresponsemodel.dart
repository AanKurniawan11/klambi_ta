// To parse this JSON data, do
//
//     final allproductResponseModel = allproductResponseModelFromJson(jsonString);

import 'dart:convert';

AllproductResponseModel allproductResponseModelFromJson(String str) => AllproductResponseModel.fromJson(json.decode(str));

String allproductResponseModelToJson(AllproductResponseModel data) => json.encode(data.toJson());

class AllproductResponseModel {
  bool status;
  String message;
  List<Datum> data;

  AllproductResponseModel({
    required this.status,
    required this.message,
    required this.data,
  });

  factory AllproductResponseModel.fromJson(Map<String, dynamic> json) => AllproductResponseModel(
    status: json["status"],
    message: json["message"],
    data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "message": message,
    "data": List<dynamic>.from(data.map((x) => x.toJson())),
  };
}

class Datum {
  int id;
  String title;
  int price;
  String descripsi;
  double rate;
  String category;
  String imageUrl;
  DateTime createdAt;
  DateTime updatedAt;

  Datum({
    required this.id,
    required this.title,
    required this.price,
    required this.descripsi,
    required this.rate,
    required this.category,
    required this.imageUrl,
    required this.createdAt,
    required this.updatedAt,
  });

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
    id: json["id"],
    title: json["title"],
    price: json["price"],
    descripsi: json["descripsi"],
    rate: json["rate"]?.toDouble(),
    category: json["category"],
    imageUrl: json["image_url"],
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "title": title,
    "price": price,
    "descripsi": descripsi,
    "rate": rate,
    "category": category,
    "image_url": imageUrl,
    "created_at": createdAt.toIso8601String(),
    "updated_at": updatedAt.toIso8601String(),
  };
}
