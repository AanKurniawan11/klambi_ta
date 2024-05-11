import 'package:flutter/material.dart';
import '../../component/navbar.dart';

class WhislistPage extends StatelessWidget {
  const WhislistPage({super.key});
  final int _currentIndex = 2;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: const SafeArea(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(vertical: 25, horizontal: 20),
              child: Row(
                children: [
                  Text(
                    'My Whislist',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Text(
                    "(no Item)",
                    style: TextStyle(fontSize: 18),
                  )
                ],
              ),
            )
          ],
        ),
      ),
      bottomNavigationBar: BottomBar(currentIndex: _currentIndex),
    );
  }
}
