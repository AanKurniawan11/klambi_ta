import 'package:flutter/material.dart';

import '../color.dart';

class SizeButton extends StatefulWidget {
  final VoidCallback onclick;
  final String title;

  SizeButton({super.key, required this.onclick, required this.title});

  @override
  _SizeButtonState createState() => _SizeButtonState();
}

class _SizeButtonState extends State<SizeButton> {
  bool _isClicked = false;

  @override
  Widget build(BuildContext context) {
    final Size mediaquery = MediaQuery.of(context).size;
    final double height = mediaquery.height;
    final double width = mediaquery.width;

    return ElevatedButton(
      onPressed: () {
        setState(() {
          _isClicked = !_isClicked;
        });
        widget.onclick();
      },
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all(
          _isClicked ? ColorValue.kPrimary : ColorValue.kWhite, // Change the color when clicked
        ),
        minimumSize: MaterialStateProperty.all(Size(width * 0.01, height * 0.065)),
        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12.0),
            // side:  BorderSide(color: Colors.black)
          ),
        ),
      ),
      child: Text(widget.title,
        style: const TextStyle(
          color: Colors.black,
          fontWeight: FontWeight.w600,
          fontSize: 12,
        ),
      ),
    );
  }
}


