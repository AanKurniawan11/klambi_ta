// order_detail_response_model.dart
class OrderDetailResponseModel {
  final bool success;
  final String message;
  final OrderDetailData data;

  OrderDetailResponseModel({
    required this.success,
    required this.message,
    required this.data,
  });

  factory OrderDetailResponseModel.fromJson(Map<String, dynamic> json) {
    return OrderDetailResponseModel(
      success: json['success'],
      message: json['message'],
      data: OrderDetailData.fromJson(json['data']),
    );
  }
}

class OrderDetailData {
  final Order order;
  final List<Product> products;

  OrderDetailData({
    required this.order,
    required this.products,
  });

  factory OrderDetailData.fromJson(Map<String, dynamic> json) {
    return OrderDetailData(
      order: Order.fromJson(json['order']),
      products: (json['products'] as List)
          .map((product) => Product.fromJson(product))
          .toList(),
    );
  }
}

class Order {
  final int id;
  final int userId;
  final int addressId;
  final String paymentMethod;
  final String shippingMethod;
  final String handlingFee;
  final String shippingFee;
  final String discount;
  final int quantity;
  final String totalPrice;
  final String status;
  final String products;
  final String createdAt;
  final String updatedAt;
  final Address address;

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
      quantity: json['quantity'],
      totalPrice: json['total_price'],
      status: json['status'],
      products: json['products'],
      createdAt: json['created_at'],
      updatedAt: json['updated_at'],
      address: Address.fromJson(json['address']),
    );
  }
}

class Address {
  final int id;
  final int userId;
  final String nomorTelepon;
  final String namaLengkap;
  final String keterangan;
  final String provinsi;
  final String createdAt;
  final String updatedAt;

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
  final int productId;
  final int quantity;
  final String size;
  final int price;
  final String title;
  final String image;

  Product({
    required this.productId,
    required this.quantity,
    required this.size,
    required this.price,
    required this.title,
    required this.image,
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
