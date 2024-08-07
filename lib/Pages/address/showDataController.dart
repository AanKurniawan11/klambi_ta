import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:klambi_ta/Pages/address/components/show_addressModel.dart';
import 'package:klambi_ta/Pages/address/edit/editAddressModel.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'components/addres.model.dart';

class Showdatacontroller extends GetxController{
  late final SharedPreferences prefs;
  RxList<Datum> Show = <Datum>[].obs;
  var keterangan = ''.obs;
  var provinsi = ''.obs;
  var categoryId = '1'.obs;
  var nomorTelepon = ''.obs;
  var namaLengkap = ''.obs;

  // final TextEditingController namaLengkaps =TextEditingController();
  // final TextEditingController noTelepon  =TextEditingController();
  // final TextEditingController  Provinsi =TextEditingController();
  // final TextEditingController  Kota =TextEditingController();
  // final TextEditingController  Kecamatan =TextEditingController();
  // final TextEditingController  kode =TextEditingController();
  // final TextEditingController  note =TextEditingController();




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
      print('Token: $token'); // Debugging untuk memastikan token ada
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

  // Future<void> EditAddres() async{
  //   prefs = await SharedPreferences.getInstance();
  //   var token = await prefs.getString("token");
  //   final response = await http.put(
  //     Uri.parse('https://klambi.ta.rplrus.com/api/addresses'),
  //     headers: {
  //       'Content-Type': 'application/json',
  //       'Authorization': 'Bearer $token'
  //     },
  //   );
  //     if (response.statusCode == 200){
  //       EditAddress edit = editAddressFromJson(response.body);
  //
  //       namaLengkaps.text = edit.data.namaLengkap;
  //       noTelepon.text = edit.data.nomorTelepon;
  //       Provinsi.text = edit.data.provinsi;
  //       Kota.text = edit.data.kota;
  //       Kecamatan.text = edit.data.kecamatan;
  //       kode.text = edit.data.kodePos.toString();
  //       note.text =  edit.data.keterangan;
  //
  //     }else{
  //       print("gagal");
  //   }
  // }


  }




