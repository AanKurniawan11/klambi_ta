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
  int sold;
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
    required this.sold,
    required this.createdAt,
    required this.updatedAt,
  });

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
    id: json["id"] ?? 0,  // Default to 0 if null
    title: json["title"] ?? '',  // Default to empty string if null
    price: json["price"] ?? 0,  // Default to 0 if null
    descripsi: json["descripsi"] ?? '',  // Default to empty string if null
    rate: (json["rate"] != null) ? json["rate"].toDouble() : 0.0,  // Default to 0.0 if null
    category: categoryValues.map[json["category"]] ?? Category.LENGAN_PANJANG,  // Default to a valid category if null
    imagee: json["imagee"] ?? '',  // Default to empty string if null
    stock: json["stock"] ?? 0,  // Default to 0 if null
    sold: json["sold"] ?? 0,  // Default to 0 if null
    createdAt: DateTime.parse(json["created_at"] ?? DateTime.now().toIso8601String()),  // Default to current date if null
    updatedAt: DateTime.parse(json["updated_at"] ?? DateTime.now().toIso8601String()),  // Default to current date if null
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
    "sold": sold,
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
