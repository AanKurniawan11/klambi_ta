import 'package:flutter/material.dart';
import 'package:klambi_ta/Pages/insert/components/custom_dropdown.dart';

class Provinsi extends StatelessWidget {
  final Function(String) onCodeChanged;

  Provinsi({super.key, required this.onCodeChanged});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 5),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomDropdown(
                  items: ['Jawa Tengah'],
                  hintText: 'Provinsi',
                  onChanged: (String? newValue) {
                    if (newValue != null) {
                      print('Selected: $newValue');
                      onCodeChanged(newValue);
                    }
                  },
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}