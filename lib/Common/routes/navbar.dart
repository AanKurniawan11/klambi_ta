import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:klambi_ta/Pages/history/page/history.dart';
import 'package:klambi_ta/Pages/home/page/home.dart';
import 'package:klambi_ta/Pages/menuprofile/components/profile_controller.dart';
import 'package:klambi_ta/Pages/menuprofile/pages/menu_profile.dart';
import '../colors/color.dart';

class LandingPageController extends GetxController {
  var tabIndex = 0.obs;

  void changeTabIndex(int index) {
    print("Changing Tab Index to: $index");
    tabIndex.value = index;
  }
}

class LandingPage extends StatelessWidget {
  final profileController = Get.put(ProfileController());

  @override
  Widget build(BuildContext context) {
    final LandingPageController landingPageController = Get.put(LandingPageController());

    final args = Get.arguments;
    if (args != null && args is int) {
      print("Received argument: $args");
      landingPageController.changeTabIndex(args);

      // Clear arguments after using them
      Future.delayed(Duration.zero, () {
        Get.offNamed("/navbar");
      });
    }

    return SafeArea(
      child: Scaffold(
        bottomNavigationBar: buildBottomNavigationMenu(context, landingPageController),
        body: Obx(() {
          print("Current Tab Index: ${landingPageController.tabIndex.value}");
          return IndexedStack(
            index: landingPageController.tabIndex.value,
            children: [
              HomePageView(),
              HistoryPage(),
              Profile()
            ],
          );
        }),
      ),
    );
  }

  buildBottomNavigationMenu(context, landingPageController) {


    return Obx(() => MediaQuery(
      data: MediaQuery.of(context).copyWith(textScaleFactor: 1.0),
      child: SizedBox(
        height: 70,
        child: BottomNavigationBar(
          currentIndex: landingPageController.tabIndex.value,
          onTap: (index) {
            print("Bottom Navigation Item Clicked: $index");
            landingPageController.changeTabIndex(index);
          },
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.receipt_long_sharp),
              label: 'Riwayat',

            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: 'Profile',
            ),
          ],
          iconSize: 30,
          selectedItemColor: ColorValue.kPrimary,
          unselectedItemColor: ColorValue.kLightGrey,
        ),
      ),
    ));
  }
}
