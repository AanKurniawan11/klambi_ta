import 'package:flutter/material.dart';

import '../color.dart';

Widget MyTextField(
    String hint,
    String label,
    final IconData? prefixIcon,
    ) =>
    TextField(
      decoration: InputDecoration(
          hintStyle: const TextStyle(color: ColorValue.kDarkGrey),
          hintText: hint,
          labelText: label,
          labelStyle: const TextStyle(color: ColorValue.kDarkGrey),
          focusedBorder: OutlineInputBorder(
              borderSide: const BorderSide(color: ColorValue.kPrimary),
              borderRadius: BorderRadius.circular(10.0)),
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10.0),
              borderSide: const BorderSide(color: ColorValue.kLightGrey)),
          prefixIcon: prefixIcon != null
              ? Icon(
            prefixIcon,
            color: ColorValue.kDarkGrey,
          )
              : null,
          border: const OutlineInputBorder()),
      keyboardType: TextInputType.emailAddress,
      textInputAction: TextInputAction.done,
    );