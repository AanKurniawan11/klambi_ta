import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:klambi_ta/Pages/insert/components/customtextfield4.dart';

import '../../menuprofile/pages/address/controller/address_controller.dart';

class Keterangan extends StatelessWidget {
  final AddressController controller = Get.put(AddressController());
  final Function(String) onChanged;

  Keterangan({super.key, required this.onChanged});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 5),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomTextfield4(
            hintText: _getHintText(),
            onChanged: onChanged,
          ),
        ],
      ),
    );
  }

  String _getHintText() {
    if (controller.Show.isNotEmpty && controller.Show[0].keterangan != null) {
      return controller.Show[0].keterangan!;
    } else {
      return "Nama jalan, Gedung, Rumah";
    }
  }
}
