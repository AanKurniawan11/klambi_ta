class ShowOrderResponseModel {
  bool? success;
  String? message;
  Data? data;

  ShowOrderResponseModel({this.success, this.message, this.data});

  factory ShowOrderResponseModel.fromJson(Map<String, dynamic> json) {
    return ShowOrderResponseModel(
      success: json['success'],
      message: json['message'],
      data: json['data'] != null ? Data.fromJson(json['data']) : null,
    );
  }
}

class Data {
  int? id;
  int? userId;
  int? addressId;
  String? paymentMethod;
  String? shippingMethod;
  int? handlingFee;
  int? shippingFee;
  int? discount;
  int? totalPrice;
  int? quantity;
  String? status;
  String? paymentConfirmedAt;
  List<Product>? products;
  String? estimatedDelivery;
  String? paymentDueTime;
  String? createdAt;
  String? updatedAt;

  Data({
    this.id,
    this.userId,
    this.addressId,
    this.paymentMethod,
    this.shippingMethod,
    this.handlingFee,
    this.shippingFee,
    this.discount,
    this.totalPrice,
    this.quantity,
    this.status,
    this.paymentConfirmedAt,
    this.products,
    this.estimatedDelivery,
    this.paymentDueTime,
    this.createdAt,
    this.updatedAt,
  });

  factory Data.fromJson(Map<String, dynamic> json) {
    return Data(
      id: json['id'] != null ? int.tryParse(json['id'].toString()) : null,
      userId: json['user_id'],
      addressId: json['address_id'],
      paymentMethod: json['payment_method'],
      shippingMethod: json['shipping_method'],
      handlingFee: json['handling_fee'],
      shippingFee: json['shipping_fee'],
      discount: json['discount'],
      totalPrice: json['total_price'],
      quantity: json['quantity'],
      status: json['status'],
      paymentConfirmedAt: json['payment_confirmed_at'],
      products: json['products'] != null
          ? (json['products'] as List).map((i) => Product.fromJson(i)).toList()
          : null,
      estimatedDelivery: json['estimated_delivery'],
      paymentDueTime: json['payment_due_time'],
      createdAt: json['created_at'],
      updatedAt: json['updated_at'],
    );
  }
}

class Order {
  int? id;
  int? userId;
  int? addressId;
  String? paymentMethod;
  String? shippingMethod;
  int? handlingFee;
  int? shippingFee;
  int? discount;
  int? totalPrice;
  int? quantity;
  String? status;
  List<Product>? products;
  Address? address;
  String? createdAt;
  String? updatedAt;

  Order({
    this.id,
    this.userId,
    this.addressId,
    this.paymentMethod,
    this.shippingMethod,
    this.handlingFee,
    this.shippingFee,
    this.discount,
    this.totalPrice,
    this.quantity,
    this.status,
    this.products,
    this.address,
    this.createdAt,
    this.updatedAt,
  });

  factory Order.fromJson(Map<String, dynamic> json) {
    return Order(
      id: json['id'],
      userId: json['user_id'],
      addressId: json['address_id'],
      paymentMethod: json['payment_method'],
      shippingMethod: json['shipping_method'],
      handlingFee: json['handling_fee'],
      shippingFee: json['shipping_fee'],
      discount: json['discount'],
      totalPrice: json['total_price'],
      quantity: json['quantity'],
      status: json['status'],
      products: json['products'] != null
          ? (json['products'] as List).map((i) => Product.fromJson(i)).toList()
          : null,
      address: json['address'] != null ? Address.fromJson(json['address']) : null,
      createdAt: json['created_at'],
      updatedAt: json['updated_at'],
    );
  }
}

class Address {
  int? id;
  int? userId;
  String? nomorTelepon;
  String? namaLengkap;
  String? keterangan;
  String? provinsi;
  String? createdAt;
  String? updatedAt;

  Address({
    this.id,
    this.userId,
    this.nomorTelepon,
    this.namaLengkap,
    this.keterangan,
    this.provinsi,
    this.createdAt,
    this.updatedAt,
  });

  factory Address.fromJson(Map<String, dynamic> json) {
    return Address(
      id: json['id'],
      userId: json['user_id'],
      nomorTelepon: json['nomor_telepon'],
      namaLengkap: json['nama_lengkap'],
      keterangan: json['keterangan'],
      provinsi: json['provinsi'],
      createdAt: json['created_at'],
      updatedAt: json['updated_at'],
    );
  }
}

class Product {
  int? productId;
  int? quantity;
  String? size;
  int? price;
  String? title;
  String? image;

  Product({
    this.productId,
    this.quantity,
    this.size,
    this.price,
    this.title,
    this.image,
  });

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      productId: json['product_id'],
      quantity: json['quantity'],
      size: json['size'],
      price: json['price'],
      title: json['title'],
      image: json['image'],
    );
  }
}
