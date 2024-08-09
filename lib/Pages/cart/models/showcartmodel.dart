// To parse this JSON data, do
//
//     final showCart = showCartFromJson(jsonString);

import 'dart:convert';

ShowCart showCartFromJson(String str) => ShowCart.fromJson(json.decode(str));

String showCartToJson(ShowCart data) => json.encode(data.toJson());

class ShowCart {
  List<Item> items;
  int totalPrice;

  ShowCart({
    required this.items,
    required this.totalPrice,
  });

  factory ShowCart.fromJson(Map<String, dynamic> json) => ShowCart(
    items: List<Item>.from(json["items"].map((x) => Item.fromJson(x))),
    totalPrice: json["total_price"],
  );

  Map<String, dynamic> toJson() => {
    "items": List<dynamic>.from(items.map((x) => x.toJson())),
    "total_price": totalPrice,
  };
}

class Item {
  int productId;
  int id;
  int quantity;
  String productTitle;
  int productPrice;
  String size;
  int itemTotal;
  String imageUrl;
  bool selected;

  Item({
    required this.productId,
    required this.id,
    required this.quantity,
    required this.productTitle,
    required this.productPrice,
    required this.size,
    required this.itemTotal,
    required this.imageUrl,
    required this.selected,
  });

  factory Item.fromJson(Map<String, dynamic> json) => Item(
    productId: json["product_id"],
    id: json["id"],
    quantity: json["quantity"],
    productTitle: json["product_title"],
    productPrice: json["product_price"],
    size: json["size"],
    itemTotal: json["item_total"],
    imageUrl: json["image_url"],
    selected: json["selected"],
  );

  Map<String, dynamic> toJson() => {
    "product_id": productId,
    "id": id,
    "quantity": quantity,
    "product_title": productTitle,
    "product_price": productPrice,
    "size": size,
    "item_total": itemTotal,
    "image_url": imageUrl,
    "selected": selected,
  };
}
