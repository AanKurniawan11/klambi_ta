// To parse this JSON data, do
//
//     final idhistorResponseModel = idhistorResponseModelFromJson(jsonString);

import 'dart:convert';

IdhistorResponseModel idhistorResponseModelFromJson(String str) => IdhistorResponseModel.fromJson(json.decode(str));

String idhistorResponseModelToJson(IdhistorResponseModel data) => json.encode(data.toJson());

class IdhistorResponseModel {
  int id;

  IdhistorResponseModel({
    required this.id,
  });

  factory IdhistorResponseModel.fromJson(Map<String, dynamic> json) => IdhistorResponseModel(
    id: json["id"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
  };
}
