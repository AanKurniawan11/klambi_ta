import 'dart:convert';

Showhistorymodel showhistorymodelFromJson(String str) => Showhistorymodel.fromJson(json.decode(str));

String showhistorymodelToJson(Showhistorymodel data) => json.encode(data.toJson());

class Showhistorymodel {
  bool success;
  String message;
  List<Datum> data;

  Showhistorymodel({
    required this.success,
    required this.message,
    required this.data,
  });

  factory Showhistorymodel.fromJson(Map<String, dynamic> json) => Showhistorymodel(
    success: json["success"] ?? false,
    message: json["message"] ?? '',
    data: List<Datum>.from(json["data"]?.map((x) => Datum.fromJson(x)) ?? []),
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
  ImageData? image;

  Datum({
    required this.order,
    required this.products,
    this.image,
  });

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
    order: Order.fromJson(json["order"]),
    products: List<Product>.from(json["products"]?.map((x) => Product.fromJson(x)) ?? []),
    image: json["image"] != null ? ImageData.fromJson(json["image"]) : null,
  );

  Map<String, dynamic> toJson() => {
    "order": order.toJson(),
    "products": List<dynamic>.from(products.map((x) => x.toJson())),
    "image": image?.toJson(),
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
    id: json["id"] ?? 0,
    orderId: json["order_id"] ?? 0,
    userId: json["user_id"] ?? 0,
    addressId: json["address_id"] ?? 0,
    products: json["products"] ?? '',
    status: json["status"] ?? '',
    totalPrice: json["total_price"] ?? 0,
    paymentMethod: json["payment_method"] ?? '',
    handlingFee: json["handling_fee"] ?? 0,
    shippingFee: json["shipping_fee"] ?? 0,
    shippingMethod: json["shipping_method"] ?? '',
    orderTime: json["order_time"] != null ? DateTime.parse(json["order_time"]) : DateTime.now(),
    createdAt: json["created_at"] != null ? DateTime.parse(json["created_at"]) : DateTime.now(),
    updatedAt: json["updated_at"] != null ? DateTime.parse(json["updated_at"]) : DateTime.now(),
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
    productId: json["product_id"] ?? 0,
    quantity: json["quantity"] ?? 0,
    size: json["size"] ?? '',
    price: json["price"] ?? 0,
    fromCart: json["from_cart"] ?? false,
    title: json["title"] ?? '',
    image: json["image"] ?? '',
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

class User {
  int id;
  String name;
  String email;
  String? image;
  DateTime createdAt;
  DateTime updatedAt;

  User({
    required this.id,
    required this.name,
    required this.email,
    this.image,
    required this.createdAt,
    required this.updatedAt,
  });

  factory User.fromJson(Map<String, dynamic> json) => User(
    id: json["id"] ?? 0,
    name: json["name"] ?? '',
    email: json["email"] ?? '',
    image: json["image"],
    createdAt: json["created_at"] != null ? DateTime.parse(json["created_at"]) : DateTime.now(),
    updatedAt: json["updated_at"] != null ? DateTime.parse(json["updated_at"]) : DateTime.now(),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "email": email,
    "image": image,
    "created_at": createdAt.toIso8601String(),
    "updated_at": updatedAt.toIso8601String(),
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
    id: json["id"] ?? 0,
    userId: json["user_id"] ?? 0,
    nomorTelepon: json["nomor_telepon"] ?? '',
    namaLengkap: json["nama_lengkap"] ?? '',
    keterangan: json["keterangan"] ?? '',
    provinsi: json["provinsi"] ?? '',
    createdAt: json["created_at"] != null ? DateTime.parse(json["created_at"]) : DateTime.now(),
    updatedAt: json["updated_at"] != null ? DateTime.parse(json["updated_at"]) : DateTime.now(),
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
    path: json["path"] ?? '',
    filename: json["filename"] ?? '',
  );

  Map<String, dynamic> toJson() => {
    "path": path,
    "filename": filename,
  };
}
