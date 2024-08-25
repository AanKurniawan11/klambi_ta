// To parse this JSON data, do
//
//     final showchatResponseModel = showchatResponseModelFromJson(jsonString);

import 'dart:convert';

ShowchatResponseModel showchatResponseModelFromJson(String str) => ShowchatResponseModel.fromJson(json.decode(str));

String showchatResponseModelToJson(ShowchatResponseModel data) => json.encode(data.toJson());

class ShowchatResponseModel {
  bool success;
  String message;
  List<Datum> data;

  ShowchatResponseModel({
    required this.success,
    required this.message,
    required this.data,
  });

  factory ShowchatResponseModel.fromJson(Map<String, dynamic> json) => ShowchatResponseModel(
    success: json["success"],
    message: json["message"],
    data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "success": success,
    "message": message,
    "data": List<dynamic>.from(data.map((x) => x.toJson())),
  };
}

class Datum {
  int id;
  String message;
  String sender;
  int senderId;
  String receiver;
  int receiverId;
  DateTime createdAt;

  Datum({
    required this.id,
    required this.message,
    required this.sender,
    required this.senderId,
    required this.receiver,
    required this.receiverId,
    required this.createdAt,
  });

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
    id: json["id"],
    message: json["message"],
    sender: json["sender"],
    senderId: json["sender_id"],
    receiver: json["receiver"],
    receiverId: json["receiver_id"],
    createdAt: DateTime.parse(json["created_at"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "message": message,
    "sender": sender,
    "sender_id": senderId,
    "receiver": receiver,
    "receiver_id": receiverId,
    "created_at": createdAt.toIso8601String(),
  };
}
