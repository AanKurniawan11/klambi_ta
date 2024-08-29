import 'dart:convert';

OrderHistoryResponse orderHistoryResponseFromJson(String str) => OrderHistoryResponse.fromJson(json.decode(str));

String orderHistoryResponseToJson(OrderHistoryResponse data) => json.encode(data.toJson());

class OrderHistoryResponse {
  bool success;
  String message;
  List<Datum> data;

  OrderHistoryResponse({
    required this.success,
    required this.message,
    required this.data,
  });

  factory OrderHistoryResponse.fromJson(Map<String, dynamic> json) => OrderHistoryResponse(
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
  int orderHistoryId;
  Order order;
  Address address;
  List<Product> products;
  ImageData image;

  Datum({
    required this.orderHistoryId,
    required this.order,
    required this.address,
    required this.products,
    required this.image,
  });

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
    orderHistoryId: json["order_history_id"],
    order: Order.fromJson(json["order"]),
    address: Address.fromJson(json["address"]),
    products: List<Product>.from(json["products"].map((x) => Product.fromJson(x))),
    image: ImageData.fromJson(json["image"]),
  );

  Map<String, dynamic> toJson() => {
    "order_history_id": orderHistoryId,
    "order": order.toJson(),
    "address": address.toJson(),
    "products": List<dynamic>.from(products.map((x) => x.toJson())),
    "image": image.toJson(),
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

class ImageData {
  String path;
  String filename;

  ImageData({
    required this.path,
    required this.filename,
  });

  factory ImageData.fromJson(Map<String, dynamic> json) => ImageData(
    path: json["path"],
    filename: json["filename"],
  );

  Map<String, dynamic> toJson() => {
    "path": path,
    "filename": filename,
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
  DateTime orderTime;

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
    required this.orderTime,
  });

  factory Order.fromJson(Map<String, dynamic> json) => Order(
    id: json["id"],
    userId: json["user_id"],
    addressId: json["address_id"],
    status: json["status"],
    totalPrice: json["total_price"],
    paymentMethod: json["payment_method"],
    handlingFee: json["handling_fee"],
    shippingFee: json["shipping_fee"],
    shippingMethod: json["shipping_method"],
    orderTime: DateTime.parse(json["order_time"]),
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
    "order_time": orderTime.toIso8601String(),
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
