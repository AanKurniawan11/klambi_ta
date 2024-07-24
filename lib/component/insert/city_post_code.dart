import 'package:flutter/material.dart';
import 'package:klambi_ta/Common/colors/color.dart';
import 'package:klambi_ta/component/insert/custom_textfield3.dart';

class CityPostCode extends StatelessWidget {
  const CityPostCode({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Kota',
                  style: TextStyle(
                    fontFamily: 'General Sans',
                    fontWeight: FontWeight.w500,
                    fontSize: 14,
                    color: ColorValue.kBlack,
                  ),
                ),
                SizedBox(height: 10),
                CustomTextfield3(hintText: 'Kota...'),
              ],
            ),
          ),
          SizedBox(width: 10),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Kode Pos',
                  style: TextStyle(
                    fontFamily: 'General Sans',
                    fontWeight: FontWeight.w500,
                    fontSize: 14,
                    color: ColorValue.kBlack,
                  ),
                ),
                SizedBox(height: 10),
                CustomTextfield3(hintText: 'Kode Pos...'),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
