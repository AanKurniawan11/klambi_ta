// To parse this JSON data, do
//
//     final chatResponseModel = chatResponseModelFromJson(jsonString);

import 'dart:convert';

ChatResponseModel chatResponseModelFromJson(String str) => ChatResponseModel.fromJson(json.decode(str));

String chatResponseModelToJson(ChatResponseModel data) => json.encode(data.toJson());

class ChatResponseModel {
  int receiverId;
  String message;

  ChatResponseModel({
    required this.receiverId,
    required this.message,
  });

  factory ChatResponseModel.fromJson(Map<String, dynamic> json) => ChatResponseModel(
    receiverId: json["receiver_id"],
    message: json["message"],
  );

  Map<String, dynamic> toJson() => {
    "receiver_id": receiverId,
    "message": message,
  };
}
