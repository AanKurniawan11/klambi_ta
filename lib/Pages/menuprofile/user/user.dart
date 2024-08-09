import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:klambi_ta/Common/colors/color.dart';
import 'package:klambi_ta/Pages/menuprofile/pages/edit/controller/edit_controller.dart';
import 'package:klambi_ta/component/my_elevatedbutton.dart';
import 'package:klambi_ta/component/mytext.dart';
import 'package:klambi_ta/component/space_extension.dart';
import 'package:get/get.dart';

class UserView extends StatelessWidget {
  const UserView({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(EditController());
    final Size mediaquery = MediaQuery.of(context).size;
    final double height = mediaquery.height;
    final double width = mediaquery.width;

    return Scaffold(
      appBar: AppBar(
        title: Text("Profile Saya", style: TextStyle(fontFamily: "General Sans")),
        leading: IconButton(
          onPressed: () {
            Get.offAllNamed("/navbar");
          },
          icon: Icon(CupertinoIcons.arrow_left),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.all(20),
            width: width * 0.98,
            child:
            Obx(()=>Column(
              children: [
                Container(
                  width: width * 0.3,
                  height: height * 0.155,
                  child: Stack(
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
                    ],
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Username",
                      style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                    ),
                    Container(
                      width: width * 0.85,
                      height: height * 0.055,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        border: Border.fromBorderSide(BorderSide(color: ColorValue.kDarkGrey)),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child:  txt(username: controller.ctrName.text.isNotEmpty ? controller.ctrName.text : controller.userProfile.value.name),
                      ),
                    ),

                  ],
                ),
                My_Button(
                  onclick: () {
                    Get.toNamed("/edit");
                  },
                  title: "Ubah Profile",
                ),
              ].withSpaceBetween(height: 30),
            ), )

          ),
        ),
      ),
    );
  }
}
