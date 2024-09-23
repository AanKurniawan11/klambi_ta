import 'package:flutter/material.dart';
import '../../../../Common/colors/color.dart';

import 'package:flutter/material.dart';
import '../../../../Common/colors/color.dart';

class CustomDropdown extends StatelessWidget {
  final List<String> items;
  final String hintText;
  final ValueChanged<String?>? onChanged;
  final String? value;

  const CustomDropdown({
    required this.items,
    required this.hintText,
    this.onChanged,
    this.value,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Form(
      child: SizedBox(
        height: 50, // Set the height of the DropdownButtonFormField
        child: DropdownButtonFormField<String>(
          value: value,
          decoration: InputDecoration(
            filled: true,
            fillColor: Colors.transparent, // Sama dengan warna TextField
            contentPadding: EdgeInsets.symmetric(vertical: 15, horizontal: 10), // Disamakan dengan TextField padding
            border: _outlineInputBorder(),
            focusedBorder: _outlineInputBorder(focused: true),
            enabledBorder: _outlineInputBorder(),
            hintText: hintText,
            hintStyle: TextStyle(
              fontFamily: 'General Sans',
              fontWeight: FontWeight.w500,
              fontSize: 16,
              color: ColorValue.kDarkGrey, // Sesuaikan warna teks dengan TextField
            ),
          ),
          style: TextStyle(
            fontFamily: 'General Sans',
            fontWeight: FontWeight.w500,
            fontSize: 16,
            color: ColorValue.kBlack,
          ),
          icon: Icon(Icons.arrow_drop_down, color: ColorValue.kBlack),
          onChanged: onChanged,
          items: items.map<DropdownMenuItem<String>>((String value) {
            return DropdownMenuItem<String>(
              value: value,
              child: Text(value),
            );
          }).toList(),
        ),
      ),
    );
  }

  // Function to generate outlineInputBorder
  OutlineInputBorder _outlineInputBorder({bool focused = false}) {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(8.0), // Sesuaikan border radius
      borderSide: BorderSide(
        color: focused ? Colors.blue : Colors.grey, // Sama dengan gaya TextField saat focus atau tidak
        width: focused ? 2.0 : 1.0,
      ),
    );
  }
}

const outlineInputBorder = OutlineInputBorder(
  borderRadius: BorderRadius.all(Radius.circular(10)),
  borderSide: BorderSide.none,
);
