import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:klambi_ta/Common/colors/color.dart';
import 'package:klambi_ta/Pages/menuprofile/components/profile_controller.dart';
import 'package:klambi_ta/Pages/menuprofile/pages/address/controller/address_controller.dart';
import 'package:klambi_ta/Pages/menuprofile/pages/edit/controller/edit_controller.dart';
import 'package:klambi_ta/Pages/user/login/components/login_controller.dart';

class Profile extends StatelessWidget {
  Profile({super.key});

  final profileController = Get.put(ProfileController());
  final controller = Get.put(LoginController());
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
                await controller.logoutAction();
                if (Navigator.of(context).canPop()) {
                  Navigator.of(context).pop();

                }
                Get.offAllNamed("/login");
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
            () => profileController.isLoading.value
            ? Center(child: CircularProgressIndicator())
            : Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // Profile header container
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  ClipOval(
                    child: AnimatedSwitcher(
                      duration: Duration(milliseconds: 300),
                      child: Container(
                        height: height * 0.15,
                        width: width * 0.3,
                        key: ValueKey<String>(
                            editController.imageUrl.value ?? ''),
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: editController.pickedImage.value !=
                                null
                                ? FileImage(
                                editController.pickedImage.value!)
                                : editController.imageUrl.value !=
                                null
                                ? NetworkImage(editController
                                .imageUrl.value!)
                                : AssetImage(
                                "assets/images/banner/pro.png")
                            as ImageProvider,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 12),
                  Text(
                    editController.userProfile.value.name,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                      color: ColorValue.kPrimary,
                    ),
                  ),
                  SizedBox(height: 6),
                  Text(
                    profileController.email.value,
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.grey[700],
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20),
              // Menu sections
              Expanded(
                child: ListView(
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
                    SizedBox(height: 10),
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
              ),
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
    return Container(
      padding: EdgeInsets.all(12),
      margin: EdgeInsets.only(bottom: 16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 6,
            offset: Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: ColorValue.kPrimary,
            ),
          ),
          SizedBox(height: 10),
          Column(children: items),
        ],
      ),
    );
  }

  Widget _buildMenuItem({
    required IconData icon,
    required String title,
    required VoidCallback onTap,
    Color? iconColor,
    Color? textColor,
    bool showArrow = true,
  }) {
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 8),
        child: Row(
          children: [
            Icon(icon, color: iconColor ?? ColorValue.kPrimary),
            SizedBox(width: 16),
            Text(
              title,
              style: TextStyle(
                fontSize: 16,
                color: textColor ?? Colors.black,
              ),
            ),
            Spacer(),
            if (showArrow)
              Icon(Icons.arrow_forward_ios, color: Colors.grey[400], size: 16),
          ],
        ),
      ),
    );
  }
}
