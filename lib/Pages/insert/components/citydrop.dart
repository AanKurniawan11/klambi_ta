import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controller/insert_controller.dart';

class CityDrop extends StatelessWidget {
  final Function(String?) onCityChanged;
  final String selectedProvinceId;

  CityDrop({required this.onCityChanged, required this.selectedProvinceId});

  @override
  Widget build(BuildContext context) {
    final InsertAddressController controller = Get.put(InsertAddressController());

    // Ensure the cities are fetched when a province is selected
    if (selectedProvinceId.isNotEmpty) {
      controller.fetchCities(selectedProvinceId);
    }

    return Obx(() {
      if (controller.isLoading.value) {
        return Center(child: CircularProgressIndicator());
      } else if (controller.cityList.isEmpty) {
        return Center(child: Text('No cities found'));
      } else {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          child: DropdownButtonFormField<String>(
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              labelText: 'Pilih Kota',
            ),
            items: controller.cityList.map((city) {
              return DropdownMenuItem<String>(
                value: city.cityId,
                child: Text(city.cityName),
              );
            }).toList(),
            onChanged: (value) {
              onCityChanged(value);
            },
          ),
        );
      }
    });
  }
}
