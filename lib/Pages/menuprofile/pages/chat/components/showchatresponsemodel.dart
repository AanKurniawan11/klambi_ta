import 'dart:convert';

// Fungsi untuk memparsing JSON ke model ShowchatResponseModel
ShowchatResponseModel showchatResponseModelFromJson(String str) =>
    ShowchatResponseModel.fromJson(json.decode(str));

String showchatResponseModelToJson(ShowchatResponseModel data) =>
    json.encode(data.toJson());

class ShowchatResponseModel {
  bool success;
  String message;
  List<Datum> data;

  ShowchatResponseModel({
    required this.success,
    required this.message,
    required this.data,
  });

  // Factory method untuk membuat instance dari JSON
  factory ShowchatResponseModel.fromJson(Map<String, dynamic> json) =>
      ShowchatResponseModel(
        success: json["success"],
        message: json["message"],
        data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
      );

  // Method untuk mengubah instance ke dalam bentuk JSON
  Map<String, dynamic> toJson() => {
    "success": success,
    "message": message,
    "data": List<dynamic>.from(data.map((x) => x.toJson())),
  };
}

class Datum {
  int id;
  int senderId;
  String senderType;
  int receiverId;
  String receiverType;
  String message;
  DateTime createdAt;
  DateTime updatedAt;

  Datum({
    required this.id,
    required this.senderId,
    required this.senderType,
    required this.receiverId,
    required this.receiverType,
    required this.message,
    required this.createdAt,
    required this.updatedAt,
  });

  // Factory method untuk membuat instance dari JSON
  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
    id: json["id"],
    senderId: json["sender_id"],
    senderType: json["sender_type"],
    receiverId: json["receiver_id"],
    receiverType: json["receiver_type"],
    message: json["message"],
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
  );

  // Method untuk mengubah instance ke dalam bentuk JSON
  Map<String, dynamic> toJson() => {
    "id": id,
    "sender_id": senderId,
    "sender_type": senderType,
    "receiver_id": receiverId,
    "receiver_type": receiverType,
    "message": message,
    "created_at": createdAt.toIso8601String(),
    "updated_at": updatedAt.toIso8601String(),
  };
}
