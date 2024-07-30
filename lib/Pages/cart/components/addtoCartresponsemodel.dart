// To parse this JSON data, do
//
//     final addtoCartResponseModel = addtoCartResponseModelFromJson(jsonString);

import 'dart:convert';

AddtoCartResponseModel addtoCartResponseModelFromJson(String str) => AddtoCartResponseModel.fromJson(json.decode(str));

String addtoCartResponseModelToJson(AddtoCartResponseModel data) => json.encode(data.toJson());

class AddtoCartResponseModel {
  int userId;
  int productsId;
  int quantity;
  String size;

  AddtoCartResponseModel({
    required this.userId,
    required this.productsId,
    required this.quantity,
    required this.size,
  });

  factory AddtoCartResponseModel.fromJson(Map<String, dynamic> json) => AddtoCartResponseModel(
    userId: json["user_id"],
    productsId: json["products_id"],
    quantity: json["quantity"],
    size: json["size"],
  );

  Map<String, dynamic> toJson() => {
    "user_id": userId,
    "products_id": productsId,
    "quantity": quantity,
    "size": size,
  };
}
