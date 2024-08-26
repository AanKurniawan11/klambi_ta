import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:klambi_ta/Common/colors/color.dart';
import 'package:klambi_ta/Pages/menuprofile/components/profile_controller.dart';
import 'package:klambi_ta/Pages/menuprofile/pages/address/controller/address_controller.dart';
import 'package:klambi_ta/Pages/menuprofile/pages/edit/controller/edit_controller.dart';

class Profile extends StatelessWidget {
  Profile({super.key});

  final profileController = Get.put(ProfileController());
  final editController = Get.put(EditController());
  final addressController = Get.put(AddressController());

  Future<void> showLogoutConfirmationDialog(BuildContext context) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12.0),
          ),
          title: Text('Confirm Logout'),
          content: Text('Are you sure you want to log out?'),
          actions: <Widget>[
            TextButton(
              child: Text('Cancel'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: ColorValue.kDanger,
              ),
              child: Text('Log Out'),
              onPressed: () async {
                await profileController.logoutg();
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
                          : AssetImage("assets/images/banner/pro.png") as ImageProvider,
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
              SizedBox(height: 5),

              Container(
                padding: EdgeInsets.all(8),
                child: Column(
                  children: [
                    _buildCategorySection(
                      title: "Profil",
                      items: [
                        _buildMenuItem(
                          icon: Icons.edit,
                          title: "Edit Profile",
                          onTap: () {
                            Get.offAllNamed("/edit");
                          },
                        ),
                        _buildMenuItem(
                          icon: Icons.location_on_outlined,
                          title: "Alamat",
                          onTap: () {
                            addressController.ShowData();
                            Get.offNamed("/addAddress");
                          },
                        ),
                      ],
                    ),

                  ],
                ),
              ),

              SizedBox(height: 10),

              Container(
                padding: EdgeInsets.all(8),
                child: Column(
                  children: [
                    _buildCategorySection(
                      title: "Lainnya",
                      items: [
                        _buildMenuItem(
                          icon: CupertinoIcons.chat_bubble_text,
                          title: "Chat",
                          onTap: () {
                            Get.offNamed("/chat");
                          },
                        ),
                        _buildMenuItem(
                          icon: Icons.headset_mic_outlined,
                          title: "Pusat Bantuan",
                          onTap: () {
                            Get.offNamed("/cs");
                          },
                        ),
                        _buildMenuItem(
                          icon: Icons.logout,
                          title: "Log Out",
                          iconColor: ColorValue.kDanger,
                          textColor: ColorValue.kDanger,
                          showArrow: false,
                          onTap: () {
                            showLogoutConfirmationDialog(context);
                          },
                        ),
                      ],
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildCategorySection({
    required String title,
    required List<Widget> items,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 10),
          child: Text(
            title,
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        ...items,
      ],
    );
  }

  Widget _buildMenuItem({
    required IconData icon,
    required String title,
    required VoidCallback onTap,
    Color iconColor = ColorValue.kSecondary,
    Color textColor = Colors.black,
    bool showArrow = true,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 12, horizontal: 12),
        margin: EdgeInsets.symmetric(vertical: 4),
        decoration: BoxDecoration(
          color: ColorValue.kLightGrey.withOpacity(0.1),
          borderRadius: BorderRadius.circular(8),
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
                  child: Icon(icon, size: 22, color: iconColor),
                ),
                SizedBox(width: 12),
                Text(
                  title,
                  style: TextStyle(
                    fontSize: 14,
                    color: textColor,
                    fontWeight: FontWeight.w500,
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
    );
  }
}
