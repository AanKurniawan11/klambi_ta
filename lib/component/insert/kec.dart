import 'package:flutter/material.dart';
import 'package:klambi_ta/component/insert/custom_dropdown.dart';

class Kec extends StatelessWidget {
  final Function(String) onCodeChanged;

  Kec({super.key, required this.onCodeChanged});

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
                  items: ['Gebog', 'Gondosari', 'Thekelan','Rendeng','Kandang Mas'],
                  hintText: 'Kecamatan',
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