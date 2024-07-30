import 'package:flutter/material.dart';
import 'package:klambi_ta/Common/colors/color.dart';
import 'package:klambi_ta/component/insert/custom_dropdown.dart';
import 'package:klambi_ta/component/insert/custom_textfield3.dart';

class Kota extends StatelessWidget {
  final Function(String) onCodeChanged;

  Kota({super.key, required this.onCodeChanged});

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
                  items: ['Kudus', 'Semarang', 'Jogja', 'Jepara','pati'],
                  hintText: 'Kota',
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