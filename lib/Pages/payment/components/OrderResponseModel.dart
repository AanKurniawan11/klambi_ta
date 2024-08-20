import 'dart:convert';

// To parse this JSON data, do
//
//     final addOrderModel = addOrderModelFromJson(jsonString);

AddOrderModel addOrderModelFromJson(String str) => AddOrderModel.fromJson(json.decode(str));

String addOrderModelToJson(AddOrderModel data) => json.encode(data.toJson());

class AddOrderModel {
  int productId;
  int quantity;
  String size;
  String paymentMethod;
  String shippingMethod;
  int addressId;

  AddOrderModel({
    required this.productId,
    required this.quantity,
    required this.size,
    required this.paymentMethod,
    required this.shippingMethod,
    required this.addressId,
  });

  factory AddOrderModel.fromJson(Map<String, dynamic> json) => AddOrderModel(
    productId: json["product_id"],
    quantity: json["quantity"],
    size: json["size"],
    paymentMethod: json["payment_method"],
    shippingMethod: json["shipping_method"],
    addressId: json["address_id"],
  );

  Map<String, dynamic> toJson() => {
    "product_id": productId,
    "quantity": quantity,
    "size": size,
    "payment_method": paymentMethod,
    "shipping_method": shippingMethod,
    "address_id": addressId,
  };
}
