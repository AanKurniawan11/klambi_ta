import 'package:flutter/material.dart';

import '../../../Common/colors/color.dart';


class Button1 extends StatelessWidget {
  final VoidCallback onclick;
  final String title;


  Button1({super.key, required this.onclick, required this.title});

  @override
  Widget build(BuildContext context) {
    final Size mediaquery = MediaQuery.of(context).size;
    final double height = mediaquery.height;
    final double width = mediaquery.width;
    return ElevatedButton(
        onPressed: onclick,
        style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(ColorValue.kPrimary),
            minimumSize:
            MaterialStateProperty.all(Size(width * 0.85, height * 0.065)),
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12.0)))),
        child: Text(
          title,
          style: const TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w600,
            fontSize: 18,
          ),
        ));
  }
}
