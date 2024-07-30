import 'package:flutter/material.dart';

import '../../Common/colors/color.dart';

class ChatTextField extends StatelessWidget {
  // final TextEditingController controller;
  final String hintText;
  final IconData? suffixIcon;
  String password = "";

  ChatTextField({
    Key? key,
    // required this.controller,
    required this.hintText,
    this.suffixIcon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size mediaquery = MediaQuery.of(context).size;
    final double height = mediaquery.height;
    final double width = mediaquery.width;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 5.0),
      child: SizedBox(
        width: width * 0.89,
        child: TextField(
          // controller: controller,
          style: const TextStyle(color: Colors.black, fontSize: 16.0),
          decoration: InputDecoration(
            contentPadding:
                const EdgeInsets.symmetric(vertical: 16.0, horizontal: 20.0),
            enabledBorder: OutlineInputBorder(
              borderSide: const BorderSide(color: ColorValue.kLightGrey),
              borderRadius: BorderRadius.circular(10.0),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: const BorderSide(color: ColorValue.kSecondary),
              borderRadius: BorderRadius.circular(10.0),
            ),
            filled: true,
            fillColor: Colors.transparent,
            hintText: hintText,
            hintStyle: const TextStyle(color: ColorValue.kDarkGrey),
            suffixIcon: suffixIcon != null
                ? GestureDetector(
                    child: Icon(
                      suffixIcon,
                      color: ColorValue.kDarkGrey,
                    ),
                    onTap: () {},
                  )
                : null,
          ),
        ),
      ),
    );
  }
}
