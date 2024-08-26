import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:klambi_ta/Pages/insert/components/custom_textfield2.dart';

import '../../menuprofile/pages/address/controller/address_controller.dart';

class Keterangan extends StatelessWidget {
  final AddressController controller = Get.put(AddressController());

  Keterangan({super.key, required this.onChanged});
  final Function(String) onChanged;


  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 5),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomTextfield(hintText: controller.Show[0].keterangan,
            onChanged: onChanged,
          )
        ],
      ),
    );
  }
}
