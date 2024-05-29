import 'package:flutter/material.dart';
import '../../../../color.dart';

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
            fillColor: ColorValue.kLightGrey,
            contentPadding: EdgeInsets.only(left: 20, right: 10),
            border: outlineInputBorder,
            focusedBorder: outlineInputBorder,
            enabledBorder: outlineInputBorder,
            hintText: hintText,
            hintStyle: TextStyle(
              fontFamily: 'General Sans',
              fontWeight: FontWeight.w500,
              fontSize: 16,
              color: ColorValue.kDarkGrey,
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
}

const outlineInputBorder = OutlineInputBorder(
  borderRadius: BorderRadius.all(Radius.circular(10)),
  borderSide: BorderSide.none,
);
