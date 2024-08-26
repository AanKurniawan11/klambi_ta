// To parse this JSON data, do
//
//     final categoryhistorymodel = categoryhistorymodelFromJson(jsonString);

import 'dart:convert';

Categoryhistorymodel categoryhistorymodelFromJson(String str) => Categoryhistorymodel.fromJson(json.decode(str));

String categoryhistorymodelToJson(Categoryhistorymodel data) => json.encode(data.toJson());

class Categoryhistorymodel {
  bool status;
  String message;
  List<String> data;

  Categoryhistorymodel({
    required this.status,
    required this.message,
    required this.data,
  });

  factory Categoryhistorymodel.fromJson(Map<String, dynamic> json) => Categoryhistorymodel(
    status: json["status"],
    message: json["message"],
    data: List<String>.from(json["data"].map((x) => x)),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "message": message,
    "data": List<dynamic>.from(data.map((x) => x)),
  };
}
