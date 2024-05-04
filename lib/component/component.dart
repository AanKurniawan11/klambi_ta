import 'package:flutter/material.dart';
import 'package:klambi_ta/color.dart';

class MyTextField extends StatelessWidget {
  // final TextEditingController controller;
  final String hintText;
  final bool obscureText;
  final IconData? prefixIcon;
  String Password = "";
  bool isPasswordVisible = false;


  MyTextField({
    Key? key,
    // required this.controller,
    required this.hintText,
    required this.obscureText,
    this.prefixIcon,
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
          obscureText: obscureText,
          style: TextStyle(color: Colors.black, fontSize: 16.0),
          decoration: InputDecoration(
            contentPadding:
                EdgeInsets.symmetric(vertical: 16.0, horizontal: 20.0),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: ColorValue.kLightGrey),
              borderRadius: BorderRadius.circular(10.0),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: ColorValue.kPrimary),
              borderRadius: BorderRadius.circular(10.0),
            ),
            filled: true,
            fillColor: Colors.transparent,
            hintText: hintText,
            hintStyle: TextStyle(color: ColorValue.kDarkGrey),
            prefixIcon: prefixIcon != null ? Icon(prefixIcon,color: ColorValue.kDarkGrey,) : null,
          ),
        ),
      ),
    );
  }
}

extension ListSpaceBetweenExtension on List<Widget> {
  List<Widget> withSpaceBetween({double? width, double? height}) => [
        if (isNotEmpty) this[0],
        for (int i = 1; i < length; i++) ...[
          SizedBox(width: width, height: height),
          this[i]
        ]
      ];
}

Widget elevatedbutton(BuildContext context, String title) {
  final Size mediaquery = MediaQuery.of(context).size;
  final double height = mediaquery.height;
  final double width = mediaquery.width;
  // final String title ;
  return ElevatedButton(
      onPressed: () {},
      style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(ColorValue.kPrimary),
          minimumSize:
              MaterialStateProperty.all(Size(width * 0.85, height * 0.065)),
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12.0)))),
      child: Text(
        title,
        style: TextStyle(
          color: Colors.black,
          fontWeight: FontWeight.w600,
          fontSize: 18,
        ),
      ));
}

Widget texttest(String hint,String label,final IconData? prefixIcon,
)=>TextField(

  decoration: InputDecoration(
    hintStyle: TextStyle(color: ColorValue.kDarkGrey),
    hintText: hint,
    labelText: label,
      labelStyle: TextStyle(color: ColorValue.kDarkGrey),
      focusedBorder: OutlineInputBorder(
          borderSide:BorderSide(color: ColorValue.kPrimary),
          borderRadius: BorderRadius.circular(10.0)
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10.0),
        borderSide: BorderSide(color: ColorValue.kLightGrey)
      ),

      prefixIcon: prefixIcon != null ? Icon(prefixIcon,color: ColorValue.kDarkGrey,) : null,

    // suffixIcon: IconButton(
    //   icon: Icon(Icons.close),
    //   onPressed: (){},

    // ),
    border: OutlineInputBorder()
  ),
  keyboardType: TextInputType .emailAddress,
  textInputAction: TextInputAction.done,
);

class PasswordTest extends StatefulWidget {
  final String hint;
  final String label;
  final IconData? prefixIcon;
  String password = '';
  bool isPasswordVisible = false;

  PasswordTest({
    required this.hint,
    required this.label,
    this.prefixIcon,
  });
  @override
  _PasswordTestState createState() => _PasswordTestState();
}

class _PasswordTestState extends State<PasswordTest> {
  // final String hint;
  // final String label;
  String password = '';
  bool isPasswordVisible = false;


  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
        hintText: widget.hint,
        hintStyle: TextStyle(color: ColorValue.kDarkGrey),
        labelText: widget.label,
        labelStyle: TextStyle(color: ColorValue.kDarkGrey),
        focusedBorder: OutlineInputBorder(
            borderSide:BorderSide(color: ColorValue.kPrimary),
            borderRadius: BorderRadius.circular(10.0)
        ),
        enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.0),
            borderSide: BorderSide(color: ColorValue.kLightGrey)
        ),
        prefixIcon: widget.prefixIcon != null
            ? Icon(widget.prefixIcon, color: ColorValue.kDarkGrey)
            : null,        suffixIcon: IconButton(
          icon: isPasswordVisible
              ? Icon(Icons.visibility_off,color: Colors.black,)
              : Icon(Icons.visibility,color: ColorValue.kDarkGrey,),
          onPressed: () {
            setState(() {
              isPasswordVisible = !isPasswordVisible;
            });
          },
        ),
        border: OutlineInputBorder(),
      ),
      keyboardType: TextInputType.emailAddress,
      textInputAction: TextInputAction.done,
      obscureText: isPasswordVisible,
    );
  }
}



