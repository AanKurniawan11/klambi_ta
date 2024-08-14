import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import 'package:get/get.dart';

import 'package:klambi_ta/Common/colors/color.dart';
import 'package:klambi_ta/Pages/design/controller/design_controller.dart';

class ImageUpload extends StatefulWidget {
  const ImageUpload({super.key});

  @override
  _ImageUploadState createState() => _ImageUploadState();
}

class _ImageUploadState extends State<ImageUpload> {
  File? _image;
  final ImageUploadController imageUploadController = Get.put(ImageUploadController());

  Future<void> _pickImage() async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      setState(() {
        _image = File(pickedFile.path);
      });

      // Panggil method uploadImage dari controller ketika gambar dipilih
      imageUploadController.uploadImage(_image!);
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _pickImage,
      child: Container(
        decoration: BoxDecoration(
          color: ColorValue.kWhite,
          borderRadius: BorderRadius.circular(20),
          border: Border.all(color: ColorValue.kLightGrey),
        ),
        width: double.infinity,
        height: 150,
        child: _image == null
            ? Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.add,
              color: ColorValue.kBlack,
              size: 24,
            ),
            SizedBox(height: 5),
            Text(
              'Unggah File (PNG)',
              style: TextStyle(
                fontFamily: 'General Sans',
                fontWeight: FontWeight.w500,
                fontSize: 12,
                color: ColorValue.kBlack,
              ),
            ),
          ],
        )
            : Image.file(
          _image!,
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
