class PayresponseModel {
  final int orderId;
  final String paymentMethod;

  PayresponseModel({required this.orderId, required this.paymentMethod});

  Map<String, dynamic> toJson() {
    return {
      'order_id': orderId,
      'payment_method': paymentMethod,
    };
  }
}
