
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:klambi_ta/color.dart';
import 'package:klambi_ta/component/space_extension.dart';
import 'package:get/get.dart';

import '../model/model.dart';


Widget CartProduct(
    BuildContext context,
    Product item,
    ) {
  final size = MediaQuery.of(context).size;

  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 30),
    child: Row(
      children: [
        Container(
          width: size.width *   0.2,
          height: size.height * 0.1,
          foregroundDecoration: BoxDecoration(
              image: DecorationImage(image: AssetImage(item.image))),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: size.width * 0.6,
                child: Text(
                  item.title,
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w400,fontFamily: "General Sans",overflow: TextOverflow.ellipsis),maxLines: 2,
                ),
              ),
              Text("ukuran : S",
                style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500,fontFamily: "General Sans",color: ColorValue.kDarkGrey),
              ),
              Row(
                children: [
                  Text(
                    "Rp ${item.price}",
                    style: TextStyle(fontSize: 18,fontWeight: FontWeight.w600,fontFamily: "General Sans",color: ColorValue.kSecondary),
                  ),
                  Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            border: Border.all(color: ColorValue.kPrimary),
                          ),
                          child: InkWell(
                              onTap: () {},
                              child: const Icon(
                                Icons.remove,
                                size: 16,
                              )),
                        ),
                        const Text(
                          '3',
                          style: TextStyle(color: Colors.black, fontSize: 16),
                        ),
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            border: Border.all(color: ColorValue.kPrimary),
                          ),                    child: InkWell(
                            onTap: () {},
                            child: const Icon(
                              Icons.add,
                              size: 16,
                            )),
                        ),
                      ].withSpaceBetween(width: 5)
                  )
                ].withSpaceBetween(width: 70),
              ),

            ],
          ),
        ),
      ].withSpaceBetween(width: 14)
    ),
  );
}

Widget ProductCards(List<Product> itemList) {
  return ListView.builder(
    itemCount: itemList.length,
      physics: NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      scrollDirection: Axis.vertical,
      itemBuilder: (context,index){
        return CartProduct(context, itemList[index]);
      }
  );
}