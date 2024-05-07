import 'package:flutter/material.dart';

import '../../component/component.dart';

class WhislistPage extends StatelessWidget {
   const WhislistPage({super.key});
  final int _currentIndex = 2;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: const Column(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(vertical: 25,horizontal: 25),
            child: Text('My Whislist',style: TextStyle(fontSize: 24,fontWeight: FontWeight.w500,),),
          )
        ],
      ),
      bottomNavigationBar: BottomNavigation(currentIndex: _currentIndex),
    );
  }
}
