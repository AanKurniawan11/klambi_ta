import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CustomTextfield3 extends StatelessWidget {
  final String hintText;
  final Function(String) onChanged;
  final TextEditingController controller;

  CustomTextfield3({
    required this.hintText,
    required this.onChanged,
    required this.controller,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: TextStyle(
          fontFamily: "General Sans",
          fontSize: 16,
          color: Colors.grey[600],
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(color: Colors.grey[300]!),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(color: Colors.blue, width: 2),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(color: Colors.grey[300]!),
        ),
        contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      ),
      keyboardType: TextInputType.number,
      onChanged: onChanged,
      inputFormatters: [
        LengthLimitingTextInputFormatter(12), // Batasi panjang input menjadi 12 digit
      ],
    );
  }
}
