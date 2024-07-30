import 'package:flutter/material.dart';
import 'package:klambi_ta/color.dart';
import 'package:klambi_ta/component/custom_textfield3.dart';

class kode_Pos extends StatelessWidget {
  // final Function(String) onCityChanged;
  final Function(String) onCodeChanged;

  const kode_Pos({
    // required this.onCityChanged,
    required this.onCodeChanged,
    super.key,
  });

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
                CustomTextfield3(
                  hintText: 'Kode Pos',
                  onChanged: onCodeChanged,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
