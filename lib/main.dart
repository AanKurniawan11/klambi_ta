import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:klambi_ta/Pages/login/components/login_controller.dart';
import 'package:klambi_ta/color.dart';
import 'package:klambi_ta/common/routes.dart';
import 'package:klambi_ta/common/navbar.dart';
import 'package:klambi_ta/firebase_options.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'Pages/onboarding/onboarding_view.dart';
import 'Pages/login/page/login.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  final prefs = await SharedPreferences.getInstance();
  final onboarding = prefs.getBool("onboarding") ?? false;
  final isLoggedIn = prefs.containsKey('username') || FirebaseAuth.instance.currentUser != null;

  final controller = Get.put(LoginController());  // Pindahkan ke sini setelah Firebase diinisialisasi

  runApp(MyApp(
    onboarding: onboarding,
    isLoggedIn: isLoggedIn,
  ));
}

class MyApp extends StatelessWidget {
  final bool onboarding;
  final bool isLoggedIn;

  const MyApp({super.key, this.onboarding = false, this.isLoggedIn = false});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.white),
          useMaterial3: true,
          appBarTheme: const AppBarTheme(
            surfaceTintColor: Colors.white,
            color: Colors.transparent,
          ),
          tabBarTheme: TabBarTheme(
            indicatorColor: Colors.red,
            labelColor: Colors.red,
            dividerColor: Colors.transparent,
            labelStyle: TextStyle(fontSize: 14),
            overlayColor: MaterialStatePropertyAll(Colors.transparent),
          ),
          elevatedButtonTheme: ElevatedButtonThemeData(
              style: ButtonStyle(
                  backgroundColor: MaterialStatePropertyAll(Colors.red)
              )
          )
      ),
      getPages: pageRoutes,
      home: AnimatedSplashScreen(
        splash: ("assets/images/banner/klambi_logo.png"),
        duration: 300,
        splashTransition: SplashTransition.fadeTransition,
        backgroundColor: ColorValue.kPrimary,
        nextScreen: _getNextScreen(),
      ),
    );
  }

  Widget _getNextScreen() {
    if (onboarding) {
      if (isLoggedIn) {
        return LandingPage();
      } else {
        return Login();
      }
    } else {
      return OnboardingView();
    }
  }
}
