import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:klambi_ta/color.dart';
import 'package:klambi_ta/component/component.dart';
import 'package:get/get.dart';

class Register extends StatelessWidget {
  const Register({super.key});

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
                  SizedBox(
                    height: 150,
                  ),
                  Center(
                    child: Container(
                      height: height * 0.1,
                      width: width * 0.5,
                      foregroundDecoration: BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage("assets/images/banner/Logo1.png"))),
                    ),
                  ),
                  Text(
                    "Daftar",
                    style: TextStyle(fontSize: 32, fontWeight: FontWeight.w500),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Column(
                    children: [
                      Container(
                        margin: EdgeInsets.all(10.0),
                        width: width * 0.85,
                        child: Column(
                          children: [
                            texttest(
                                "Username", "Username", Icons.person_outlined),
                            texttest("Email", "Email", Icons.email_outlined),
                            PasswordTest(
                              hint: "Password",
                              label: "Password",
                              prefixIcon: Icons.lock_outline,
                            ),
                            PasswordTest(
                              hint: "Password",
                              label: "Confirm Password",
                              prefixIcon: Icons.lock_outline,
                            ),
                          ].withSpaceBetween(height: 15),
                        ),
                      ),
                      elevatedbutton(title: "Daftar",onclick: (){
                        Get.toNamed("/home");
                      },),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "sudah punya akun ?",
                            style: TextStyle(
                                fontSize: 14, fontWeight: FontWeight.w400),
                          ),
                          GestureDetector(
                            onTap: () {
                              Get.toNamed("/login");
                            },
                            child: Text(
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
                ],
              ),
              Positioned(
                top: 0,
                right: 0,
                child: Image.asset("assets/images/banner/dec4.png"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
