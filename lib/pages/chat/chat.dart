import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:klambi_ta/color.dart';
import 'package:klambi_ta/Pages/chat/components/chat_textfield.dart';
import 'package:get/get.dart';

class ChatPage extends StatelessWidget {
  const ChatPage({super.key});

  @override
  Widget build(BuildContext context) {
    final Size mediaquery = MediaQuery.of(context).size;
    final double height = mediaquery.height;
    final double width = mediaquery.width;

    return Scaffold(
      appBar: AppBar(
        // leading: Image.asset("/assets/images/banner/Logo1.png"),
        leading: GestureDetector(
          child: const Icon(
            Icons.arrow_back_outlined,
            size: 30,
          ),
          onTap: () {
            Get.offNamed("/navbar");
          },
        ),
        title: Row(
          children: [
            ClipOval(
              child: Container(
                height: height * 1,
                width: width * 0.095,
                foregroundDecoration: const BoxDecoration(
                    image: DecorationImage(
                        image:
                            AssetImage("assets/images/banner/chat_logo.png"))),
              ),
            ),
            const SizedBox(
              width: 10,
            ),
            const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Klambi",
                  style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                      fontFamily: "General Sans"),
                ),
                Text(
                  "Active now",
                  style: TextStyle(fontSize: 12, color: ColorValue.kDarkGrey),
                ),
              ],
            )
          ],
        ),
        backgroundColor: ColorValue.kLightGrey,
      ),
      body: SafeArea(child: Container()),
      bottomSheet: Container(
        height: height * 0.12,
        width: width * 1,
        // color: Colors.red,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              const Icon(
                Icons.link,
                color: ColorValue.kSecondary,
              ),
              Container(
                  height: height * 0.09,
                  width: width * 0.58,
                  child: ChatTextField(
                    hintText: "Masukkan Pesan",
                    suffixIcon: Icons.send,
                  )),
              const Icon(
                CupertinoIcons.camera,
                color: ColorValue.kSecondary,
              ),
              const Icon(
                CupertinoIcons.mic,
                color: ColorValue.kSecondary,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
