import 'package:flutter/material.dart';
import 'package:klambi_ta/Common/colors/color.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

class CartEmpty extends StatelessWidget {
  CartEmpty({super.key});


  @override
  Widget build(BuildContext context) {
    final double height = MediaQuery.of(context).size.height;
    final double width = MediaQuery.of(context).size.width;

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        // SizedBox(height: height * 0.2),
        Center(
          child: Column(
            children: [
              Container(
                height: height * 0.3,
                width: width * 0.8,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage("assets/cartEmpty.png"),
                  ),
                ),
              ),
              Text("Tidak ada barang di keranjang"),
            ],
          ),
        ),
      ],
    );
  }
}

