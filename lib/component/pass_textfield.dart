import 'package:flutter/material.dart';
import '../Common/colors/color.dart';

class PassTextField extends StatefulWidget {
  final String hint;
  final String label;
  final IconData? prefixIcon;
  final TextEditingController controller;

  PassTextField({
    super.key,
    required this.hint,
    required this.label,
    this.prefixIcon,
    required this.controller,
  });

  @override
  _PassTextFieldState createState() => _PassTextFieldState();
}

class _PassTextFieldState extends State<PassTextField> {
  bool isPasswordVisible = false;
  String? errorMessage;

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: widget.controller,
      decoration: InputDecoration(
        hintText: widget.hint,
        hintStyle: const TextStyle(color: ColorValue.kDarkGrey, fontFamily: "General Sans"),
        labelText: widget.label,
        labelStyle: const TextStyle(color: ColorValue.kDarkGrey, fontFamily: "General Sans"),
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: ColorValue.kPrimary),
          borderRadius: BorderRadius.circular(10.0),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
          borderSide: const BorderSide(color: ColorValue.kLightGrey),
        ),
        prefixIcon: widget.prefixIcon != null
            ? Icon(widget.prefixIcon, color: ColorValue.kDarkGrey)
            : null,
        suffixIcon: IconButton(
          icon: isPasswordVisible
              ? const Icon(
            Icons.visibility_off_outlined,
            color: Colors.black,
          )
              : const Icon(
            Icons.visibility_outlined,
            color: ColorValue.kDarkGrey,
          ),
          onPressed: () {
            setState(() {
              isPasswordVisible = !isPasswordVisible;
            });
          },
        ),
        border: const OutlineInputBorder(),
        errorText: errorMessage,
      ),
      keyboardType: TextInputType.text,
      style: const TextStyle(fontFamily: "General Sans"),
      textInputAction: TextInputAction.done,
      obscureText: !isPasswordVisible,
      onChanged: (value) {
        setState(() {
          if (value.length < 8) {
            errorMessage = 'Password harus terdiri dari minimal 8 karakter';
          } else {
            errorMessage = null;
          }
        });
      },
    );
  }
}
