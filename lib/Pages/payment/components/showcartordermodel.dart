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
  String paymentMethod;
  String shippingMethod;
  int handlingFee;
  int shippingFee;
  int discount;
  int quantity;
  int totalPrice;
  String status;
  String products; // Stringified JSON array
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
    required this.totalPrice,
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
    paymentMethod: json["payment_method"] ?? '',  // Handling possible null values
    shippingMethod: json["shipping_method"] ?? '',  // Handling possible null values
    handlingFee: json["handling_fee"],
    shippingFee: json["shipping_fee"],
    discount: json["discount"],
    quantity: json["quantity"],
    totalPrice: json["total_price"],
    status: json["status"] ?? '',  // Handling possible null values
    products: json["products"] ?? '',  // Handling possible null values
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
    "total_price": totalPrice,
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
    size: json["size"] ?? '',  // Handling possible null values
    price: json["price"],
    fromCart: json["from_cart"],
    title: json["title"] ?? '',  // Handling possible null values
    image: json["imagee"] ?? '',  // Corrected key from "imagee" to "image"
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
