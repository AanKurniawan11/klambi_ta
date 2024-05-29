import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

import '../../../component/banner.dart';

class Carousel extends StatelessWidget {
  const Carousel({Key? key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: CarouselSlider(
        options: CarouselOptions(
          autoPlay: true,
          aspectRatio: 2.0,
          enlargeCenterPage: true,
        ),
        items: CarouselImage.map((banner) {
          return Container(
            child: Container(
              margin: EdgeInsets.all(1.5),
              child: ClipRRect(
                borderRadius: BorderRadius.all(Radius.circular(5.0)),
                child: Image.asset(
                  banner.banner,
                  fit: BoxFit.cover,
                  width: 1000.0,
                ),
              ),
            ),
          );
        }).toList(),
      ),
    );
  }
}