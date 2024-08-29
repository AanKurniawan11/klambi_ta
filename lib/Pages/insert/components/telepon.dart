import 'package:flutter/material.dart';
import 'package:klambi_ta/Pages/insert/components/custom_textfield3.dart';


class Telepon extends StatelessWidget {
  final Function(String) onChanged;

  const Telepon({required this.onChanged, super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomTextfield3(
            hintText: 'No Telephone',
            onChanged: onChanged,
          ),
        ],
      ),
    );
  }
}