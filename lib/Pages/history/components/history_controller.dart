// import 'dart:convert';
// import 'package:get/get.dart';
// import 'package:http/http.dart' as http;
// import 'package:klambi_ta/Pages/history/components/allstatusmodel.dart';
// import 'package:klambi_ta/Pages/history/components/statusresponsemodel.dart';
// import 'package:shared_preferences/shared_preferences.dart';
//
// import '../page/detailOrder/showdetailordermodel.dart';
//
// class HistoryController extends GetxController {
//   RxInt selectedIndex = 0.obs;
//   late final SharedPreferences prefs;
//   RxBool isLoading = false.obs;
//   var selectedStatus = ''.obs;
//   RxList<String> categoryResponseAll = <String>[].obs;
//   RxList<Datum> orders = <Datum>[].obs;
//   Rx<DetailOrderModel?> detailOrder = Rx<DetailOrderModel?>(null);
//   int? orderId;
//   String formatCategoryName(String status) {
//     return status.replaceAll('_', ' ');
//   }
//
//   @override
//   void onInit() async {
//     super.onInit();
//     prefs = await SharedPreferences.getInstance();
//     fetchCategories();
//   }
//
//   List<Datum> get filteredOrders {
//     // Filter orders based on the selected status
//     if (selectedStatus.value.isEmpty) {
//       return orders; // Return all orders if no status is selected
//     } else {
//       return orders.where((order) => order.order.status == selectedStatus.value).toList();
//     }
//   }
//
//
//
//   Future<void> fetchCategories() async {
//     isLoading.value = true;
//     try {
//       var token = await prefs.getString("token");
//       final response = await http.get(
//         Uri.parse("https://klambi.ta.rplrus.com/api/statuses"),
//         headers: {
//           'Content-Type': 'application/json',
//           'Authorization': 'Bearer $token',
//         },
//       );
//
//       print(response.body);
//       if (response.statusCode == 200) {
//         final allCategoryResponse = Categoryhistorymodel.fromJson(json.decode(response.body));
//         categoryResponseAll.value = allCategoryResponse.data;
//
//         // Fetch history for the first category by default
//         if (categoryResponseAll.isNotEmpty) {
//           fetchOrders(); // Ensure that fetchOrders is called after categories are fetched
//         }
//       } else {
//         print("Status code: ${response.statusCode}");
//       }
//     } catch (e) {
//       print("Error: $e");
//     } finally {
//       isLoading.value = false;
//     }
//   }
//   Future<void> fetchOrders() async {
//     try {
//       isLoading(true);
//       var token = await prefs.getString("token");
//       final response = await http.get(
//         Uri.parse('https://klambi.ta.rplrus.com/api/order/user/history'),
//         headers: {
//           'Content-Type': 'application/json',
//           'Authorization': 'Bearer $token',
//         },
//       );
//
//       print('Response body: ${response.body}');
//       print('Status code: ${response.statusCode}');
//
//       if (response.statusCode == 200) {
//         var jsonData = json.decode(response.body);
//         Allstatusmodel orderModel = Allstatusmodel.fromJson(jsonData);
//         orders.value = orderModel.data;
//       } else {
//         print("masih salah");
//       }
//     } catch (e) {
//       print("gagal");
//       print('Error: $e');
//     } finally {
//       isLoading(false);
//     }
//   }
//
//   Future<void> fetchOrderDetails(int orderId) async {
//     isLoading.value = true;
//     try {
//       var token = await prefs.getString("token");
//       if (token == null) {
//         throw Exception("No token found");
//       }
//       final response = await http.get(
//         Uri.parse('https://klambi.ta.rplrus.com/api/order/show/history/$orderId'),
//         headers: {
//           'Content-Type': 'application/json',
//           'Authorization': 'Bearer $token',
//         },
//       );
//
//       print(response.body);
//       if (response.statusCode == 200) {
//         final responseJson = json.decode(response.body);
//         detailOrder.value = DetailOrderModel.fromJson(responseJson);
//       } else {
//         print("Failed to load order details: ${response.statusCode} - ${response.body}");
//       }
//     } catch (e) {
//       print("Error: $e");
//     } finally {
//       isLoading.value = false;
//     }
//   }
//
//   Future<void> cancelorder() async {
//     if (orderId == null) {
//       print('Order ID is not available');
//       return;
//     }
//
//     var token = await prefs.getString("token");
//     try {
//       final response = await http.delete(
//         Uri.parse('https://klambi.ta.rplrus.com/api/order-history/$orderId/cancel'),
//         headers: {
//           'Content-Type': 'application/json',
//           'Authorization': 'Bearer $token',
//         },
//       );
//       print(response.body);
//       if (response.statusCode == 200) {
//         print('History added successfully: ${response.body}');
//         await fetchOrders(); // Fetch updated order data after adding history
//       } else {
//         print('Failed to add history: ${response.statusCode}');
//       }
//     } catch (e) {
//       print('Error: $e');
//     }
//   }
//
//
//   void onTabChanged(int index) {
//     selectedIndex.value = index;
//     // Logika tambahan jika diperlukan
//   }
//
//   void onStatusSelected(String status) {
//     selectedStatus.value = status; // Update the selected status
//   }
//
// }
