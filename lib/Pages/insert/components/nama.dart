import 'package:flutter/material.dart';
import 'package:klambi_ta/Pages/insert/components/custom_textfield2.dart';

class Nama extends StatelessWidget {
  final Function(String) onChanged;

  const Nama({required this.onChanged, super.key});

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
            hintText: 'Nama Lengkap',
            onChanged: onChanged,
          ),
        ],
      ),
    );
  }
}
