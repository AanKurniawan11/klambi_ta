import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:klambi_ta/Common/colors/color.dart';
import 'package:get/get.dart';
import 'package:klambi_ta/Pages/user/register/components/register_controller.dart';
import 'package:klambi_ta/component/loadinfanimation.dart';
import 'package:klambi_ta/component/my_elevatedbutton.dart';
import 'package:klambi_ta/component/my_textfield.dart';
import 'package:klambi_ta/component/pass_textfield.dart';
import 'package:klambi_ta/component/space_extension.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

class Register extends StatelessWidget {
  Register({super.key});

  final registerController = Get.put(RegisterController());
  final TextEditingController ctrUsername = TextEditingController();
  final TextEditingController ctrName = TextEditingController();
  final TextEditingController ctrPassword = TextEditingController();
  final TextEditingController ctrConfirmPass = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final Size mediaquery = MediaQuery.of(context).size;
    final double height = mediaquery.height;
    final double width = mediaquery.width;

    registerController.checkIfRegistered().then((isRegistered) {
      if (isRegistered) {
        Get.offAllNamed('/navbar');
      }
    });

    return Scaffold(
      body: SafeArea(
        child: Obx(() => registerController.isLoading.value
            ?  Center(child:Loading()) // Tampilan loading
            : SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Stack(
            children: [
              Column(
                children: [
                  const SizedBox(height: 100),
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
                    "Daftar",
                    style: TextStyle(
                        fontSize: 32,
                        fontFamily: "General Sans",
                        color: ColorValue.kPrimary),
                  ),
                  Container(
                    margin: const EdgeInsets.all(10.0),
                    width: width * 0.8,
                    child: Column(
                      children: [
                        MyTextField(
                            label: "Username",
                            hint: "",
                            prefixIcon: Icons.person_outline,
                            controller: ctrUsername,
                            validationMessage: 'Username Tidak Boleh Kosong'),
                        MyTextField(
                            label: "Name",
                            hint: "",
                            prefixIcon: Icons.person_outline,
                            controller: ctrName,
                            validationMessage: 'Name Tidak Boleh Kosong'),
                        PassTextField(
                          hint: "",
                          label: "Password",
                          prefixIcon: Icons.lock_outline,
                          controller: ctrPassword,
                        ),
                        PassTextField(
                          hint: "",
                          label: "Confirm Password",
                          prefixIcon: Icons.lock_outline,
                          controller: ctrConfirmPass,
                        ),
                      ].withSpaceBetween(height: 15),
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 40),
                    child: My_Button(
                      title: "Daftar",
                      onclick: () {
                        registerController.registerAction(
                          ctrUsername.text,
                          ctrName.text,
                          ctrPassword.text,
                          ctrConfirmPass.text,
                        );
                      },
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        "sudah punya akun ?",
                        style: TextStyle(
                            fontSize: 14, fontWeight: FontWeight.w400),
                      ),
                      GestureDetector(
                        onTap: () {
                          Get.toNamed("/login");
                        },
                        child: const Text(
                          " Login",
                          style: TextStyle(
                              color: ColorValue.kSecondary,
                              fontSize: 14,
                              fontWeight: FontWeight.w600),
                        ),
                      )
                    ],
                  )
                ].withSpaceBetween(height: 25),
              ),
              Positioned(
                top: 0,
                right: 0,
                child: Image.asset("assets/images/banner/dec4.png"),
              ),
            ],
          ),
        )),
      ),
    );
  }
}
