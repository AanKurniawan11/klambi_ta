import 'package:flutter/material.dart';

import '../color.dart';

class CustomTextfield extends StatelessWidget {
  final String hintText;
  const CustomTextfield({required this.hintText, super.key});

  @override
  Widget build(BuildContext context) {
    return Form(
      child: SizedBox(
        height: 50, // Set the height of the TextFormField
        child: TextFormField(
          decoration: InputDecoration(
            filled: true,
            fillColor: ColorValue.kLightGrey,
            contentPadding: EdgeInsets.only(left: 20), // Set left padding only
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
            fontSize: 16  ,
            color: ColorValue.kBlack,
          ),
        ),
      ),
    );
  }
}

const outlineInputBorder = OutlineInputBorder(
  borderRadius: BorderRadius.all(Radius.circular(10)),
  borderSide: BorderSide.none,
);
