import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:klambi_ta/Pages/insert/components/custom_dropdown.dart';

import '../../menuprofile/pages/address/controller/address_controller.dart';

class Provinsi extends StatelessWidget {
  final Function(String) onCodeChanged;
  final AddressController controller = Get.put(AddressController());


  Provinsi({super.key, required this.onCodeChanged});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 5),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomDropdown(
                  items: ['Kudus'],
                  hintText: _getHintText(),
                  onChanged: (String? newValue) {
                    if (newValue != null) {
                      print('Selected: $newValue');
                      onCodeChanged(newValue);
                    }
                  },
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
  String _getHintText() {
    // Cek apakah controller.Show memiliki elemen dan elemen pertama tidak null
    if (controller.Show.isNotEmpty && controller.Show[0].provinsi != null) {
      return controller.Show[0].provinsi!;
    } else {
      return "Kota"; // Tampilkan "Nama" jika tidak ada namaLengkap
    }
  }

}