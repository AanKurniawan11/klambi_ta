import 'package:flutter/material.dart';

import '../color.dart';

Widget myText({
  required String text,
  required String username,
  TextStyle? style,
  TextAlign? textAlign,
  Color? color,
}) {
  return Text(
    '$username: $text',
    style: style?.copyWith(color: color),
    textAlign: textAlign,
  );
}


class txt extends StatelessWidget {
  final String username;

  const txt({
    super.key,
    required this.username
  });


  @override
  Widget build(BuildContext context) {
    return Text(username, style:TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.w500,
        fontFamily: "General Sans",
        color: ColorValue.kDarkGrey),
         );
  }
}
