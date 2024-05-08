import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CustomIconButton extends StatelessWidget {
  const CustomIconButton({
    required this.svgIcon,
    required this.press,
    Key? key, // corrected the super keyword
  }) : super(key: key);

  final String svgIcon;
  final VoidCallback press; // Changed to VoidCallback

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: GestureDetector(
        onTap: press,
        child: SvgPicture.asset(
          svgIcon,
          width: 16,
          height: 16,
        ),
      ),
    );
  }
}
