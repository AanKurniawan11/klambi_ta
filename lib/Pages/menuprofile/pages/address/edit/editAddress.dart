import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:klambi_ta/Pages/insert/components/nama.dart';
import 'package:klambi_ta/Pages/insert/components/optional_note.dart';
import 'package:klambi_ta/Pages/insert/components/regional_province.dart';
import 'package:klambi_ta/Pages/insert/components/telepon.dart';
import 'package:klambi_ta/common/colors/color.dart';
import '../controller/address_controller.dart';

class EditAddressView extends StatelessWidget {
  final int addressId;

  const EditAddressView({required this.addressId, super.key});

  @override
  Widget build(BuildContext context) {
    final AddressController controller = Get.put(AddressController());

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
          padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 20),
          child: Column(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                    child: Text("Kontak", style: TextStyle(fontSize: 15, fontFamily: "General Sans")),
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
                    child: Text("Alamat", style: TextStyle(fontSize: 15, fontFamily: "General Sans")),
                  ),
                  Provinsi(onCodeChanged: (value) => controller.provinsi.value = value),
                  Keterangan(onChanged: (value) => controller.keterangan.value = value),
                ],
              ),
              SizedBox(height: 150),
              ElevatedButton(
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(ColorValue.kPrimary),
                ),
                onPressed: () {
                  controller.updateAddress(addressId);
                },
                child: Text('Konfirmasi', style: TextStyle(color: Colors.white)),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
