import 'package:flutter/material.dart';
import '../Common/colors/color.dart';

Widget MyTextField({
  required String hint,
  required String label,
  required TextEditingController controller,
  IconData? prefixIcon,
  required String validationMessage, // Pesan validasi saat TextField kosong
}) =>
    TextFormField(
      controller: controller,
      decoration: InputDecoration(
        hintStyle: const TextStyle(
          color: ColorValue.kDarkGrey,
          fontFamily: "General Sans",
        ),
        hintText: hint,
        labelText: label,
        labelStyle: const TextStyle(
          color: ColorValue.kDarkGrey,
          fontFamily: "General Sans",
        ),
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
      keyboardType: TextInputType.emailAddress,
      textInputAction: TextInputAction.done,
      style: const TextStyle(fontFamily: "General Sans"),
      validator: (value) {
        if (value == null || value.isEmpty) {
          return validationMessage;
        }
        return null;
      },
    );
