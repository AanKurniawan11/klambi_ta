import 'package:flutter/material.dart';
import 'package:klambi_ta/color.dart';
import 'package:klambi_ta/component/custom_textfield2.dart';

class Alamat extends StatelessWidget {
  final Function(String) onChanged;

  const Alamat({required this.onChanged, super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Nama Alamat*',
            style: TextStyle(
              fontFamily: 'General Sans',
              fontWeight: FontWeight.w500,
              fontSize: 14,
              color: ColorValue.kBlack,
            ),
          ),
          SizedBox(height: 10),
          CustomTextfield(
            hintText: 'Alamat...',
            onChanged: onChanged,
          ),
        ],
      ),
    );
  }
}
