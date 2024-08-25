import 'dart:convert';
import 'package:get/get.dart';
import 'package:klambi_ta/Pages/cart/models/selectedCartModels.dart';
import 'package:klambi_ta/Pages/cart/models/cartModel.dart';
import 'package:klambi_ta/Pages/cart/models/showcartmodel.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

import '../../payment/components/paymentmethodemodel.dart';
import '../../payment/components/showcartordermodel.dart';

class CartControllers extends GetxController {
  RxBool isRefresh = false.obs;
  late final SharedPreferences prefs;
  RxList<Item> Cartdata = <Item>[].obs;
  RxList<Item> selectedItems = <Item>[].obs;
  Rx<Order?> order = Rx<Order?>(null);
  Rx<Data?> orderData = Rx<Data?>(null);
  var isLoading = true.obs;
  int? orderId;

  var paymeth = "".obs;
  var size = 'S'.obs;
  var quantity = 0.obs;
  var productTitle = ''.obs;
  var productPrice = '1'.obs;
  var productId = 0.obs;
  var cartId = 0.obs;
  var selecteds = true;
  var totalPrice = 0.obs;

  @override
  void onInit() async {
    super.onInit();
    await setPreference();
    await fetchOrderCart();
    updateTotalPrice();
  }

  Future<void> addPayCart() async {
    if (orderId == null) {
      print('Order ID is not available');
      return;
    }

    var token = await prefs.getString("token");
    final paydata = PayresponseModel(
      paymentMethod: paymeth.value,
    );

    try {
      final response = await http.post(
        Uri.parse('https://klambi.ta.rplrus.com/api/orders/$orderId/update-payment-method'),
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $token',
        },
        body: jsonEncode(paydata.toJson()),
      );

      if (response.statusCode == 200) {
        print('Payment method updated: ${response.body}');
        await fetchOrderCart();
        print("Updated order data: ${orderData.value}");
      } else {
        print('Failed to update payment method: ${response.statusCode}');
      }
    } catch (e) {
      print('Error: $e');
    }
  }

  Future<void> addHistoryCart() async {
    if (orderId == null) {
      print('Order ID is not available');
      return;
    }

    var token = await prefs.getString("token");
    try {
      final response = await http.post(
        Uri.parse('https://klambi.ta.rplrus.com/api/orders/$orderId/history'),
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $token',
        },
      );
      print(response.body);
      if (response.statusCode == 200) {
        print('History added successfully: ${response.body}');
        await fetchOrderCart();
      } else {
        print('Failed to add history: ${response.statusCode}');
      }
    } catch (e) {
      print('Error: $e');
    }
  }

  Future<void> orderfromCart() async {
    var token = await prefs.getString("token");
    try {
      final response = await http.post(
        Uri.parse('https://klambi.ta.rplrus.com/api/carts/checkout-from-cart'),
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $token',
        },
      );
      print(response.body);
      if (response.statusCode == 201) {
        print('Order from cart added successfully: ${response.body}');
        await fetchOrderCart();
      } else {
        print('Failed to add cart order: ${response.statusCode}');
      }
    } catch (e) {
      print('Error: $e');
    }
  }

  Future<void> fetchOrderCart() async {
    isLoading.value = true; // Start loading
    var token = await prefs.getString("token");
    String url = 'https://klambi.ta.rplrus.com/api/show/last/cart';
    try {
      final response = await http.get(
        Uri.parse(url),
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $token',
        },
      );
      if (response.statusCode == 200) {
        var jsonResponse = json.decode(response.body);
        Showcartordermodel orderResponse = Showcartordermodel.fromJson(jsonResponse);
        orderData.value = orderResponse.data;
        if (orderResponse.data != null) {
          orderId = orderResponse.data!.order?.id;
          order.value = orderResponse.data!.order;
        }
      } else {
        orderData.value = null; // Handle error case
      }
    } finally {
      isLoading.value = false; // Stop loading regardless of the outcome
    }
  }

  Future<void> setPreference() async {
    prefs = await SharedPreferences.getInstance();
    await ShowCartData(); // Make sure to wait for this method to finish before proceeding
  }

  Future<void> selectedCart(int id, bool status, int quantity) async {
    var token = await prefs.getString("token");
    final select = SelectedCartModel(cartId: id, selected: status, quantity: quantity);
    print(token);
    try {
      final response = await http.post(
        Uri.parse('https://klambi.ta.rplrus.com/api/update-selection'),
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $token',
        },
        body: jsonEncode(select.toJson()),
      );
      print(response.body);

      if (response.statusCode == 200) {
        // Optionally refresh data after selecting a cart item
      } else {
        print("Failed to send: ${response.statusCode}");
      }
    } catch (e) {
      print("Error: $e");
    }
  }

  Future<void> addToCart(int id) async {
    var token = await prefs.getString("token");
    final carts = AddToCart(
      size: size.value,
      productsId: id,
      quantity: quantity.value,
    );
    print(token);
    try {
      final response = await http.post(
        Uri.parse('https://klambi.ta.rplrus.com/api/cart/add'),
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $token',
        },
        body: jsonEncode(carts.toJson()),
      );
      print(response.body);

      if (response.statusCode == 200) {
        await ShowCartData(); // Refresh cart data after adding
        Get.toNamed("/detail");
      } else {
        print("Failed to send: ${response.statusCode}");
      }
    } catch (e) {
      print("Error: $e");
    }
  }

  Future<void> ShowCartData() async {
    isLoading.value = true; // Start loading
    var token = await prefs.getString("token");
    try {
      final response = await http.get(
        Uri.parse('https://klambi.ta.rplrus.com/api/cart-items'),
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $token'
        },
      );
      if (response.statusCode == 200) {
        ShowCart tes = showCartFromJson(response.body);
        Cartdata.value = tes.items;

        selectedItems.clear();
        for (var item in tes.items) {
          if (item.selected) {
            selectedItems.add(item);
          }
        }
        updateTotalPrice();
      } else {
        Cartdata.clear(); // Clear cart data if request fails
        print("Failed to fetch cart data: ${response.statusCode}");
      }
    } finally {
      isLoading.value = false; // Stop loading
    }
  }

  Future<void> DeleteCartItem(Map<String, dynamic> body) async {
    var token = await prefs.getString("token");
    try {
      final response = await http.delete(
        Uri.parse('https://klambi.ta.rplrus.com/api/cart/remove'),
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $token'
        },
        body: jsonEncode(body),
      );

      if (response.statusCode == 200) {
        // Remove the item from Cartdata and selectedItems
        final removedItem = Cartdata.firstWhere((item) => item.productId == body['products_id']);
        Cartdata.remove(removedItem);
        selectedItems.remove(removedItem);

        updateTotalPrice(); // Update total price after item is removed
      } else {
        print("Failed to delete item: ${response.body}");
      }
    } catch (e) {
      print("Error: $e");
    }
  }

  void updateTotalPrice() {
    totalPrice.value = selectedItems.fold(
      0,
          (sum, item) => sum + (item.productPrice * item.quantity),
    );
  }

  void toggleSelection(Item item) {
    if (selectedItems.contains(item)) {
      selectedItems.remove(item);
    } else {
      selectedItems.add(item);
    }
    updateTotalPrice();
  }
}
