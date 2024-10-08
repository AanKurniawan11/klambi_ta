import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:klambi_ta/Pages/cart/controller/cart_controllers.dart';

class test1 extends StatelessWidget {
  final CartControllers controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Pilih Metode Pembayaran',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              fontFamily: 'General Sans',
              color: Colors.black,
            ),
          ),
          const SizedBox(height: 10),
          Obx(() => Container(
            padding: const EdgeInsets.symmetric(horizontal: 12.0),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8.0),
              border: Border.all(color: Colors.grey.shade300, width: 1.5),
              color: Colors.white,
            ),
            child: DropdownButtonHideUnderline(
              child: DropdownButton<String>(
                value: controller.paymeth.value.isEmpty ? null : controller.paymeth.value,
                hint: Text(
                  'Pilih Metode Pembayaran',
                  style: TextStyle(color: Colors.grey.shade600),
                ),
                isExpanded: true,
                items: ['Cash on Delivery']
                    .map((method) => DropdownMenuItem<String>(
                  value: method,
                  child: Text(method),
                ))
                    .toList(),
                onChanged: (String? newValue) {
                  if (newValue != null) {
                    controller.paymeth.value = newValue;
                    controller.addPayCart(); // Memanggil fungsi untuk memperbarui metode pembayaran
                    print('Metode pembayaran dipilih: ${controller.paymeth.value}');
                  }
                },
                icon: Icon(
                  Icons.arrow_drop_down,
                  color: Colors.black,
                ),
                iconSize: 24,
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.black,
                ),
              ),
            ),
          )),
        ],
      ),
    );
  }
}
