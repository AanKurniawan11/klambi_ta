import 'package:flutter/material.dart';
import '../Common/colors/color.dart';

class My_Button extends StatelessWidget {
  final VoidCallback onclick;
  final String title;
  final bool loading;
  final bool image;
  My_Button({
    super.key,
    required this.onclick,
    required this.title,
    this.image = true,
    this.loading = false, // Default loading adalah false
  });

  @override
  Widget build(BuildContext context) {
    final Size mediaquery = MediaQuery.of(context).size;
    final double height = mediaquery.height;
    final double width = mediaquery.width;

    return ElevatedButton(
      onPressed: loading ? null : onclick, // Nonaktifkan tombol jika sedang loading
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all(ColorValue.kPrimary),
        minimumSize: MaterialStateProperty.all(Size(width * 0.85, height * 0.065)),
        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12.0),
          ),
        ),
      ),
      child: loading
          ? SizedBox(
        height: 20,
        width: 20,
        child: CircularProgressIndicator(
          color: Colors.white,
          strokeWidth: 2.0,
        ),
      )
          : Text(
        title,
        style: const TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.w600,
          fontSize: 18,
        ),
      ),
    );
  }
}
