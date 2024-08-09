import 'package:flutter/material.dart';
import 'package:klambi_ta/Common/colors/color.dart';
import 'package:klambi_ta/Pages/insert/components/custom_textfield2.dart';

class Keterangan extends StatelessWidget {
   Keterangan({super.key, required this.onChanged});
  final Function(String) onChanged;


  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 5),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomTextfield(hintText: 'Keterangan',
            onChanged: onChanged,
          )
        ],
      ),
    );
  }
}
