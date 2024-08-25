import 'package:flutter/material.dart';
import 'package:klambi_ta/Common/colors/color.dart';

class MenuItem extends StatelessWidget {
  final IconData icon;
  final String title;
  final VoidCallback onTap;
  final Color iconColor;
  final Color textColor;
  final bool showArrow;

  const MenuItem({
    Key? key,
    required this.icon,
    required this.title,
    required this.onTap,
    this.iconColor = ColorValue.kSecondary,
    this.textColor = Colors.black,
    this.showArrow = true,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size mediaquery = MediaQuery.of(context).size;
    final double height = mediaquery.height;
    final double width = mediaquery.width;
    return GestureDetector(
      onTap: onTap,
      child: Center(
        child: Container(
          width:width * 0.9 ,
          padding: EdgeInsets.symmetric(vertical: 12, horizontal: 12), // Mengurangi padding horizontal dari 34 ke 20
          margin: EdgeInsets.symmetric(vertical: 4),
          decoration: BoxDecoration(
            color: ColorValue.kLightGrey.withOpacity(0.2),
            borderRadius: BorderRadius.circular(10),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Container(
                    padding: EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: iconColor.withOpacity(0.1),
                    ),
                    child: Icon(icon, size: 20, color: iconColor),
                  ),
                  SizedBox(width: 12),
                  Text(
                    title,
                    style: TextStyle(
                      fontSize: 14,
                      color: textColor,
                      fontWeight: FontWeight.w500,
                      fontFamily: "General Sans",
                    ),
                  ),
                ],
              ),
              if (showArrow)
                Icon(
                  Icons.arrow_forward_ios_rounded,
                  size: 16,
                  color: Colors.grey[600],
                ),
            ],
          ),
        ),
      ),
    );
  }
}
