// To parse this JSON data, do
//
//     final showOrderModel = showOrderModelFromJson(jsonString);

import 'dart:convert';

ShowOrderModel showOrderModelFromJson(String str) => ShowOrderModel.fromJson(json.decode(str));

String showOrderModelToJson(ShowOrderModel data) => json.encode(data.toJson());

class ShowOrderModel {
  bool success;
  String message;
  List<Datum> data;

  ShowOrderModel({
    required this.success,
    required this.message,
    required this.data,
  });

  factory ShowOrderModel.fromJson(Map<String, dynamic> json) => ShowOrderModel(
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
  Order order;
  List<Product> products;

  Datum({
    required this.order,
    required this.products,
  });

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
    order: Order.fromJson(json["order"]),
    products: List<Product>.from(json["products"].map((x) => Product.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "order": order.toJson(),
    "products": List<dynamic>.from(products.map((x) => x.toJson())),
  };
}

class Order {
  int id;
  int userId;
  int addressId;
  String paymentMethod;
  String shippingMethod;
  String handlingFee;
  String shippingFee;
  String discount;
  int quantity;
  String status;
  String products;
  DateTime createdAt;
  DateTime updatedAt;
  Address address;

  Order({
    required this.id,
    required this.userId,
    required this.addressId,
    required this.paymentMethod,
    required this.shippingMethod,
    required this.handlingFee,
    required this.shippingFee,
    required this.discount,
    required this.quantity,
    required this.status,
    required this.products,
    required this.createdAt,
    required this.updatedAt,
    required this.address,
  });

  factory Order.fromJson(Map<String, dynamic> json) => Order(
    id: json["id"],
    userId: json["user_id"],
    addressId: json["address_id"],
    paymentMethod: json["payment_method"],
    shippingMethod: json["shipping_method"],
    handlingFee: json["handling_fee"],
    shippingFee: json["shipping_fee"],
    discount: json["discount"],
    quantity: json["quantity"],
    status: json["status"],
    products: json["products"],
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
    address: Address.fromJson(json["address"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "user_id": userId,
    "address_id": addressId,
    "payment_method": paymentMethod,
    "shipping_method": shippingMethod,
    "handling_fee": handlingFee,
    "shipping_fee": shippingFee,
    "discount": discount,
    "quantity": quantity,
    "status": status,
    "products": products,
    "created_at": createdAt.toIso8601String(),
    "updated_at": updatedAt.toIso8601String(),
    "address": address.toJson(),
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

class Product {
  int productId;
  int quantity;
  String size;
  int price;
  String title;
  String image;

  Product({
    required this.productId,
    required this.quantity,
    required this.size,
    required this.price,
    required this.title,
    required this.image,
  });

  factory Product.fromJson(Map<String, dynamic> json) => Product(
    productId: json["product_id"],
    quantity: json["quantity"],
    size: json["size"],
    price: json["price"],
    title: json["title"],
    image: json["image"],
  );

  Map<String, dynamic> toJson() => {
    "product_id": productId,
    "quantity": quantity,
    "size": size,
    "price": price,
    "title": title,
    "image": image,
  };
}
