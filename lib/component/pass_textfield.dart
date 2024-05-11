import 'package:flutter/material.dart';

import '../color.dart';


class PassTextField extends StatefulWidget {
  final String hint;
  final String label;
  final IconData? prefixIcon;
  String password = '';
  bool isPasswordVisible = false;

  PassTextField({
    super.key,
    required this.hint,
    required this.label,
    this.prefixIcon,
  });
  @override
  _PasswordTestState createState() => _PasswordTestState();
}

class _PasswordTestState extends State<PassTextField> {
  String password = '';
  bool isPasswordVisible = false;

  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
        hintText: widget.hint,
        hintStyle: const TextStyle(color: ColorValue.kDarkGrey),
        labelText: widget.label,
        labelStyle: const TextStyle(color: ColorValue.kDarkGrey),
        focusedBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: ColorValue.kPrimary),
            borderRadius: BorderRadius.circular(10.0)),
        enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.0),
            borderSide: const BorderSide(color: ColorValue.kLightGrey)),
        prefixIcon: widget.prefixIcon != null
            ? Icon(widget.prefixIcon, color: ColorValue.kDarkGrey)
            : null,
        suffixIcon: IconButton(
          icon: isPasswordVisible
              ? const Icon(
            Icons.visibility_off,
            color: Colors.black,
          )
              : const Icon(
            Icons.visibility,
            color: ColorValue.kDarkGrey,
          ),
          onPressed: () {
            setState(() {
              isPasswordVisible = !isPasswordVisible;
            });
          },
        ),
        border: const OutlineInputBorder(),
      ),
      keyboardType: TextInputType.emailAddress,
      textInputAction: TextInputAction.done,
      obscureText: isPasswordVisible,
    );
  }
}