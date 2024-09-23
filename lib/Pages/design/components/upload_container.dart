import 'dart:io';

import 'package:flutter/material.dart';
import 'package:klambi_ta/Pages/design/components/image_upload.dart';
import 'package:klambi_ta/Common/colors/color.dart';

class UploadContainer extends StatelessWidget {
  final ValueNotifier<File?> uploadedImage;
  const UploadContainer({super.key, required this.uploadedImage});

  @override
  Widget build(BuildContext context) {
    return
      Container(
      decoration: BoxDecoration(
        color: ColorValue.kLightGrey.withOpacity(0.2),
        border: Border.all(color: ColorValue.kLightGrey),
        borderRadius: BorderRadius.circular(20),
      ),
      width: MediaQuery.of(context).size.width / 1.1,
      height: MediaQuery.of(context).size.height / 0.85,
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
            SizedBox(height: 20),
            Text(
              'Contoh Desain',
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
            SizedBox(height: 10),
            Center(
              child: Image.asset(
                'assets/images/design/catalog1.jpg',
                fit: BoxFit.contain,
              ),
            ),
            SizedBox(height: 20),
            Text(
              'Desain Kamu',
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
            SizedBox(height: 10),
            ImageUpload(
              uploadedImage: uploadedImage,
            ),
          ],
        ),
      ),
    );
  }
}
