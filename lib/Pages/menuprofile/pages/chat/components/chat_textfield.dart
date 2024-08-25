import 'package:flutter/material.dart';
import 'package:klambi_ta/common/colors/color.dart';
import 'package:get/get.dart';
import '../controller/chat_controller.dart';


class ChatTextField extends StatelessWidget {
  final String hintText;
  final IconData? suffixIcon;
  final ChatController chatController = Get.put(ChatController());

  ChatTextField({
    Key? key,
    required this.hintText,
    this.suffixIcon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size mediaquery = MediaQuery.of(context).size;
    final double height = mediaquery.height;
    final double width = mediaquery.width;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 5.0),
      child: SizedBox(
        width: width * 0.89,
        child: TextField(
          style: const TextStyle(color: Colors.black, fontSize: 16.0),
          decoration: InputDecoration(
            contentPadding:
            const EdgeInsets.symmetric(vertical: 16.0, horizontal: 20.0),
            enabledBorder: OutlineInputBorder(
              borderSide: const BorderSide(color: ColorValue.kLightGrey),
              borderRadius: BorderRadius.circular(10.0),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: const BorderSide(color: ColorValue.kSecondary),
              borderRadius: BorderRadius.circular(10.0),
            ),
            filled: true,
            fillColor: Colors.transparent,
            hintText: hintText,
            hintStyle: const TextStyle(color: ColorValue.kDarkGrey),
            suffixIcon: suffixIcon != null
                ? GestureDetector(
              child: Icon(
                suffixIcon,
                color: ColorValue.kDanger,
              ),
              onTap: () {
                chatController.sendchat(1); // contoh id receiver
              },
            )
                : null,
          ),
          onChanged: (value) {
            chatController.message.value = value;
          },
        ),
      ),
    );
  }
}
