import 'package:flutter/material.dart';
import 'package:klambi_ta/Pages/detail/page/detail.dart';
import 'package:klambi_ta/Pages/home/components/allproductresponsemodel.dart';
import 'package:klambi_ta/Pages/home/components/home_controller.dart';
import 'package:klambi_ta/component/space_extension.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:shimmer/shimmer.dart';

import '../../../common/colors/color.dart';

class RecomendProduct extends StatelessWidget {
  final Datum item;

  RecomendProduct({required this.item});

  final HomeController controller = Get.put(HomeController());

  String formatPrices(int price) {
    final format = NumberFormat.currency(locale: 'id_ID', symbol: 'Rp ', decimalDigits: 0);
    return format.format(price);
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return GestureDetector(
      onTap: () {
        Get.to(() => DetailView(item: item));
      },
      child: Container(
        height: size.height * 0.9,
        width: size.width * 0.5,
        decoration: BoxDecoration(
          border: Border.all(color: ColorValue.kLightGrey),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              buildProductImage(size),
              SizedBox(height: size.height * 0.02),
              buildProductTitle(),
              SizedBox(height: size.height * 0.005),
              buildProductPrice(),
              SizedBox(height: size.height * 0.005),
              buildProductInfo(),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildProductImage(Size size) {
    return Stack(
      children: [
        Container(
          width: size.width * 0.5,
          height: size.height * 0.18,
          child: CachedNetworkImage(
            imageUrl: controller.imageUrl(item.imagee),
            fit: BoxFit.cover,
            placeholder: (context, url) => Shimmer.fromColors(
              baseColor: Colors.grey[300]!,
              highlightColor: Colors.grey[100]!,
              child: Container(color: Colors.grey[300]),
            ),
            errorWidget: (context, url, error) => Icon(Icons.error),
          ),
        ),
        Positioned(
          right: 0,
          top: 0,
          child: Container(
            width: size.width * 0.2,
            height: size.height * 0.03,
            decoration: BoxDecoration(
              color: ColorValue.kSecondary,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Center(
              child: Text(
                item.category.displayName,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 9,
                  fontWeight: FontWeight.w600,
                  fontFamily: "General Sans",
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget buildProductTitle() {
    return Text(
      item.title,
      style: TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.w500,
        fontFamily: "General Sans",
      ),
      maxLines: 2,
      overflow: TextOverflow.ellipsis,
    );
  }

  Widget buildProductPrice() {
    return Text(
      formatPrices(item.price),
      style: TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.w600,
        fontFamily: "General Sans",
      ),
    );
  }

  Widget buildProductInfo() {
    return FittedBox(
      fit: BoxFit.cover,
      child: Row(
        children: [
          buildRating(),
          Text(
            '|',
            style: TextStyle(
              color: ColorValue.kDarkGrey,
              fontWeight: FontWeight.w500,
              fontSize: 16,
            ),
          ),
          buildStockInfo(),
          Text(
            '|',
            style: TextStyle(
              color: ColorValue.kDarkGrey,
              fontWeight: FontWeight.w500,
              fontSize: 16,
            ),
          ),
          buildSalesInfo(),
        ].withSpaceBetween(width: 4),
      ),
    );
  }

  Widget buildRating() {
    return Row(
      children: [
        Icon(
          Icons.star,
          size: 14,
          color: ColorValue.kPrimary,
        ),
        Text(
          item.rate.toString(),
          style: TextStyle(
            color: ColorValue.kDarkGrey,
            fontSize: 12,
            fontFamily: "General Sans",
          ),
        ),
      ],
    );
  }

  Widget buildStockInfo() {
    return Text(
      "Stock ${item.stock}",
      style: TextStyle(
        fontSize: 12,
        color: ColorValue.kDarkGrey,
        fontFamily: "General Sans",
      ),
    );
  }

  Widget buildSalesInfo() {
    return Text(
      "Terjual ${item.sold}",

      style: TextStyle(
        fontSize: 12,
        color: ColorValue.kDarkGrey,
        fontFamily: "General Sans",
      ),
    );
  }
}

class ProductCard extends StatelessWidget {
  final List<Datum> itemList;

  ProductCard({required this.itemList});

  @override
  Widget build(BuildContext context) {
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
        return RecomendProduct(item: itemList[index]);
      },
    );
  }
}

extension CategoryExtension on Category {
  String get displayName {
    switch (this) {
      case Category.LENGAN_PANJANG:
        return "Lengan Panjang";
      case Category.LENGAN_PENDEK:
        return "Lengan Pendek";
      case Category.OVERSIZE:
        return "Oversize";
      default:
        return "";
    }
  }
}
