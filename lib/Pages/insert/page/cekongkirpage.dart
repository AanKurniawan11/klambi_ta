import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../menuprofile/pages/address/controller/address_controller.dart';
import '../components/provindedropdown.dart';
import '../controller/insert_controller.dart';
import '../components/citydrop.dart';

class CekOngkir extends StatelessWidget {
  CekOngkir({super.key});

  final AddressController addressController = Get.put(AddressController());
  final InsertAddressController insertAddressController = Get.put(InsertAddressController());

  final TextEditingController weightController = TextEditingController(); // Controller untuk berat barang

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cek Ongkir'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            // Dropdown for selecting province
            ProvinsiDrop(
              onCodeChanged: (value) {
                addressController.provinsi.value = value!;
                // Call fetchCities when a province is selected
                insertAddressController.fetchCities(value);
              },
            ),
            SizedBox(height: 20),
            // Dropdown for selecting city based on selected province
            Obx(() {
              return CityDrop(
                onCityChanged: (value) {
                  addressController.kota.value = value!;
                },
                selectedProvinceId: addressController.provinsi.value,
              );
            }),
            SizedBox(height: 20),
            // Input field for weight
            TextField(
              controller: weightController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: 'Berat barang (gram)',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 20),
            // Button to calculate shipping cost
            ElevatedButton(
              onPressed: () {
                FocusScope.of(context).unfocus();
                if (addressController.provinsi.value.isNotEmpty &&
                    addressController.kota.value.isNotEmpty &&
                    weightController.text.isNotEmpty) {
                  // Call the calculateShippingCost function
                  insertAddressController.calculateShippingCost(
                    addressController.provinsi.value, // origin (misalnya ID kota asal)
                    addressController.kota.value,    // destination (ID kota tujuan)
                    int.parse(weightController.text), // weight in grams
                    'jne', // Courier (for example 'jne')
                  );
                } else {
                  Get.snackbar("Error", "Please select province, city, and enter weight");
                }
              },
              child: Text('Cek Ongkos Kirim'),
            ),
            SizedBox(height: 20),
            // Display shipping cost results
            Obx(() {
              if (insertAddressController.isLoading.value) {
                return CircularProgressIndicator();
              } else if (insertAddressController.shippingCosts.isEmpty) {
                return Text("Tidak ada data ongkos kirim");
              } else {
                return Expanded(
                  child: ListView.builder(
                    itemCount: insertAddressController.shippingCosts.length,
                    itemBuilder: (context, index) {
                      var cost = insertAddressController.shippingCosts[index];
                      return ListTile(
                        title: Text("${cost['service']} - ${cost['description']}"),
                        subtitle: Text("Harga: Rp${cost['cost'][0]['value']}"),
                        trailing: Text("Estimasi: ${cost['cost'][0]['etd']} hari"),
                      );
                    },
                  ),
                );
              }
            }),
          ],
        ),
      ),
    );
  }
}
