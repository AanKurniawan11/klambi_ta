// To parse this JSON data, do
//
//     final detailOrderModel = detailOrderModelFromJson(jsonString);

import 'dart:convert';

DetailOrderModel detailOrderModelFromJson(String str) => DetailOrderModel.fromJson(json.decode(str));

String detailOrderModelToJson(DetailOrderModel data) => json.encode(data.toJson());

class DetailOrderModel {
  bool success;
  String message;
  Data data;

  DetailOrderModel({
    required this.success,
    required this.message,
    required this.data,
  });

  factory DetailOrderModel.fromJson(Map<String, dynamic> json) => DetailOrderModel(
    success: json["success"] ?? false, // Default to false if null
    message: json["message"] ?? 'Unknown error', // Provide default message
    data: Data.fromJson(json["data"]),
  );

  Map<String, dynamic> toJson() => {
    "success": success,
    "message": message,
    "data": data.toJson(),
  };
}

class Data {
  OrderHistory orderHistory;
  Product product;
  Address address;
  dynamic image;

  Data({
    required this.orderHistory,
    required this.product,
    required this.address,
    required this.image,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    orderHistory: OrderHistory.fromJson(json["order_history"]),
    product: Product.fromJson(json["product"]),
    address: Address.fromJson(json["address"]),
    image: json["image"],
  );

  Map<String, dynamic> toJson() => {
    "order_history": orderHistory.toJson(),
    "product": product.toJson(),
    "address": address.toJson(),
    "image": image,
  };
}

class Address {
  int id;
  int userId;
  String nomorTelepon;
  String namaLengkap;
  String keterangan;
  String provinsi;
  DateTime createdAt;
  DateTime updatedAt;

  Address({
    required this.id,
    required this.userId,
    required this.nomorTelepon,
    required this.namaLengkap,
    required this.keterangan,
    required this.provinsi,
    required this.createdAt,
    required this.updatedAt,
  });

  factory Address.fromJson(Map<String, dynamic> json) => Address(
    id: json["id"],
    userId: json["user_id"],
    nomorTelepon: json["nomor_telepon"],
    namaLengkap: json["nama_lengkap"],
    keterangan: json["keterangan"],
    provinsi: json["provinsi"],
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "user_id": userId,
    "nomor_telepon": nomorTelepon,
    "nama_lengkap": namaLengkap,
    "keterangan": keterangan,
    "provinsi": provinsi,
    "created_at": createdAt.toIso8601String(),
    "updated_at": updatedAt.toIso8601String(),
  };
}

class OrderHistory {
  int id;
  int orderId;
  int userId;
  int addressId;
  String status;
  int totalPrice;
  String paymentMethod;
  int handlingFee;
  int shippingFee;
  String shippingMethod;
  DateTime orderTime;
  DateTime createdAt;
  DateTime updatedAt;

  OrderHistory({
    required this.id,
    required this.orderId,
    required this.userId,
    required this.addressId,
    required this.status,
    required this.totalPrice,
    required this.paymentMethod,
    required this.handlingFee,
    required this.shippingFee,
    required this.shippingMethod,
    required this.orderTime,
    required this.createdAt,
    required this.updatedAt,
  });

  factory OrderHistory.fromJson(Map<String, dynamic> json) => OrderHistory(
    id: json["id"],
    orderId: json["order_id"],
    userId: json["user_id"],
    addressId: json["address_id"],
    status: json["status"],
    totalPrice: json["total_price"],
    paymentMethod: json["payment_method"],
    handlingFee: json["handling_fee"],
    shippingFee: json["shipping_fee"],
    shippingMethod: json["shipping_method"],
    orderTime: DateTime.parse(json["order_time"]),
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "order_id": orderId,
    "user_id": userId,
    "address_id": addressId,
    "status": status,
    "total_price": totalPrice,
    "payment_method": paymentMethod,
    "handling_fee": handlingFee,
    "shipping_fee": shippingFee,
    "shipping_method": shippingMethod,
    "order_time": orderTime.toIso8601String(),
    "created_at": createdAt.toIso8601String(),
    "updated_at": updatedAt.toIso8601String(),
  };
}

class Product {
  int productId;
  int quantity;
  String size;
  int price;
  bool fromCart;
  String title;
  String image;

  Product({
    required this.productId,
    required this.quantity,
    required this.size,
    required this.price,
    required this.fromCart,
    required this.title,
    required this.image,
  });

  factory Product.fromJson(Map<String, dynamic> json) => Product(
    productId: json["product_id"],
    quantity: json["quantity"],
    size: json["size"],
    price: json["price"],
    fromCart: json["from_cart"] ?? false, // Handle null value here
    title: json["title"],
    image: json["image"],
  );

  Map<String, dynamic> toJson() => {
    "product_id": productId,
    "quantity": quantity,
    "size": size,
    "price": price,
    "from_cart": fromCart,
    "title": title,
    "image": image,
  };
}
