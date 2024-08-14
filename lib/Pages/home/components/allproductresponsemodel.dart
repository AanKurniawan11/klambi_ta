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
  Category category;
  String imagee;
  int stock;
  DateTime createdAt;
  DateTime updatedAt;

  Datum({
    required this.id,
    required this.title,
    required this.price,
    required this.descripsi,
    required this.rate,
    required this.category,
    required this.imagee,
    required this.stock,
    required this.createdAt,
    required this.updatedAt,
  });

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
    id: json["id"],
    title: json["title"],
    price: json["price"],
    descripsi: json["descripsi"],
    rate: json["rate"]?.toDouble(),
    category: categoryValues.map[json["category"]]!,
    imagee: json["imagee"],
    stock: json["stock"],
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "title": title,
    "price": price,
    "descripsi": descripsi,
    "rate": rate,
    "category": categoryValues.reverse[category],
    "imagee": imagee,
    "stock": stock,
    "created_at": createdAt.toIso8601String(),
    "updated_at": updatedAt.toIso8601String(),
  };
}

enum Category {
  LENGAN_PANJANG,
  LENGAN_PENDEK,
  OVERSIZE
}

final categoryValues = EnumValues({
  "Lengan Panjang": Category.LENGAN_PANJANG,
  "Lengan Pendek": Category.LENGAN_PENDEK,
  "Oversize": Category.OVERSIZE
});

class EnumValues<T> {
  Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    reverseMap = map.map((k, v) => MapEntry(v, k));
    return reverseMap;
  }
}
