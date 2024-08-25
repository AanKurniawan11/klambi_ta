import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:klambi_ta/Common/colors/color.dart';
import 'package:klambi_ta/Pages/menuprofile/components/menu_item.dart';
import 'package:klambi_ta/Pages/menuprofile/components/profile_controller.dart';
import 'package:klambi_ta/Pages/menuprofile/pages/address/controller/address_controller.dart';
import 'package:klambi_ta/Pages/menuprofile/pages/edit/controller/edit_controller.dart';
import '../components/category.dart';

class Profile extends StatelessWidget {
  Profile({super.key});
  final profileController = Get.put(ProfileController());
  final editController = Get.put(EditController());
  final addressController = Get.put(AddressController());

  @override
  Widget build(BuildContext context) {
    final Size mediaquery = MediaQuery.of(context).size;
    final double height = mediaquery.height;
    final double width = mediaquery.width;

    return Scaffold(
      body: Obx(
        () => Padding(
          padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              ClipOval(
                child: Container(
                  height: height * 0.13,
                  width: width * 0.28,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: editController.pickedImage.value != null
                          ? FileImage(editController.pickedImage.value!)
                          : editController.imageUrl.value != null
                              ? NetworkImage(editController.imageUrl.value!)
                              : AssetImage("assets/images/banner/pro.png")
                                  as ImageProvider,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 12),
              Text(
                editController.userProfile.value.name,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                  color: ColorValue.kPrimary,
                ),
              ),
              SizedBox(height: 4),
              Text(
                profileController.email.value,
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.grey[600],
                ),
              ),
              SizedBox(height: 10),
              CategorySection(
                title: "Profil",
                items: [
                  MenuItem(
                    icon: Icons.edit,
                    title: "Edit Profile",
                    onTap: () {
                      Get.offAllNamed("/edit");
                    },
                  ),
                  MenuItem(
                    icon: Icons.location_on_outlined,
                    title: "Alamat",
                    onTap: () {
                      addressController.ShowData();
                      Get.offNamed("/addAddress");
                    },
                  ),
                ],
              ),
              SizedBox(height: 10),
              CategorySection(
                title: "Lainnya",
                items: [
                  MenuItem(
                    icon: CupertinoIcons.chat_bubble_text,
                    title: "Chat",
                    onTap: () {
                      Get.offNamed("/chat");
                    },
                  ),
                  MenuItem(
                    icon: Icons.headset_mic_outlined,
                    title: "Pusat Bantuan",
                    onTap: () {
                      Get.offNamed("/cs");
                    },
                  ),
                  MenuItem(
                    icon: Icons.logout,
                    title: "Log Out",
                    iconColor: ColorValue.kDanger,
                    textColor: ColorValue.kDanger,
                    showArrow: false,
                    onTap: () {
                      profileController.showLogoutConfirmationDialog(context);
                    },
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
