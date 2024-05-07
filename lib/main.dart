import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:klambi_ta/Pages/login/login.dart';
import 'package:klambi_ta/color.dart';
import 'package:klambi_ta/common/routes.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:animated_splash_screen/animated_splash_screen.dart';

import 'Pages/Register/register.dart';
import 'Pages/onboarding/onboarding_view.dart';

void main()async{
  WidgetsFlutterBinding.ensureInitialized();
  final prefs = await SharedPreferences.getInstance();
  final onboarding = prefs.getBool("onboardings")??false;
  runApp(MyApp(onboarding : onboarding,));
}

class MyApp extends StatelessWidget {
  final bool onboarding;
  const MyApp({super.key,this.onboarding = false});
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      getPages: pageRoutes,
      home: AnimatedSplashScreen(splash:
      Image.asset("assets/images/banner/klambi_logo.png"),
          duration: 300,
          splashTransition: SplashTransition.fadeTransition,
          backgroundColor: ColorValue.kPrimary,
          nextScreen: onboarding? Register() : OnboardingView()),
    );
  }
}

