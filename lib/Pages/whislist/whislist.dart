import 'package:flutter/material.dart';

import '../../component/component.dart';

class WhislistPage extends StatelessWidget {
   const WhislistPage({super.key});
  final int _currentIndex = 2;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:  SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 25,horizontal: 20),
              child: Row(
                children: [
                  Text('My Whislist',style: TextStyle(fontSize: 24,fontWeight: FontWeight.w500,),),
                  SizedBox(width: 10,),
                  Text("(no Item)",style: TextStyle(fontSize: 18),)
                ],
              ),
            )
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigation(currentIndex: _currentIndex),
    );
  }
}
