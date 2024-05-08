import 'package:flutter/material.dart';
import 'package:klambi_ta/component/product_card.dart';
import 'package:klambi_ta/models/product.dart';

class RecommendedProducts extends StatelessWidget {
  const RecommendedProducts({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25),
          child: Text(
            "Rekomendasi Penjual",
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25),
          child: Container(
            height: MediaQuery.of(context).size.width,
            width: MediaQuery.of(context).size.width,
            child: GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 150,
                crossAxisSpacing: 10,
              ),
              itemCount: demoProducts.length,
              itemBuilder: (context, index) {
                  return ProductCard(onPress: () {}, product: demoProducts[index]);
              },
            ),
          ),
        ),
      ],
    );
  }
}
