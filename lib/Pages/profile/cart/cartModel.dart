import 'package:flutter/material.dart';

// To parse this JSON data, do
//
//     final addToCart = addToCartFromJson(jsonString);

import 'dart:convert';

AddToCart addToCartFromJson(String str) => AddToCart.fromJson(json.decode(str));

String addToCartToJson(AddToCart data) => json.encode(data.toJson());

class AddToCart {
  int productsId;
  int quantity;
  String size;

  AddToCart({
    required this.productsId,
    required this.quantity,
    required this.size,
  });

  factory AddToCart.fromJson(Map<String, dynamic> json) => AddToCart(
    productsId: json["products_id"],
    quantity: json["quantity"],
    size: json["size"],
  );

  Map<String, dynamic> toJson() => {
    "products_id": productsId,
    "quantity": quantity,
    "size": size,
  };
}
