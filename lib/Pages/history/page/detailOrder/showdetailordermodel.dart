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
  OrderHistory orderHistory;
  List<Product> products;
  dynamic image;

  Data({
    required this.orderHistory,
    required this.products,
    required this.image,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    orderHistory: OrderHistory.fromJson(json["order_history"]),
    products: List<Product>.from(json["products"].map((x) => Product.fromJson(x))),
    image: json["image"],
  );

  Map<String, dynamic> toJson() => {
    "order_history": orderHistory.toJson(),
    "products": List<dynamic>.from(products.map((x) => x.toJson())),
    "image": image,
  };
}

class OrderHistory {
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

  OrderHistory({
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
  });

  factory OrderHistory.fromJson(Map<String, dynamic> json) => OrderHistory(
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
