import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../menuprofile/pages/address/controller/address_controller.dart';
import 'package:klambi_ta/Pages/insert/components/custom_textfield3.dart';

class Telepon extends StatelessWidget {
  final Function(String) onChanged;
  final AddressController controller = Get.put(AddressController());
  final TextEditingController _textController = TextEditingController();

  Telepon({required this.onChanged, super.key}) {
    // Inisialisasi _textController dengan nomor telepon dari controller jika ada
    if (controller.Show.isNotEmpty && controller.Show[0].nomorTelepon != null) {
      _textController.text = controller.Show[0].nomorTelepon!;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomTextfield3(
            hintText: _getHintText(),
            onChanged: _handleOnChanged,
            controller: _textController,
          ),
          SizedBox(height: 8),
          Obx(() {
            if (controller.teleponError.value.isNotEmpty) {
              return Text(
                controller.teleponError.value,
                style: TextStyle(
                  fontFamily: "General Sans",
                  fontSize: 16,
                  color: Colors.red,
                ),
              );
            } else {
              return SizedBox.shrink(); // Empty widget when no error
            }
          }),
        ],
      ),
    );
  }

  String _getHintText() {
    return controller.Show.isNotEmpty && controller.Show[0].nomorTelepon != null
        ? controller.Show[0].nomorTelepon!
        : "No Telephone";
  }

  void _handleOnChanged(String value) {
    // Validasi nomor telepon (minimal 11 digit)
    if (value.length < 11) {
      controller.teleponError.value = 'Nomor telepon harus minimal 11 digit';
    } else {
      controller.teleponError.value = ''; // Hapus pesan error jika sudah valid
    }

    // Panggil callback onChanged setelah validasi
    onChanged(value);
  }
}
