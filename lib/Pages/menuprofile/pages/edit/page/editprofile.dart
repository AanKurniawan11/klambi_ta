import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:klambi_ta/Pages/menuprofile/pages/edit/components/textfield.dart';
import 'package:klambi_ta/Pages/menuprofile/pages/edit/controller/edit_controller.dart';
import 'package:klambi_ta/component/loadinfanimation.dart';
import 'package:klambi_ta/component/my_elevatedbutton.dart';
import 'package:klambi_ta/component/space_extension.dart';
import '../../../../../common/colors/color.dart';

class EditProfile extends StatelessWidget {
  const EditProfile({super.key});

  @override
  Widget build(BuildContext context) {
    final controllerEdit = Get.put(EditController());
    final double height = MediaQuery.of(context).size.height;
    final double width = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Edit Profile",
          style: TextStyle(fontFamily: "General Sans"),
        ),
        centerTitle: true,
      ),
      body: Obx(
            () => SafeArea(
          child: SingleChildScrollView(
            child: Container(
              padding: EdgeInsets.all(width * 0.05), // Padding responsif
              width: width,
              child: Column(
                children: [
                  Container(
                    width: width * 0.3,
                    height: height * 0.2,
                    child: Stack(
                      children: [
                        controllerEdit.pickedImage.value == null
                            ? ClipOval(
                          child: Container(
                            height: height * 0.15,
                            width: width * 0.3,
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                image: controllerEdit.userProfile.value.image != null
                                    ? NetworkImage(controllerEdit.userProfile.value.image)
                                    : AssetImage("assets/images/banner/pro.png") as ImageProvider,
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        )
                            : ClipOval(
                          child: Container(
                            height: height * 0.15,
                            width: width * 0.3,
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                image: FileImage(controllerEdit.pickedImage.value!),
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        ),
                        Positioned(
                          bottom: 5,
                          right: 0,
                          child: Container(
                            height: height * 0.05,
                            width: width * 0.1,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(50),
                              color: Colors.white,
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black26,
                                  blurRadius: 5,
                                  offset: Offset(0, 2),
                                ),
                              ],
                            ),
                            child: IconButton(
                              onPressed: () {
                                _showPicker(context, controllerEdit);
                              },
                              icon: Icon(
                                Icons.camera_alt_outlined,
                                color: ColorValue.kDarkGrey,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Ganti Username",
                        style: TextStyle(
                          fontSize: width * 0.04, // Ukuran font responsif
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      TextFieldEdit(
                        hint: controllerEdit.userProfile.value.name,
                        controller: controllerEdit.ctrName,
                      ),
                    ],
                  ),
                  Obx(() => controllerEdit.isLoading.value
                      ? Loading()
                      : My_Button(
                    onclick: () {
                      // Validasi sebelum mengupdate
                      if (controllerEdit.ctrName.text.isNotEmpty && controllerEdit.isImageValid.value) {
                        controllerEdit.updateProfile(
                          controllerEdit.ctrName.text,
                          controllerEdit.pickedImage.value,
                        ).then((_) {
                          controllerEdit.ctrName.clear(); // Hapus teks username
                          Get.offAllNamed("/navbar");
                        });
                      } else {
                        Get.snackbar(
                          "Peringatan",
                          "Username dan gambar harus diisi.",
                          snackPosition: SnackPosition.BOTTOM,
                        );
                      }
                    },
                    title: "Simpan",
                    image: controllerEdit.isImageValid.value,
                  )),
                ].withSpaceBetween(height: height * 0.04), // Jarak responsif antar widget
              ),
            ),
          ),
        ),
      ),
    );
  }

  void _showPicker(BuildContext context, EditController controller) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext bc) {
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
            ],
          ),
        );
      },
    );
  }
}
