// To parse this JSON data, do
//
//     final allstatusmodel = allstatusmodelFromJson(jsonString);

import 'dart:convert';

Allstatusmodel allstatusmodelFromJson(String str) => Allstatusmodel.fromJson(json.decode(str));

String allstatusmodelToJson(Allstatusmodel data) => json.encode(data.toJson());

class Allstatusmodel {
  bool success;
  String message;
  List<Datum> data;

  Allstatusmodel({
    required this.success,
    required this.message,
    required this.data,
  });

  factory Allstatusmodel.fromJson(Map<String, dynamic> json) => Allstatusmodel(
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
  dynamic image;

  Datum({
    required this.order,
    required this.products,
    required this.image,
  });

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
    order: Order.fromJson(json["order"]),
    products: List<Product>.from(json["products"].map((x) => Product.fromJson(x))),
    image: json["image"],
  );

  Map<String, dynamic> toJson() => {
    "order": order.toJson(),
    "products": List<dynamic>.from(products.map((x) => x.toJson())),
    "image": image,
  };
}

class Order {
  int id;
  int orderId;
  int userId;
  int addressId;
  String products;
  String status;
  int totalPrice;
  String paymentMethod;
  int handlingFee;
  int shippingFee;
  String shippingMethod;
  DateTime orderTime;
  DateTime createdAt;
  DateTime updatedAt;
  User user;
  Address address;

  Order({
    required this.id,
    required this.orderId,
    required this.userId,
    required this.addressId,
    required this.products,
    required this.status,
    required this.totalPrice,
    required this.paymentMethod,
    required this.handlingFee,
    required this.shippingFee,
    required this.shippingMethod,
    required this.orderTime,
    required this.createdAt,
    required this.updatedAt,
    required this.user,
    required this.address,
  });

  factory Order.fromJson(Map<String, dynamic> json) => Order(
    id: json["id"],
    orderId: json["order_id"],
    userId: json["user_id"],
    addressId: json["address_id"],
    products: json["products"],
    status: json["status"],
    totalPrice: json["total_price"],
    paymentMethod: json["payment_method"],
    handlingFee: json["handling_fee"],
    shippingFee: json["shipping_fee"],
    shippingMethod: json["shipping_method"],
    orderTime: DateTime.parse(json["order_time"]),
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
    user: User.fromJson(json["user"]),
    address: Address.fromJson(json["address"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "order_id": orderId,
    "user_id": userId,
    "address_id": addressId,
    "products": products,
    "status": status,
    "total_price": totalPrice,
    "payment_method": paymentMethod,
    "handling_fee": handlingFee,
    "shipping_fee": shippingFee,
    "shipping_method": shippingMethod,
    "order_time": orderTime.toIso8601String(),
    "created_at": createdAt.toIso8601String(),
    "updated_at": updatedAt.toIso8601String(),
    "user": user.toJson(),
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

class User {
  int id;
  String name;
  String email;
  dynamic emailVerifiedAt;
  dynamic apiToken;
  String image;
  DateTime createdAt;
  DateTime updatedAt;

  User({
    required this.id,
    required this.name,
    required this.email,
    required this.emailVerifiedAt,
    required this.apiToken,
    required this.image,
    required this.createdAt,
    required this.updatedAt,
  });

  factory User.fromJson(Map<String, dynamic> json) => User(
    id: json["id"],
    name: json["name"],
    email: json["email"],
    emailVerifiedAt: json["email_verified_at"],
    apiToken: json["api_token"],
    image: json["image"],
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "email": email,
    "email_verified_at": emailVerifiedAt,
    "api_token": apiToken,
    "image": image,
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
