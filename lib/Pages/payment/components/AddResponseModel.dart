// To parse this JSON data, do
//
//     final addresponseModel = addresponseModelFromJson(jsonString);

import 'dart:convert';

AddOrderponseModel addresponseModelFromJson(String str) => AddOrderponseModel.fromJson(json.decode(str));

String addresponseModelToJson(AddOrderponseModel data) => json.encode(data.toJson());

class AddOrderponseModel {
  int productId;
  int quantity;
  String size;

  AddOrderponseModel({
    required this.productId,
    required this.quantity,
    required this.size,
  });

  factory AddOrderponseModel.fromJson(Map<String, dynamic> json) => AddOrderponseModel(
    productId: json["product_id"],
    quantity: json["quantity"],
    size: json["size"],
  );

  Map<String, dynamic> toJson() => {
    "product_id": productId,
    "quantity": quantity,
    "size": size,
  };
}
