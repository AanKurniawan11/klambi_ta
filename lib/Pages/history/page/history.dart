import 'package:flutter/material.dart';
import 'package:klambi_ta/Common/colors/color.dart';

class HistoryPage extends StatelessWidget {
  const HistoryPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 30),
              child: Text(
                "Riwayat",
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.w500),
              ),
            ),
            DefaultTabController(
              length: 2,
              child: Column(
                children: [
                  const TabBar(
                    labelColor: ColorValue.kPrimary,
                    unselectedLabelColor: Colors.black,
                    indicatorColor: ColorValue.kPrimary,
                    tabs: [
                      Tab(text: 'Sedang diproses'),
                      Tab(text: 'Selesai Dipesan'),
                    ],
                  ),
                  const SizedBox(height: 20),
                  Container(
                    height: 200,
                    child: TabBarView(
                      children: [
                        SingleChildScrollView(
                          child: Column(
                            children: [
                              Container(
                                child: Text('Proses'),
                              ),
                            ],
                          ),
                        ),
                        SingleChildScrollView(
                          child: Column(
                            children: [
                              Container(
                                child: const Text('Selesai'),
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
      ),
    );
  }
}
