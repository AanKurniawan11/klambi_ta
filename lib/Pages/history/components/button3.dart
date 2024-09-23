import 'package:flutter/material.dart';

import '../../../Common/colors/color.dart';

class My_Button3 extends StatelessWidget {
  final VoidCallback onclick;
  final String title;
  final IconData? icon;

  const My_Button3({
    super.key,
    required this.onclick,
    required this.title,
    this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onclick,
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all(ColorValue.kSecondary),
        padding: MaterialStateProperty.all(EdgeInsets.symmetric(horizontal: 16, vertical: 12)),
        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12.0),
          ),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          if (icon != null)
            Padding(
              padding: const EdgeInsets.only(right: 8.0),
              child: Icon(
                icon,
                color: ColorValue.kWhite,
              ),
            ),
          Text(
            title,
            style: const TextStyle(
              color: ColorValue.kWhite,
              fontWeight: FontWeight.w500,
              fontSize: 16,
            ),
          ),
        ],
      ),
    );
  }
}
