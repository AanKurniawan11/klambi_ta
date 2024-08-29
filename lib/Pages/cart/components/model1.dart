class Item {
  final int productId;
  final int quantity;
  final String size;
  final double productPrice;

  Item({
    required this.productId,
    required this.quantity,
    required this.size,
    required this.productPrice,
  });

  // Optional: Override equality to make comparison easier
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
          other is Item &&
              runtimeType == other.runtimeType &&
              productId == other.productId &&
              quantity == other.quantity &&
              size == other.size;

  @override
  int get hashCode =>
      productId.hashCode ^ quantity.hashCode ^ size.hashCode;

  // Convert Item to JSON
  Map<String, dynamic> toJson() {
    return {
      'productId': productId,
      'quantity': quantity,
      'size': size,
      'productPrice': productPrice,
    };
  }

  // Convert JSON to Item
  factory Item.fromJson(Map<String, dynamic> json) {
    return Item(
      productId: json['productId'],
      quantity: json['quantity'],
      size: json['size'],
      productPrice: json['productPrice'].toDouble(),
    );
  }
}
