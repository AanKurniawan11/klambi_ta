import 'package:flutter/material.dart';
import '../color.dart';

Widget MyTextFields(
  String hint,
  // String label,
) =>
    TextField(
      decoration: InputDecoration(
          hintStyle: const TextStyle(color: ColorValue.kDarkGrey),
          hintText: hint,
          // labelText: label,
          labelStyle: const TextStyle(color: ColorValue.kDarkGrey),
          focusedBorder: OutlineInputBorder(
              borderSide: const BorderSide(color: ColorValue.kPrimary),
              borderRadius: BorderRadius.circular(10.0)),
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10.0),
              borderSide: const BorderSide(color: ColorValue.kLightGrey)),
          border: const OutlineInputBorder()),
      keyboardType: TextInputType.emailAddress,
      textInputAction: TextInputAction.done,
    );
