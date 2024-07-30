import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:klambi_ta/Pages/login/components/login_controller.dart';
import 'package:klambi_ta/Pages/login/components/toast_message.dart';
import 'package:klambi_ta/color.dart';
import 'package:klambi_ta/component/my_elevatedbutton.dart';
import 'package:klambi_ta/component/my_textfield.dart';
import 'package:klambi_ta/component/pass_textfield.dart';
import 'package:klambi_ta/component/space_extension.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final loginController = Get.put(LoginController());
  final TextEditingController ctrEmail = TextEditingController();
  final TextEditingController ctrPassword = TextEditingController();

  Future<void> signinWithGoogle() async {
    FirebaseAuth auth = FirebaseAuth.instance;
    final GoogleSignIn googleSignIn = GoogleSignIn();
    try {
      final GoogleSignInAccount? googleUser = await googleSignIn.signIn();

      if (googleUser != null) {
        final GoogleSignInAuthentication googleAuth = await googleUser.authentication;
        final AuthCredential credential = GoogleAuthProvider.credential(
          accessToken: googleAuth.accessToken,
          idToken: googleAuth.idToken,
        );

        final UserCredential userCredential = await auth.signInWithCredential(credential);
        loginController.setUser(userCredential.user); // Update the user in the controller
        Get.offAllNamed("/navbar");
      }
    } catch (e) {
      ToastMessage.show('Login gagal. Silakan coba lagi.');
    }
  }
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
                    style: TextStyle(fontSize: 32, fontWeight: FontWeight.w500),
                  ),
                  const SizedBox(height: 20),
                  Column(
                    children: [
                      Container(
                        margin: EdgeInsets.all(10.0),
                        width: width * 0.85,
                        child: Column(
                          children: [
                            MyTextField(
                              hint: "@example.com",
                              label: "Email",
                              prefixIcon: Icons.email_outlined,
                              controller: ctrEmail,
                            ),
                            const SizedBox(height: 15),
                            PassTextField(
                              hint: "Password",
                              label: "Password",
                              prefixIcon: Icons.lock_outline,
                              controller: ctrPassword,
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 10),
                        child: My_Button(
                          onclick: () {
                            loginController.loginAction(
                              ctrEmail.text,
                              ctrPassword.text,
                            );
                            // Get.offAllNamed("/navbar");
                          },
                          title: 'Mulai',
                        ),
                      ),
                      const Padding(
                        padding: EdgeInsets.symmetric(horizontal: 35.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Expanded(
                              child: Divider(
                                thickness: 1,
                                color: ColorValue.kLightGrey,
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.symmetric(horizontal: 25.0),
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
                                thickness: 1,
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
                              onTap: () {
                                signinWithGoogle();
                              },
                              child: Container(
                                padding: const EdgeInsets.all(20),
                                height: height * 0.08,
                                width: width * 0.16,
                                decoration: BoxDecoration(
                                  border: Border.all(color: Colors.white),
                                  borderRadius: BorderRadius.circular(16),
                                  color: Colors.grey[200],
                                ),
                                child: Image.asset(
                                  "assets/images/banner/Google_Icon.png",
                                  height: 10,
                                ),
                              ),
                            ),
                            GestureDetector(
                              onTap: () {
                                // Handle Facebook Sign-In
                              },
                              child: Container(
                                padding: const EdgeInsets.all(20),
                                height: height * 0.08,
                                width: width * 0.16,
                                decoration: BoxDecoration(
                                  border: Border.all(color: Colors.white),
                                  borderRadius: BorderRadius.circular(16),
                                  color: Colors.grey[200],
                                ),
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
                          const Text(
                            "sudah punya akun ?",
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
        ),
      ),
    );
  }
}
