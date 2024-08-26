import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:klambi_ta/Pages/insert/components/custom_textfield3.dart';
import 'package:klambi_ta/Pages/menuprofile/pages/address/controller/address_controller.dart';

class Telepon extends StatelessWidget {
  final Function(String) onChanged;
  final AddressController controller = Get.put(AddressController());

  Telepon({required this.onChanged, super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomTextfield3(
            hintText: controller.Show[0].nomorTelepon,
            onChanged: (value) {
              // Validasi minimal dan maksimal panjang input
              if (value.length == 12) {
                onChanged(value);
              } else {
                print("Nomor telepon harus memiliki tepat 12 digit.");
              }
            },
            inputFormatters: [
              FilteringTextInputFormatter.digitsOnly,
              LengthLimitingTextInputFormatter(12), // Membatasi panjang maksimal menjadi 12
            ],
            keyboardType: TextInputType.number, // Menampilkan keyboard angka
          ),
          // Anda bisa menambahkan widget Text untuk menampilkan pesan error jika diperlukan
        ],
      ),
    );
  }
}
