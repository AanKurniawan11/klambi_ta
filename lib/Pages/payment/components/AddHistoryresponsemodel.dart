// To parse this JSON data, do
//
//     final addHistoryResponseModel = addHistoryResponseModelFromJson(jsonString);

import 'dart:convert';

AddHistoryResponseModel addHistoryResponseModelFromJson(String str) => AddHistoryResponseModel.fromJson(json.decode(str));

String addHistoryResponseModelToJson(AddHistoryResponseModel data) => json.encode(data.toJson());

class AddHistoryResponseModel {
  int orderId;

  AddHistoryResponseModel({
    required this.orderId,
  });

  factory AddHistoryResponseModel.fromJson(Map<String, dynamic> json) => AddHistoryResponseModel(
    orderId: json["order_id"],
  );

  Map<String, dynamic> toJson() => {
    "order_id": orderId,
  };
}
