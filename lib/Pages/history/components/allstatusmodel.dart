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
  ImageClass? image;

  Datum({
    required this.order,
    required this.products,
    this.image, // Ganti required menjadi optional
  });

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
    order: Order.fromJson(json["order"]),
    products: List<Product>.from(json["products"].map((x) => Product.fromJson(x))),
    image: json["image"] == null ? null : ImageClass.fromJson(json["image"]), // Pastikan ini memeriksa null
  );

  Map<String, dynamic> toJson() => {
    "order": order.toJson(),
    "products": List<dynamic>.from(products.map((x) => x.toJson())),
    "image": image?.toJson(), // Ganti menjadi image?.toJson()
  };
}

class ImageClass {
  String path;
  String filename;

  ImageClass({
    required this.path,
    required this.filename,
  });

  factory ImageClass.fromJson(Map<String, dynamic> json) => ImageClass(
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
  int orderId;
  int userId;
  int addressId;
  String products;
  Status status;
  int totalPrice;
  PaymentMethod paymentMethod;
  int handlingFee;
  int shippingFee;
  ShippingMethod shippingMethod;
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
    status: statusValues.map[json["status"]]!,
    totalPrice: json["total_price"],
    paymentMethod: paymentMethodValues.map[json["payment_method"]]!,
    handlingFee: json["handling_fee"],
    shippingFee: json["shipping_fee"],
    shippingMethod: shippingMethodValues.map[json["shipping_method"]]!,
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
    "status": statusValues.reverse[status],
    "total_price": totalPrice,
    "payment_method": paymentMethodValues.reverse[paymentMethod],
    "handling_fee": handlingFee,
    "shipping_fee": shippingFee,
    "shipping_method": shippingMethodValues.reverse[shippingMethod],
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
  NamaLengkap namaLengkap;
  Keterangan keterangan;
  Provinsi provinsi;
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
    namaLengkap: namaLengkapValues.map[json["nama_lengkap"]]!,
    keterangan: keteranganValues.map[json["keterangan"]]!,
    provinsi: provinsiValues.map[json["provinsi"]]!,
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "user_id": userId,
    "nomor_telepon": nomorTelepon,
    "nama_lengkap": namaLengkapValues.reverse[namaLengkap],
    "keterangan": keteranganValues.reverse[keterangan],
    "provinsi": provinsiValues.reverse[provinsi],
    "created_at": createdAt.toIso8601String(),
    "updated_at": updatedAt.toIso8601String(),
  };
}

enum Keterangan {
  GANG_10_BESITO
}

final keteranganValues = EnumValues({
  "gang 10 besito": Keterangan.GANG_10_BESITO
});

enum NamaLengkap {
  AAN
}

final namaLengkapValues = EnumValues({
  "aan": NamaLengkap.AAN
});

enum Provinsi {
  KUDUS
}

final provinsiValues = EnumValues({
  "Kudus": Provinsi.KUDUS
});

enum PaymentMethod {
  CASH_ON_DELIVERY
}

final paymentMethodValues = EnumValues({
  "Cash on Delivery": PaymentMethod.CASH_ON_DELIVERY
});

enum ShippingMethod {
  KURIR_COD
}

final shippingMethodValues = EnumValues({
  "kurir COD": ShippingMethod.KURIR_COD
});

enum Status {
  SEDANG_DIKEMAS
}

final statusValues = EnumValues({
  "sedang_dikemas": Status.SEDANG_DIKEMAS
});

class User {
  int id;
  Name name;
  Email email;
  dynamic emailVerifiedAt;
  dynamic apiToken;
  ImageEnum image;
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
    name: nameValues.map[json["name"]]!,
    email: emailValues.map[json["email"]]!,
    emailVerifiedAt: json["email_verified_at"],
    apiToken: json["api_token"],
    image: imageEnumValues.map[json["image"]]!,
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": nameValues.reverse[name],
    "email": emailValues.reverse[email],
    "email_verified_at": emailVerifiedAt,
    "api_token": apiToken,
    "image": imageEnumValues.reverse[image],
    "created_at": createdAt.toIso8601String(),
    "updated_at": updatedAt.toIso8601String(),
  };
}

enum Email {
  KLAMBI_GMAIL_COM
}

final emailValues = EnumValues({
  "klambi@gmail.com": Email.KLAMBI_GMAIL_COM
});

enum ImageEnum {
  PROFILE_PICTURES_DDO30_E_XOOEP5_RK_JZPCHK_MVX6_O_J7_BH_HT_L9_RL9_NHAZ_JPG
}

final imageEnumValues = EnumValues({
  "profile_pictures/Ddo30EXooep5rkJzpchkMvx6oJ7bhHtL9RL9Nhaz.jpg": ImageEnum.PROFILE_PICTURES_DDO30_E_XOOEP5_RK_JZPCHK_MVX6_O_J7_BH_HT_L9_RL9_NHAZ_JPG
});

enum Name {
  KLAMBI
}

final nameValues = EnumValues({
  "klambi": Name.KLAMBI
});

class Product {
  int productId;
  int quantity;
  Size size;
  int price;
  String title;
  String image;
  bool? fromCart;

  Product({
    required this.productId,
    required this.quantity,
    required this.size,
    required this.price,
    required this.title,
    required this.image,
    this.fromCart,
  });

  factory Product.fromJson(Map<String, dynamic> json) => Product(
    productId: json["product_id"],
    quantity: json["quantity"],
    size: sizeValues.map[json["size"]]!,
    price: json["price"],
    title: json["title"],
    image: json["image"],
    fromCart: json["from_cart"],
  );

  Map<String, dynamic> toJson() => {
    "product_id": productId,
    "quantity": quantity,
    "size": sizeValues.reverse[size],
    "price": price,
    "title": title,
    "image": image,
    "from_cart": fromCart,
  };
}

enum Size {
  M,
  XL,
  XXL
}

final sizeValues = EnumValues({
  "M": Size.M,
  "XL": Size.XL,
  "XXL": Size.XXL
});

class EnumValues<T> {
  Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    reverseMap = map.map((k, v) => MapEntry(v, k));
    return reverseMap;
  }
}
