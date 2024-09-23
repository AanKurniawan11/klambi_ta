import 'package:flutter/material.dart';

import '../../../Common/colors/color.dart';

import 'package:flutter/material.dart';

class CustomTextfield extends StatelessWidget {
  final String hintText;
  final Function(String) onChanged;
  final TextEditingController? controller;

  CustomTextfield({
    required this.hintText,
    required this.onChanged,
    this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      onChanged: onChanged,
      style: TextStyle(
        fontFamily: "General Sans", // Sesuaikan dengan style Textfield di Telepon
        fontSize: 16, // Sesuaikan ukuran font
        color: Colors.black,
      ),
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: TextStyle(
          fontFamily: "General Sans", // Font hintText yang sama
          fontSize: 16,
          color: Colors.grey,
        ),
        contentPadding: EdgeInsets.symmetric(vertical: 15, horizontal: 10), // Sesuaikan padding
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.0),
          borderSide: BorderSide(
            color: Colors.grey,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.0),
          borderSide: BorderSide(
            color: Colors.blue, // Border warna biru saat focus
            width: 2.0,
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
