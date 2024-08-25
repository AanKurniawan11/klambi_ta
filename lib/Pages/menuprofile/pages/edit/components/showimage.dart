import 'package:flutter/material.dart';
import 'package:klambi_ta/Pages/menuprofile/pages/edit/controller/edit_controller.dart';

class ImagePickerBottomSheet extends StatelessWidget {
  final EditController controller;

  ImagePickerBottomSheet({required this.controller});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Wrap(
        children: <Widget>[
          ListTile(
            leading: Icon(Icons.photo_library),
            title: Text('Galeri'),
            onTap: () {
              controller.pickImage();
              Navigator.of(context).pop();
            },
          ),
          ListTile(
            leading: Icon(Icons.photo_camera),
            title: Text('Kamera'),
            onTap: () {
              controller.pickImage();
              Navigator.of(context).pop();
            },
          ),
        ],
      ),
    );
  }
}
