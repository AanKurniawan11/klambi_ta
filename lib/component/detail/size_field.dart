import 'package:flutter/material.dart';
import '../../Common/colors/color.dart';

Widget SizeField(
  String hint,
  // String label,
) =>
    TextField(
      decoration: InputDecoration(
          hintStyle: const TextStyle(color: ColorValue.kDarkGrey, fontSize: 14),
          hintText: hint,
          // labelText: label,
          labelStyle: const TextStyle(color: ColorValue.kDarkGrey),
          focusedBorder: OutlineInputBorder(
              borderSide: const BorderSide(color: ColorValue.kPrimary),
              borderRadius: BorderRadius.circular(2.0)),
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(5.0),
              borderSide: const BorderSide(color: ColorValue.kLightGrey)),
          border: const OutlineInputBorder()),
      keyboardType: TextInputType.number,
      textInputAction: TextInputAction.done,
    );
