import 'dart:convert';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:klambi_ta/Pages/payment/components/OrderResponseModel.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PaymentController extends GetxController {
  var productId = 0.obs;
  var quantity = 0.obs;
  var size = 'S'.obs;
  var paymentMethod = ''.obs;
  var shippingMethod = ''.obs;
  var addressId = 0.obs;
  var selectedIndex = 0.obs;

  late final SharedPreferences prefs;

  @override
  void onInit() {
    super.onInit();
    setPreference();
  }

  Future<void> setPreference() async {
    prefs = await SharedPreferences.getInstance();
  }

  void selectSize(int index) {
    selectedIndex.value = index;
  }

  Future<void> addOrder() async {
    var token = await prefs.getString("token");
    final ordersData = AddOrderModel(
      productId: productId.value,
      size: size.value,
      shippingMethod: shippingMethod.value,
       paymentMethod: paymentMethod.value,
      quantity: quantity.value,
      addressId: addressId.value
    );

    try {
      final response = await http.post(
        Uri.parse('https://klambi.ta.rplrus.com/api/orders/checkout-directly'),
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $token',
        },
        // body: jsonEncode(orderData),
      );

      if (response.statusCode == 201) {
        // Handle successful order
        print('Order successful: ${response.body}');
        // Redirect atau update UI
      } else {
        // Handle error
        print('Failed to add order: ${response.statusCode}');
      }
    } catch (e) {
      print('Error: $e');
    }
  }
}
