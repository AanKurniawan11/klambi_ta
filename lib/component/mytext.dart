import 'package:flutter/material.dart';
import '../Common/colors/color.dart';



Widget myTexts({
  required String text,

}) {
  return Text(
    text,
    style: TextStyle(color: Colors.white,fontFamily: "General Sans",fontSize: 14),maxLines: 3,
  );
}


class txte extends StatelessWidget {
  final String email;

  const txte({
    super.key,
    required this.email
  });


  @override
  Widget build(BuildContext context) {
    return Text(
      email, style:TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.w500,
        fontFamily: "General Sans",
        color: ColorValue.kDarkGrey),
    );
  }
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
        fontSize: 18,
        fontWeight: FontWeight.w500,
        fontFamily: "General Sans",
        color: ColorValue.kBlack),
         );
  }
}
