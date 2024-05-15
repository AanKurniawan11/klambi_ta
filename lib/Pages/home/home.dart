
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


import '../../component/carousel.dart';
import '../../component/category_tabs.dart';
import '../../component/header.dart';
import '../../component/recomend_product.dart';
import '../../component/search_field.dart';
import '../../model/model.dart';

class HomePageView extends StatelessWidget {
  const HomePageView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView(
          padding: EdgeInsets.symmetric(vertical: 25),
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Header(),
                SizedBox(height: 25),
                Carousel(),
                SizedBox(height: 25),
                SearchField(),
                SizedBox(height: 10),
                CategoryTabs(),
                SizedBox(height: 15),
                ProductCard(demoProducts),
              ],
            )
          ],
        ),
      ),
    );
  }
}