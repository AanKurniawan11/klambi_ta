import 'package:flutter/material.dart';
import 'package:klambi_ta/Common/colors/color.dart';

class SearchField extends StatelessWidget {
  final ValueChanged<String> onChanged;
  final TextEditingController controller;

  // Terima controller sebagai parameter agar statusnya bisa dipertahankan
  SearchField({super.key, required this.onChanged, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 10),
      child: Form(
        child: TextFormField(
          controller: controller, // Gunakan controller yang diteruskan
          onChanged: onChanged,
          decoration: InputDecoration(
            prefixIcon: Icon(Icons.search, color: ColorValue.kPrimary),
            hintText: 'Cari produk...',
            hintStyle: TextStyle(color: Colors.grey[600]),
            filled: true,
            fillColor: Colors.white,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide.none,
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(color: ColorValue.kPrimary, width: 1.5),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(color: Colors.grey[300]!, width: 1.5),
            ),
          ),
        ),
      ),
    );
  }
}
