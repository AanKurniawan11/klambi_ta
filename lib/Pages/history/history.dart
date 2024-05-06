
import 'package:flutter/material.dart';

import '../../color.dart';
import '../../component/component.dart';

class HistoryPage extends StatelessWidget {
   HistoryPage({super.key});
  int _currentIndex = 1;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 30),
            child: Text("Riwayat",style: TextStyle(fontSize: 25,fontWeight: FontWeight.w500),),
          ),
          DefaultTabController(
            length: 2,
            child: Column(
              children: [
                TabBar(
                  tabs: [
                    Tab(text: 'Sedang diproses'),
                    Tab(text: 'Selesai Dipesan'),
                  ],
                  labelColor: ColorValue.kPrimary,
                  unselectedLabelColor: Colors.black,
                  indicatorColor: ColorValue.kPrimary,
                ),
                SizedBox(height: 20),
                Container(
                  height: 200,
                  child: TabBarView(
                    children: [
                      SingleChildScrollView(
                        child: Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text("nfsakj",style: TextStyle(
                                color: Colors.white,
                                fontSize: 14,
                              ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: bottomNavbar(context, _currentIndex),

    );
  }
}
