import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:klambi_ta/Pages/history/history.dart';
import 'package:klambi_ta/Pages/home/home.dart';
import 'package:klambi_ta/Pages/whislist/whislist.dart';
import 'package:klambi_ta/profile/profile.dart';

import '../color.dart';

class LandingPageController extends GetxController {
  var tabIndex = 0.obs;

  void changeTabIndex(int index) {
    tabIndex.value = index;
  }
  @override
  void onInit() {
    super.onInit();
  }
  @override
  void dispose() {
    super.dispose();
  }
}

class LandingPage extends StatelessWidget {
  buildBottomNavigationMenu(context, landingPageController) {
    return Obx(() => MediaQuery(
        data: MediaQuery.of(context).copyWith(textScaleFactor: 1.0),
        child: SizedBox(

          height: 70,
          child: BottomNavigationBar(
            currentIndex: landingPageController.tabIndex.value,
            onTap: landingPageController.changeTabIndex,
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
                icon: Icon(Icons.bookmark),
                label: 'Whislist',
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
        )));
  }

  @override
  Widget build(BuildContext context) {
    final LandingPageController landingPageController =
        Get.put(LandingPageController(), permanent: false);

    final args = Get.arguments;
    if (args != null && args is int) {
      landingPageController.changeTabIndex(args);
    }
    return SafeArea(
        child: Scaffold(
      bottomNavigationBar:
          buildBottomNavigationMenu(context, landingPageController),
      body: Obx(() => IndexedStack(
            index: landingPageController.tabIndex.value,
            children: [
              HomePageView(),
              HistoryPage(),
              WhislistPage(),
              Profile()
            ],
          )),
    ));
  }
}
