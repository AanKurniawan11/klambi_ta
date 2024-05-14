import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../color.dart';
import 'package:flutter_svg/svg.dart';

class BottomBar extends StatelessWidget {
  final int currentIndex;

  const BottomBar({super.key, required this.currentIndex});

  void _onTap(int index) {
    switch (index) {
      case 0:
        Get.offNamed("/home"); // Navigate to home route
        break;
      case 1:
        Get.offNamed("/history");
        break;
      case 2:
        Get.offNamed("/whislist");
        break;
      case 3:
        Get.offNamed("/chat");
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: currentIndex,
      onTap: _onTap,
      items: [
        BottomNavigationBarItem(
          icon: SvgPicture.asset('assets/icons/home.svg'),
          label: 'Home',
        ),
        BottomNavigationBarItem(
          icon: SvgPicture.asset('assets/icons/receipt.svg'),
          label: 'Riwayat',
        ),
        BottomNavigationBarItem(
          icon: SvgPicture.asset('assets/icons/wishlist.svg'),
          label: 'Wishlist',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.person),
          label: 'Profile',
        ),
      ],
      iconSize: 30,
      selectedItemColor: ColorValue.kPrimary,
      unselectedItemColor: ColorValue.kLightGrey,
    );
  }
}
