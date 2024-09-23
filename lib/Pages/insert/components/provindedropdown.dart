import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:klambi_ta/Pages/insert/controller/insert_controller.dart';

class ProvinsiDrop extends StatelessWidget {
  final Function(String?) onCodeChanged;

  ProvinsiDrop({required this.onCodeChanged});

  @override
  Widget build(BuildContext context) {
    final InsertAddressController controller = Get.put(InsertAddressController());

    return Obx(() {
      if (controller.isLoading.value) {
        return Center(child: CircularProgressIndicator());
      } else if (controller.provinceList.isEmpty) {
        return Center(child: Text('No data found'));
      } else {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          child: DropdownButtonFormField<String>(
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              labelText: 'Pilih Provinsi',
            ),
            items: controller.provinceList.map((province) {
              return DropdownMenuItem<String>(
                value: province.provinceId,
                child: Text(province.provinceName),
              );
            }).toList(),
            onChanged: (value) {
              onCodeChanged(value);
            },
          ),
        );
      }
    });
  }
}
