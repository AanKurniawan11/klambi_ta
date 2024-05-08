import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../color.dart';

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
          icon: Icon(Icons.chat),
          label: 'Chat',
        ),
      ],
      iconSize: 30,
      selectedItemColor: ColorValue.kPrimary,
      unselectedItemColor: ColorValue.kLightGrey,
    );
  }
}
