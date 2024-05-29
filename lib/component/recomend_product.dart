import 'package:flutter/material.dart';
import 'package:klambi_ta/color.dart';
import 'package:klambi_ta/component/space_extension.dart';
import 'package:get/get.dart';
import '../model/model.dart';


Widget RecomendProduct(
    BuildContext context,
    Product item,
    ) {
  final size = MediaQuery.of(context).size;

  return GestureDetector(
    onTap: (){
      Get.toNamed("/detail",arguments: [
        {"first": item},
      ]);
    },
    child: Container(
      height: size.height * 0.9,
      width: size.width * 0.5,
      decoration: BoxDecoration(
          border: Border.all(color: ColorValue.kLightGrey),
          borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                Container(
                  width: size.width *   0.5,
                  height: size.height * 0.17,
                  foregroundDecoration: BoxDecoration(
                      image: DecorationImage(image: AssetImage(item.image))),
                ),
                Positioned(
                    right: 0,
                    top: 0,
                    child: Container(
                      width:size.width * 0.2 ,
                      height: size.height * 0.03,
                      decoration: BoxDecoration(
                          color: ColorValue.kSecondary,
                          borderRadius: BorderRadius.circular(10)),
                      child: Center(
                          child: Text(item.category, style: TextStyle(color: Colors.white,fontSize: 9,fontWeight: FontWeight.w500,fontFamily: "General Sans"))),
                    ))
              ],
            ),
            SizedBox(
              height: size.height * 0.02,
            ),
            Text(
              item.title,
              style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500,fontFamily: "General Sans"),maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
            SizedBox(
              height: size.height * 0.005,
            ),
            Text(
              "Rp ${item.price}",
              style: TextStyle(fontSize: 16,fontWeight: FontWeight.w600,fontFamily: "General Sans"),
            ),
            SizedBox(
              height: size.height * 0.005,
            ),
            Row(
              children: [
                Row(
                  children: [
                    Icon(
                      Icons.star,
                      size: 14,
                      color: ColorValue.kPrimary,
                    ),
                    Text(item.rating.toString(),style: TextStyle(color: ColorValue.kDarkGrey,fontSize: 12,fontFamily: "General Sans"),),
                  ],
                ),
                Text('|',style: TextStyle(color: ColorValue.kDarkGrey,fontWeight: FontWeight.w500,fontSize: 16),),
                Text("Stock ${item.stock.toString()}",style: TextStyle(fontSize: 12,color: ColorValue.kDarkGrey,fontFamily: "General Sans"),),
                Text('|',style: TextStyle(color: ColorValue.kDarkGrey,fontWeight: FontWeight.w500,fontSize: 16),),
                Text("Terjual ${item.saled.toString()}",style: TextStyle(fontSize: 12,color: ColorValue.kDarkGrey,fontFamily: "General Sans"),),
              ].withSpaceBetween(width: 4),
            ),
          ],
        ),
      ),
    ),
  );
}

Widget ProductCard(List<Product> itemList) {
  return GridView.builder(
    shrinkWrap: true,
    physics: const NeverScrollableScrollPhysics(),
    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
      crossAxisCount: 2,
      mainAxisSpacing: 10,
      crossAxisSpacing: 10,
      childAspectRatio: 1 / 1.55,
    ),
    padding: const EdgeInsets.symmetric(horizontal: 10),
    itemCount: itemList.length,
    itemBuilder: (context, index) {
      return RecomendProduct(context, itemList[index]);
    },
  );
}