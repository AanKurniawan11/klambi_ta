import 'package:http/http.dart' as http;
import 'package:get/get.dart';
import 'package:klambi_ta/Pages/payment/components/OrderResponseModel.dart';

class PaymentController extends GetxController {

  Future<void> checkoutDirectly(OrderRequest orderRequest) async {
    final url = 'https://klambi.ta.rplrus.com/api/orders/checkout-directly';
    try {
      final response = await http.post(
        Uri.parse(url),
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer your_bearer_token',
        },
        body: orderRequest.toJson(),
      );

      if (response.statusCode == 200) {
        Get.snackbar('Success', 'Order placed successfully');
        Get.offNamed('/order-summary');
      } else {
        Get.snackbar('Error', 'Failed to place order');
      }
    } catch (e) {
      Get.snackbar('Error', 'An error occurred while placing the order');
    }
  }
}
