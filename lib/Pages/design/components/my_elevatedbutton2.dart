import 'package:flutter/material.dart';

import '../../../Common/colors/color.dart';

class My_Button2 extends StatelessWidget {
  final VoidCallback onclick;
  final String title;
  final IconData? icon; // Tambahkan parameter ikon

  const My_Button2({
    super.key,
    required this.onclick,
    required this.title,
    this.icon, // Tambahkan ikon ke konstruktor
  });

  @override
  Widget build(BuildContext context) {
    final Size mediaquery = MediaQuery.of(context).size;
    final double height = mediaquery.height;
    final double width = mediaquery.width;

    return ElevatedButton(
      onPressed: onclick,
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all(ColorValue.kSecondary),
        minimumSize: MaterialStateProperty.all(Size(width * 0.85, height * 0.065)),
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
