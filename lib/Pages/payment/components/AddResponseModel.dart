// To parse this JSON data, do
//
//     final addresponseModel = addresponseModelFromJson(jsonString);

import 'dart:convert';

AddresponseModel addresponseModelFromJson(String str) => AddresponseModel.fromJson(json.decode(str));

String addresponseModelToJson(AddresponseModel data) => json.encode(data.toJson());

class AddresponseModel {
  int productId;
  int quantity;
  String size;

  AddresponseModel({
    required this.productId,
    required this.quantity,
    required this.size,
  });

  factory AddresponseModel.fromJson(Map<String, dynamic> json) => AddresponseModel(
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
