import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:get/get.dart';

import 'package:klambi_ta/Common/colors/color.dart';
import 'package:klambi_ta/Pages/design/controller/design_controller.dart';

class ImageUpload extends StatefulWidget {
  final ValueNotifier<File?> uploadedImage;
  const ImageUpload({super.key, required this.uploadedImage});

  @override
  _ImageUploadState createState() => _ImageUploadState();
}

class _ImageUploadState extends State<ImageUpload> {
  final ImageUploadController imageUploadController = Get.put(ImageUploadController());

  Future<void> _pickImage() async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      File selectedImage = File(pickedFile.path);
      widget.uploadedImage.value = selectedImage;

      // Panggil method uploadImage dari controller ketika gambar dipilih
      imageUploadController.uploadImage(selectedImage);
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
        height: 560,
        child: ValueListenableBuilder<File?>(
          valueListenable: widget.uploadedImage,
          builder: (context, image, child) {
            return image == null
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
                  'Unggah Desain (PNG & JPG)',
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
              image,
              fit: BoxFit.fill,
            );
          },
        ),
      ),
    );
  }
}
