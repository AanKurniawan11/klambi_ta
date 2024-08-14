class OrderRequest {
  final int productId;
  final int quantity;
  final String size;
  final String paymentMethod;
  final String shippingMethod;
  final double handlingFee;
  final double shippingFee;
  final double discount;
  final int addressId;

  OrderRequest({
    required this.productId,
    required this.quantity,
    required this.size,
    required this.paymentMethod,
    required this.shippingMethod,
    required this.handlingFee,
    required this.shippingFee,
    required this.discount,
    required this.addressId,
  });

  Map<String, dynamic> toJson() {
    return {
      'product_id': productId,
      'quantity': quantity,
      'size': size,
      'payment_method': paymentMethod,
      'shipping_method': shippingMethod,
      'handling_fee': handlingFee,
      'shipping_fee': shippingFee,
      'discount': discount,
      'address_id': addressId,
    };
  }
}
