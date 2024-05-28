import 'package:flutter/material.dart';
import 'package:klambi_ta/Pages/address/insert/components/custom_dropdown.dart';

import '../../../../color.dart';

class RegionalProvince extends StatelessWidget {
  const RegionalProvince({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Provinsi*',
            style: TextStyle(
              fontFamily: 'General Sans',
              fontWeight: FontWeight.w500,
              fontSize: 14,
              color: ColorValue.kBlack,
            ),
          ),
          SizedBox(height: 10),
          CustomDropdown(
            items: ['Jawa Tengah', 'Jawa Timur', 'Jawa Barat'],
            hintText: 'Provinsi...',
            onChanged: (String? newValue) {
              print('Selected: $newValue');
            },
          )
        ],
      ),
    );
  }
}
