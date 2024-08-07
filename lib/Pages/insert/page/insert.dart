import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:klambi_ta/Common/colors/color.dart';
import 'package:get/get.dart';
import 'package:klambi_ta/Pages/address/showDataController.dart';
import 'package:klambi_ta/component/insert/city_post_code.dart';
import 'package:klambi_ta/component/insert/kec.dart';
import 'package:klambi_ta/component/insert/kode_pos.dart';
import 'package:klambi_ta/component/insert/nama.dart';
import 'package:klambi_ta/component/insert/name_address.dart';
import 'package:klambi_ta/component/insert/name_street.dart';
import 'package:klambi_ta/component/insert/optional_note.dart';
import 'package:klambi_ta/component/insert/regional_province.dart';
import 'package:klambi_ta/component/insert/telepon.dart';
import '../../../../component/my_elevatedbutton.dart';

class InsertAddressPageView extends StatelessWidget {
  const InsertAddressPageView({super.key});

  @override
  Widget build(BuildContext context) {
    final Showdatacontroller controller = Get.put(Showdatacontroller());

    return Scaffold(
      backgroundColor: ColorValue.kBackground,
      appBar: AppBar(
        title: Text(
          'Masukkan Alamat',
          style: TextStyle(
            fontFamily: 'General Sans',
            fontWeight: FontWeight.w500,
            fontSize: 24,
            color: ColorValue.kBlack,
          ),
        ),
        leading: IconButton(
          onPressed: () {
            Get.back(); // Go back to the previous page
          },
          icon: Icon(Icons.arrow_back),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 25,
            vertical: 20,
          ),
          child: Column(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 10, vertical: 10),
                    child: Text("Kontak", style: TextStyle(fontSize: 15),
                    ),
                  ),
                  Nama(onChanged: (value) => controller.namaLengkap.value = value),
                  Telepon(onChanged: (value) => controller.nomorTelepon.value = value),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                    child: Text("Alamat", style: TextStyle(fontSize: 15),
                    ),
                  ),
                  Provinsi(onCodeChanged: (value) => controller.provinsi.value = value),
                  Keterangan(onChanged: (value) => controller.keterangan.value = value),
                ],
              ),
              SizedBox(
                height: 150,
              ),
              ElevatedButton(
                style: ButtonStyle(
                  backgroundColor:
                      MaterialStateProperty.all(ColorValue.kPrimary),
                ),
                onPressed: () {
                  controller.submitAddress();
                },
                child: Text('Konfirmasi', style: TextStyle(color: Colors.white),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
