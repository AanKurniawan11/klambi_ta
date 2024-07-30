import 'package:flutter/material.dart';
import 'package:klambi_ta/color.dart';
import 'package:klambi_ta/component/custom_textfield2.dart';
import 'package:klambi_ta/component/custom_textfield3.dart';

class Jalan extends StatelessWidget {
  Jalan({super.key, required this.onChanged});
  final Function(String) onChanged;


  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Jalan*',
            style: TextStyle(
              fontFamily: 'General Sans',
              fontWeight: FontWeight.w500,
              fontSize: 14,
              color: ColorValue.kBlack,
            ),
          ),
          SizedBox(height: 10),
          CustomTextfield(
              hintText: 'Jalan...',
              onChanged: onChanged,
          )
        ],
      ),
    );
  }
}
