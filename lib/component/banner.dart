import 'package:flutter/material.dart';

class Banner {
  final int id;
  final String banner;

  Banner({
    required this.id,
    required this.banner,
  });
}

// Our demo Products
List<Banner> CarouselImage = [
  Banner(
    id: 1,
    banner: "assets/images/banner/dsc_banner1.png",
  ),
  Banner(
    id: 2,
    banner: "assets/images/banner/dsc_banner2.png",
  ),
  Banner(
    id: 3,
    banner: "assets/images/banner/dsc_banner3.png",
  ),
  Banner(
    id: 4,
    banner: "assets/images/banner/dsc_banner4.png",
  ),
];
