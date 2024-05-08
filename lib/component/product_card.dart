import 'package:flutter/material.dart';
import 'package:klambi_ta/color.dart';
import 'package:klambi_ta/models/product.dart';

class ProductCard extends StatelessWidget {
  const ProductCard(
      {required this.onPress,
      required this.product,
      this.width = 140,
      this.aspectRatio = 1.02,
      super.key});

  final VoidCallback onPress;
  final Product product;
  final double width, aspectRatio;

  @override
  Widget build(BuildContext context) {
    final Size mediaquery = MediaQuery.of(context).size;
    final double height = mediaquery.height;
    final double width = mediaquery.width;
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(vertical: 20),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                    width: width / 2.5,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(10),
                        topRight: Radius.circular(10),
                      ),
                      color: Color(0xFFF5F5F5),
                      border: Border(
                        top: BorderSide(
                            width: 1.0, color: ColorValue.kLightGrey),
                        right: BorderSide(
                            width: 1.0, color: ColorValue.kLightGrey),
                        left: BorderSide(
                            width: 1.0, color: ColorValue.kLightGrey),
                      ),
                    ),
                    child: Stack(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(20),
                          child: Image.asset(
                            product.image,
                            width: width / 4,
                            height: height / 5.5,
                          ),
                        ),
                        Positioned(
                          top: 10,
                          right: 10,
                          child: Container(
                            padding: EdgeInsets.all(5),
                            decoration: BoxDecoration(
                              color: ColorValue.kSecondary,
                              borderRadius: BorderRadius.circular(5),
                            ),
                            child: Text(
                              product.category,
                              style: TextStyle(
                                fontFamily: 'General Sans',
                                color: Colors.white,
                                fontSize: 10,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                    width: width / 2.5,
                    height: height / 5.5,
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(10),
                        bottomRight: Radius.circular(10),
                      ),
                      border: Border(
                        right: BorderSide(
                            width: 1.0, color: ColorValue.kLightGrey),
                        left: BorderSide(
                            width: 1.0, color: ColorValue.kLightGrey),
                        bottom: BorderSide(
                            width: 1.0, color: ColorValue.kLightGrey),
                      ),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          product.title,
                          style: TextStyle(
                            fontFamily: 'General Sans',
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        Text(
                          'Rp. ${product.price}',
                          style: TextStyle(
                            fontFamily: 'General Sans',
                            fontSize: 18,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        SizedBox(height: 5),
                        Row(
                          children: [
                            Icon(
                              Icons.star,
                              size: 14,
                              color: ColorValue.kPrimary,
                            ),
                            Text(
                              '4.5 | 20 Stok | 10 Terjual',
                              style: TextStyle(
                                  fontFamily: 'General Sans',
                                  fontWeight: FontWeight.w500,
                                  fontSize: 10,
                                  color: ColorValue.kDarkGrey),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}
