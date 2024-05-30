import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:klambi_ta/Pages/profile/profile_controller.dart';
import 'package:klambi_ta/color.dart';
import 'package:get/get.dart';
import 'package:klambi_ta/common/mytext.dart';
import 'package:klambi_ta/component/space_extension.dart';

class Profile extends StatelessWidget {
  Profile({super.key});
  final profileController = Get.put(ProfileController());

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
                // Perform logout action here
                profileController.logout();
                // Check if the context is still valid before popping
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
                    Container(
                      height: height * 0.13,
                      width: width * 0.32,
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage("assets/images/banner/pro.png"),
                              fit: BoxFit.cover
                          ),
                          shape: BoxShape.circle),
                    ),
                    const Text(
                      "Zidni PSHT",
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w600,
                          fontFamily: "General Sans"),
                    ),
                    txt(username: profileController.username.value),
                    const Padding(
                      padding: EdgeInsets.only(right: 280, top: 50),
                      child: Text(
                        "Menu",
                        style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w500,
                            fontFamily: "General Sans",
                            color: ColorValue.kDarkGrey),
                      ),
                    ),
                    const Divider(
                      thickness: 1,
                      indent: 25,
                      endIndent: 25,
                      color: ColorValue.kLightGrey,
                    ),
                    Padding(
                      padding:
                      const EdgeInsets.symmetric(vertical: 20, horizontal: 25),
                      child: Column(
                        children: [
                          GestureDetector(
                            onTap: () {
                              Get.offNamed("/edit");
                            },
                            child: Row(
                              children: [
                                const Icon(
                                  CupertinoIcons.person_alt_circle,
                                  size: 35,
                                  color: ColorValue.kPrimary,
                                ),
                                const Text(
                                  "Tentang Akun",
                                  style: TextStyle(fontSize: 16),
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
                                  color: ColorValue.kPrimary,
                                ),
                                const Text(
                                  "Chat",
                                  style: TextStyle(fontSize: 16),
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
                                  style: TextStyle(fontSize: 16),
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
                                const Icon(Icons.output_outlined,
                                    size: 35, color: ColorValue.kDanger),
                                const Text(
                                  "Log Out",
                                  style: TextStyle(
                                      fontSize: 16, color: ColorValue.kDanger),
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
        ));
  }
}