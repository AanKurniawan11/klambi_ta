import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:klambi_ta/Common/colors/color.dart';
import 'package:klambi_ta/Pages/user/login/components/login_controller.dart';
import 'package:klambi_ta/Pages/user/login/components/toast_message.dart';
import 'package:klambi_ta/component/loadinfanimation.dart';
import 'package:klambi_ta/component/my_elevatedbutton.dart';
import 'package:klambi_ta/component/my_textfield.dart';
import 'package:klambi_ta/component/pass_textfield.dart';
import 'package:klambi_ta/component/space_extension.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final loginController = Get.put(LoginController());
  final TextEditingController ctrUsername = TextEditingController();
  final TextEditingController ctrPassword = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final Size mediaquery = MediaQuery.of(context).size;
    final double height = mediaquery.height;
    final double width = mediaquery.width;

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Stack(
            children: [
              Column(
                children: [
                  const SizedBox(height: 150),
                  Center(
                    child: Container(
                      height: height * 0.1,
                      width: width * 0.5,
                      foregroundDecoration: const BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage("assets/images/banner/Logo1.png"),
                        ),
                      ),
                    ),
                  ),
                  const Text(
                    "Masuk",
                    style: TextStyle(
                        fontSize: 32,
                        fontFamily: "General Sans",
                        color: ColorValue.kPrimary),
                  ),
                  const SizedBox(height: 20),
                  Column(
                    children: [
                      Container(
                        margin: const EdgeInsets.all(10.0),
                        width: width * 0.8,
                        child: Column(
                          children: [
                            MyTextField(
                              hint: "",
                              label: "Username",
                              prefixIcon: Icons.person_outline,
                              controller: ctrUsername,
                              validationMessage: 'Username Tidak Boleh Kosong',
                            ),
                            const SizedBox(height: 15),
                            PassTextField(
                              hint: "",
                              label: "Password",
                              prefixIcon: Icons.lock_outline,
                              controller: ctrPassword,
                            ),
                          ],
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 40),
                        child: My_Button(
                          onclick: () async {
                            await loginController.loginAction(
                              ctrUsername.text,
                              ctrPassword.text,
                            );
                          },
                          title: 'Mulai',
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text(
                            "Belum punya akun ?",
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              Get.toNamed("/register");
                            },
                            child: const Text(
                              " Daftar",
                              style: TextStyle(
                                color: ColorValue.kSecondary,
                                fontSize: 14,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          )
                        ],
                      ),
                    ].withSpaceBetween(height: 20),
                  ),
                ],
              ),
              Align(
                alignment: Alignment.topRight,
                child: Image.asset("assets/images/banner/dec4.png"),
              ),
            ],
          ),
        )),
    );
  }
}
