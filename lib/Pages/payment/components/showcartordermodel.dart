import 'dart:convert';

ShowCartOrderModel showCartOrderModelFromJson(String str) => ShowCartOrderModel.fromJson(json.decode(str));

String showCartOrderModelToJson(ShowCartOrderModel data) => json.encode(data.toJson());

class ShowCartOrderModel {
  bool success;
  String message;
  Data data;

  ShowCartOrderModel({
    required this.success,
    required this.message,
    required this.data,
  });

  factory ShowCartOrderModel.fromJson(Map<String, dynamic> json) => ShowCartOrderModel(
    success: json["success"],
    message: json["message"],
    data: Data.fromJson(json["data"]),
  );

  Map<String, dynamic> toJson() => {
    "success": success,
    "message": message,
    "data": data.toJson(),
  };
}

class Data {
  Order order;
  List<Product> products;

  Data({
    required this.order,
    required this.products,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
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
  String status;
  int totalPrice;
  String paymentMethod;
  int handlingFee;
  int shippingFee;
  String shippingMethod;
  DateTime? orderTime;
  DateTime createdAt;
  DateTime updatedAt;
  Address address;

  Order({
    required this.id,
    required this.userId,
    required this.addressId,
    required this.status,
    required this.totalPrice,
    required this.paymentMethod,
    required this.handlingFee,
    required this.shippingFee,
    required this.shippingMethod,
    this.orderTime,
    required this.createdAt,
    required this.updatedAt,
    required this.address,
  });

  factory Order.fromJson(Map<String, dynamic> json) => Order(
    id: json["id"],
    userId: json["user_id"],
    addressId: json["address_id"],
    status: json["status"] ?? '',
    totalPrice: json["total_price"],
    paymentMethod: json["payment_method"] ?? '',
    handlingFee: json["handling_fee"],
    shippingFee: json["shipping_fee"],
    shippingMethod: json["shipping_method"] ?? '',
    orderTime: json["order_time"] != null ? DateTime.parse(json["order_time"]) : null,
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
    address: Address.fromJson(json["address"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "user_id": userId,
    "address_id": addressId,
    "status": status,
    "total_price": totalPrice,
    "payment_method": paymentMethod,
    "handling_fee": handlingFee,
    "shipping_fee": shippingFee,
    "shipping_method": shippingMethod,
    "order_time": orderTime?.toIso8601String(),
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
    size: json["size"] ?? '',
    price: json["price"],
    fromCart: json["from_cart"],
    title: json["title"] ?? '',
    image: json["imagee"] ?? '',
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
