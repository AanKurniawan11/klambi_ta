import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

import '../../color.dart';
import '../../component/component.dart';

class Login extends StatelessWidget {
  const Login({super.key});

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
                    "Masuk",
                    style: TextStyle(fontSize: 32, fontWeight: FontWeight.w500),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Column(
                    children: [
                      Container(
                        // padding: EdgeInsets.all(1),
                        margin: EdgeInsets.all(10.0),
                        width: width * 0.85,
                        child: Column(
                          children: [
                            texttest(
                                "@example.com", "Email", Icons.email_outlined),
                            SizedBox(
                              height: 15,
                            ),
                            PasswordTest(
                              hint: "Password",
                              label: "Password",
                              prefixIcon: Icons.lock_outline,
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 10),
                        child: elevatedbutton(onclick: (){
                          Get.toNamed("/home");
                        }, title: 'Mulai',),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 35.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Expanded(
                              child: Divider(
                                thickness: 1, // Adjust thickness as needed
                                color: ColorValue.kLightGrey,
                              ),
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 25.0),
                              child: Text(
                                "Atau masuk dengan",
                                style: TextStyle(
                                  fontWeight: FontWeight.w400,
                                  fontSize: 14,
                                ),
                              ),
                            ),
                            Expanded(
                              child: Divider(
                                thickness: 1, // Adjust thickness as needed
                                color: ColorValue.kLightGrey,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            GestureDetector(
                              onTap: () {},
                              child: Container(
                                padding: EdgeInsets.all(20),
                                height: height * 0.08,
                                width: width * 0.16,
                                decoration: BoxDecoration(
                                    border: Border.all(color: Colors.white),
                                    borderRadius: BorderRadius.circular(16),
                                    color: Colors.grey[200]),
                                child: Image.asset(
                                  "assets/images/banner/Google_Icon.png",
                                  height: 10,
                                ),
                              ),
                            ),
                            GestureDetector(
                              onTap: () {},
                              child: Container(
                                padding: EdgeInsets.all(20),
                                height: height * 0.08,
                                width: width * 0.16,
                                decoration: BoxDecoration(
                                    border: Border.all(color: Colors.white),
                                    borderRadius: BorderRadius.circular(16),
                                    color: Colors.grey[200]),
                                child: Image.asset(
                                  "assets/images/banner/Facebook_Icon.png",
                                ),
                              ),
                            ),
                          ].withSpaceBetween(width: 30),
                        ),
                      ),
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
                              Get.toNamed("/register");
                            },
                            child: Text(
                              " Daftar",
                              style: TextStyle(
                                  color: ColorValue.kSecondary,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w600),
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
        ),
      ),
    );
  }
}
