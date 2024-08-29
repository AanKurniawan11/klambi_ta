import 'dart:convert';

class AddOrderImageModel {
  final int orderId;
  final String image;

  AddOrderImageModel({required this.orderId, required this.image});

  String toJsonString() {
    return jsonEncode({
      'order_id': orderId,
      'image': image,
    });
  }
}
