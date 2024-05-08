import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:klambi_ta/Pages/home/components/carousel.dart';
import 'package:klambi_ta/Pages/home/components/category_tabs.dart';
import 'package:klambi_ta/Pages/home/components/header.dart';
import 'package:klambi_ta/Pages/home/components/recommended_products.dart';
import 'package:klambi_ta/Pages/home/components/search_field.dart';

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
                RecommendedProducts(),
              ],
            )
          ],
        ),
      ),
    );
  }
}
