import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:klambi_ta/Pages/address/insert/components/city_post_code.dart';
import 'package:klambi_ta/Pages/address/insert/components/kec.dart';
import 'package:klambi_ta/Pages/address/insert/components/kode_pos.dart';
import 'package:klambi_ta/Pages/address/insert/components/nama.dart';
import 'package:klambi_ta/Pages/address/insert/components/optional_note.dart';
import 'package:klambi_ta/Pages/address/insert/components/regional_province.dart';
import 'package:klambi_ta/Pages/address/insert/components/telepon.dart';
import 'package:klambi_ta/color.dart';
import 'package:klambi_ta/component/EditTextfield.dart';
import '../showDataController.dart';

class EditAddress extends StatelessWidget {
  const EditAddress({super.key});

  @override
  Widget build(BuildContext context) {
    final Showdatacontroller controller = Get.put(Showdatacontroller());

    return Scaffold(
      backgroundColor: ColorValue.kBackground,
      appBar: AppBar(
        title: Text(
          'Edit Alamat',
          style: TextStyle(
            fontFamily: 'General Sans',
            fontWeight: FontWeight.w500,
            fontSize: 24,
            color: ColorValue.kBlack,
          ),
        ),
        leading: IconButton(
          onPressed: () {
            Get.back();
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
                  Nama(onChanged: (value) => controller.namaLengkaps.value),
                  EditTextfield(hint: "hint", label: "masukkan", controller: controller.namaLengkaps),
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
                  Kota(onCodeChanged: (value) => controller.kota.value = value,),
                  Kec(onCodeChanged: (value) => controller.kecamatan.value = value),
                  kode_Pos(onCodeChanged: (value) => controller.kodePos.value = value),
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
                  controller.EditAddres();
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
