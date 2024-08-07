// To parse this JSON data, do
//
//     final selectedCartModel = selectedCartModelFromJson(jsonString);

import 'dart:convert';

SelectedCartModel selectedCartModelFromJson(String str) => SelectedCartModel.fromJson(json.decode(str));

String selectedCartModelToJson(SelectedCartModel data) => json.encode(data.toJson());

class SelectedCartModel {
  int cartId;
  bool selected;
  int quantity;

  SelectedCartModel({
    required this.cartId,
    required this.selected,
    required this.quantity,
  });

  factory SelectedCartModel.fromJson(Map<String, dynamic> json) => SelectedCartModel(
    cartId: json["cart_id"],
    selected: json["selected"],
    quantity: json["quantity"],
  );

  Map<String, dynamic> toJson() => {
    "cart_id": cartId,
    "selected": selected,
    "quantity": quantity,
  };
}
