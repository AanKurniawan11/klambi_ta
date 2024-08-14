import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:klambi_ta/Common/colors/color.dart';
import 'package:klambi_ta/Pages/menuprofile/components/profile_controller.dart';
import 'package:klambi_ta/Pages/menuprofile/pages/address/controller/address_controller.dart';
import 'package:klambi_ta/Pages/menuprofile/pages/edit/controller/edit_controller.dart';
import 'package:klambi_ta/component/mytext.dart';
import 'package:klambi_ta/component/space_extension.dart';

class Profile extends StatelessWidget {
  Profile({super.key});
  final profileController = Get.put(ProfileController());
  final controller = Get.put(EditController());
  final showDataController = Get.put(AddressController());

  Future<void> showLogoutConfirmationDialog(BuildContext context) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Confirm Logout'),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Text('Are you sure you want to log out?'),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: Text('Cancel'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: Text('Log Out'),
              onPressed: () async {
                profileController.logoutg();

                if (Navigator.of(context).canPop()) {
                  Navigator.of(context).pop();
                }
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final Size mediaquery = MediaQuery.of(context).size;
    final double height = mediaquery.height;
    final double width = mediaquery.width;

    return Scaffold(
      body: Obx(
            () => SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 80),
            child: Center(
              child: Column(
                children: [
                  if (controller.username.value.isNotEmpty)
                    Column(
                      children: [
                        CircleAvatar(
                          backgroundImage:
                              FileImage(controller.pickedImage.value as File),
                          radius: 50,
                        ),
                        txt(
                          username: profileController.username.value,
                        ),
                        txt(
                          username: profileController.email.value,
                        ),
                      ],
                    )
                  else
                    Column(
                      children: [
                        ClipOval(
                          child: Container(
                            height: height * 0.14,
                            width: width * 0.3,
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                image: controller.pickedImage.value != null
                                    ? FileImage(controller.pickedImage.value!)
                                    : controller.imageUrl.value != null
                                    ? NetworkImage(controller.imageUrl.value!)
                                    : AssetImage("assets/images/banner/pro.png") as ImageProvider,
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(height: 10),
                        txt(username: controller.userProfile.value.name),
                        txt(username: profileController.email.value),
                      ],
                    ),
                  const Padding(
                    padding: EdgeInsets.only(right: 280, top: 50),
                    child: Text(
                      "Menu",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                        fontFamily: "General Sans",
                        color: ColorValue.kDarkGrey,
                      ),
                    ),
                  ),
                  const Divider(
                    thickness: 1,
                    indent: 25,
                    endIndent: 25,
                    color: ColorValue.kLightGrey,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      vertical: 20,
                      horizontal: 25,
                    ),
                    child: Column(
                      children: [
                        GestureDetector(
                          onTap: () {
                            Get.offAllNamed("/edit");
                          },
                          child: Row(
                            children: [
                              const Icon(
                                Icons.edit,
                                size: 30,
                                color: ColorValue.kPrimary,
                              ),
                              const Text(
                                "Edit Profile",
                                style: TextStyle(
                                  fontSize: 16,
                                  fontFamily: "General Sans",
                                ),
                              )
                            ].withSpaceBetween(width: 20),
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            showDataController.ShowData();
                            Get.offNamed("/addAddress");
                          },
                          child: Row(
                            children: [
                              const Icon(
                                Icons.location_on_outlined,
                                size: 35,
                                color: ColorValue.kPrimary,
                              ),
                              const Text(
                                "Alamat",
                                style: TextStyle(
                                  fontSize: 16,
                                  fontFamily: "General Sans",
                                ),
                              )
                            ].withSpaceBetween(width: 20),
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            Get.offNamed("/chat");
                          },
                          child: Row(
                            children: [
                              const Icon(
                                CupertinoIcons.chat_bubble_text,
                                size: 35,
                                color: ColorValue.kSecondary,
                              ),
                              const Text(
                                "Chat",
                                style: TextStyle(
                                  fontSize: 16,
                                  fontFamily: "General Sans",
                                ),
                              )
                            ].withSpaceBetween(width: 20),
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            Get.offNamed("/cs");
                          },
                          child: Row(
                            children: [
                              const Icon(
                                Icons.headset_mic_outlined,
                                size: 35,
                                color: ColorValue.kPrimary,
                              ),
                              const Text(
                                "Pusat Bantuan",
                                style: TextStyle(
                                  fontSize: 16,
                                  fontFamily: "General Sans",
                                ),
                              )
                            ].withSpaceBetween(width: 20),
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            showLogoutConfirmationDialog(context);
                          },
                          child: Row(
                            children: [
                              const Icon(
                                Icons.output_outlined,
                                size: 35,
                                color: ColorValue.kDanger,
                              ),
                              const Text(
                                "Log Out",
                                style: TextStyle(
                                  fontSize: 16,
                                  color: ColorValue.kDanger,
                                  fontFamily: "General Sans",
                                ),
                              )
                            ].withSpaceBetween(width: 20),
                          ),
                        ),
                      ].withSpaceBetween(height: 25),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
