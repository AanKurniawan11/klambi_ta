import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:klambi_ta/Pages/insert/components/custom_textfield2.dart';
import 'package:klambi_ta/Pages/menuprofile/pages/address/controller/address_controller.dart';

class Nama extends StatelessWidget {
  final Function(String) onChanged;
  final AddressController controller = Get.put(AddressController());

   Nama({required this.onChanged, super.key});

  @override
  Widget build(BuildContext context) {
    return
      Padding(
      padding: const EdgeInsets.only(bottom: 5),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // SizedBox(height: 10),
          CustomTextfield(
            hintText: "Nama",
            onChanged: onChanged,
          ),
        ],
      ),
    );
  }
}
