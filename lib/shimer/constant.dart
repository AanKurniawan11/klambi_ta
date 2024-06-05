// import 'package:flutter/material.dart';
//
// import '../Pages/home/allproductresponsemodel.dart';
//
// import '../Pages/home/allproductresponsemodel.dart';
// import '../Pages/home/components/recomend_product.dart';
//
// const Color primaryColor = Color(0xFF2967FF);
// const Color grayColor = Color(0xFF8D8D8E);
//
// const double defaultPadding = 16.0;
//
//
//
//
// Widget ProductGrid(List<Datum> itemList) {
//   return GridView.builder(
//     shrinkWrap: true,
//     physics: const NeverScrollableScrollPhysics(),
//     gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
//       crossAxisCount: 2,
//       mainAxisSpacing: 10,
//       crossAxisSpacing: 10,
//       childAspectRatio: 1 / 1.55,
//     ),
//     padding: const EdgeInsets.symmetric(horizontal: 10),
//     itemCount: itemList.length,
//     itemBuilder: (context, index) {
//       return RecomendProduct(context, itemList[index]);
//     },
//   );
// }