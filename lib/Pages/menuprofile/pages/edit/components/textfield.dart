import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:klambi_ta/Common/colors/color.dart';


Widget TextFieldEdit({
  required String hint,
  required TextEditingController controller,
  IconData? prefixIcon,
}) =>
    TextField(
      controller: controller,
      decoration: InputDecoration(
        hintStyle: const TextStyle(color: ColorValue.kDarkGrey),
        hintText: hint,
        labelStyle: const TextStyle(color: ColorValue.kDarkGrey),
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: ColorValue.kPrimary),
          borderRadius: BorderRadius.circular(10.0),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
          borderSide: const BorderSide(color: ColorValue.kLightGrey),
        ),
        prefixIcon: prefixIcon != null
            ? Icon(
          prefixIcon,
          color: ColorValue.kDarkGrey,
        )
            : null,
        border: const OutlineInputBorder(),
      ),
      style: TextStyle(fontFamily: "General Sans"),

      keyboardType: TextInputType.emailAddress,
      textInputAction: TextInputAction.done,
    );
