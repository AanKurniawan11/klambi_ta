import 'package:flutter/material.dart';
import 'package:klambi_ta/Pages/design/components/image_upload.dart';
import 'package:klambi_ta/color.dart';
import 'package:klambi_ta/component/my_elevatedbutton.dart';
import 'package:klambi_ta/component/my_elevatedbutton2.dart';

class UploadContainer extends StatelessWidget {
  const UploadContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: ColorValue.kLightGrey.withOpacity(0.2),
        border: Border.all(color: ColorValue.kLightGrey),
        borderRadius: BorderRadius.circular(20),
      ),
      width: MediaQuery.of(context).size.width / 1.1,
      height: MediaQuery.of(context).size.height / 1.3,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Desain Baju',
              style: TextStyle(
                fontFamily: 'General Sans',
                fontWeight: FontWeight.w600,
                fontSize: 20,
              ),
            ),
            SizedBox(height: 20), // Add some space between the texts
            Text(
              'Custom Sendiri Bajumu',
              style: TextStyle(
                fontFamily: 'General Sans',
                fontWeight: FontWeight.w500,
                fontSize: 14,
                color: ColorValue.kDarkGrey.withOpacity(0.5),
              ),
            ),
            Divider(
              color: ColorValue.kDarkGrey.withOpacity(0.2),
              thickness: 1,
            ),
            SizedBox(height: 10), // Add some space after the divider
            Image.asset(
              'assets/images/design/raw_image.png',
              fit: BoxFit.contain,
            ),
            SizedBox(height: 10),
            My_Button2(
              onclick: () {},
              title: 'Unduh Mentahan',
            ),
            SizedBox(height: 20),
            const ImageUpload(),
          ],
        ),
      ),
    );
  }
}