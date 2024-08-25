// To parse this JSON data, do
//
//     final payresponseModel = payresponseModelFromJson(jsonString);

import 'dart:convert';

PayresponseModel payresponseModelFromJson(String str) => PayresponseModel.fromJson(json.decode(str));

String payresponseModelToJson(PayresponseModel data) => json.encode(data.toJson());

class PayresponseModel {
  String paymentMethod;

  PayresponseModel({
    required this.paymentMethod,
  });

  factory PayresponseModel.fromJson(Map<String, dynamic> json) => PayresponseModel(
    paymentMethod: json["payment_method"],
  );

  Map<String, dynamic> toJson() => {
    "payment_method": paymentMethod,
  };
}
