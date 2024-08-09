import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:klambi_ta/Pages/menuprofile/pages/address/components/show_addressModel.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../components/addres.model.dart';

class AddressController extends GetxController{
  late final SharedPreferences prefs;
  RxList<Datum> Show = <Datum>[].obs;

  var keterangan = ''.obs;
  var provinsi = ''.obs;
  var categoryId = '1'.obs;
  var nomorTelepon = ''.obs;
  var namaLengkap = ''.obs;
  var isLoading = true.obs;

  @override
  void onInit() {
    super.onInit();
    setPreference();
  }

  Future<void> setPreference() async {
    prefs = await SharedPreferences.getInstance();
    ShowData();
  }

  Future<void>  submitAddress() async {
    var token = await prefs.getString("token");
    final address = Address(
      keterangan: keterangan.value,
      provinsi: provinsi.value,
      categoryId: categoryId.value,
      nomorTelepon: nomorTelepon.value,
      namaLengkap: namaLengkap.value,
    );

    final response = await http.post(
      Uri.parse('https://klambi.ta.rplrus.com/api/addresses'),
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $token'
      },
      body: jsonEncode(address.toJson()),
    );

    if (response.statusCode == 201) {
      isLoading(true);
      print('Response body: ${response.body}'); //
      ShowData();
      Get.toNamed("/addAddress");
    } else {
      print("gagal kirim");
      print('Token: $token'); // Debugging untuk memastikan token ada
      print('Response body: ${response.body}'); // Debugging untuk memeriksa respon
    }
  }

  Future <void> ShowData() async{
    var token = await prefs.getString("token");
    final response = await http.get(
      Uri.parse('https://klambi.ta.rplrus.com/api/addresses'),
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $token'
      },
    );

    if (response.statusCode == 200) {
      isLoading(true);
      ShowAddress tes = showAddressFromJson(response.body);
      Show.value = tes.data;
      print('Token: $token'); // Debugging untuk memastikan token ada
    } else {
      print('Token: $token');
      print(response.body);
    }
  }

  Future<void> DeleteAddress() async{
    var token = await prefs.getString("token");
    final response = await http.delete(
      Uri.parse('https://klambi.ta.rplrus.com/api/addresses'),
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $token'
      },
    );
      if (response.statusCode == 200){
        Show.clear();
      }else{

    }
  }

  // Future<void> UpdateAddress()async{
  //   var token = await prefs.getString("token");
  //
  //   final response = await http.post(
  //     Uri.parse('https://klambi.ta.rplrus.com/api/addresses'),
  //     headers: {
  //       'Content-Type': 'application/json',
  //       'Authorization': 'Bearer $token'
  //     },
  //     body: jsonEncode(address.toJson()),
  //   );
  //
  //   if (response.statusCode == 201) {
  //     isLoading(true);
  //     print('Response body: ${response.body}'); //
  //     ShowData();
  //     Get.toNamed("/addAddress");
  //   } else {
  //     print("gagal kirim");
  //     print('Token: $token'); // Debugging untuk memastikan token ada
  //     print('Response body: ${response.body}'); // Debugging untuk memeriksa respon
  //   }
  //
  // }



  }




