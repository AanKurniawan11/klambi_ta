import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:klambi_ta/color.dart';
import 'package:klambi_ta/common/routes.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:animated_splash_screen/animated_splash_screen.dart';

import 'Pages/Register/register.dart';
import 'Pages/onboarding/onboarding_view.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final prefs = await SharedPreferences.getInstance();
  final onboarding = prefs.getBool("onboarding") ?? false;
  runApp(MyApp(
    onboarding: onboarding,
  ));
}

class MyApp extends StatelessWidget {
  final bool onboarding;
  const MyApp({super.key, this.onboarding = false});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.white),
        appBarTheme: const AppBarTheme(
          surfaceTintColor: Colors.white
        ),
        tabBarTheme: TabBarTheme(indicatorColor: Colors.red,labelColor: Colors.red,dividerColor: Colors.transparent,labelStyle: TextStyle(fontSize: 14),overlayColor: MaterialStatePropertyAll(Colors.transparent)),
        useMaterial3: true,
      ),
      getPages: pageRoutes,
      home: AnimatedSplashScreen(
          splash: Image.asset("assets/Logo.png"),
          duration: 300,
          splashTransition: SplashTransition.fadeTransition,
          backgroundColor: ColorValue.kPrimary,
          nextScreen: onboarding ? Register() : OnboardingView()
      ),

      // home: LandingPage(),

    );
  }
}
