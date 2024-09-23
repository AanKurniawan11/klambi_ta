import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:klambi_ta/Common/colors/color.dart';
import 'package:klambi_ta/Common/routes/routes_name.dart';
import 'package:klambi_ta/Pages/cart/controller/cart_controllers.dart';
import 'package:klambi_ta/Pages/detail/components/buttonpanel.dart';
import 'package:klambi_ta/Pages/detail/components/cartmodal.dart';
import 'package:klambi_ta/Pages/detail/components/poductmodal.dart';
import 'package:klambi_ta/Pages/detail/components/sizes.dart';
import 'package:klambi_ta/Pages/home/components/home_controller.dart';
import 'package:klambi_ta/Pages/home/components/recomend_product.dart';
import 'package:klambi_ta/Pages/menuprofile/pages/address/controller/address_controller.dart';
import 'package:klambi_ta/Pages/payment/controller/payment_controller.dart';
import 'package:klambi_ta/component/format_price.dart';
import 'package:klambi_ta/component/space_extension.dart';
import '../../../component/DefaultSize.dart';
import '../../home/components/allproductresponsemodel.dart';

class ProductDetailPanel extends StatelessWidget {
  final Datum item;
  final CartControllers cartcontroller;
  final HomeController homecontroller;
  final AddressController addresscontroller;
  final PaymentController paymentController;

  const ProductDetailPanel({
    Key? key,
    required this.item,
    required this.cartcontroller,
    required this.homecontroller,
    required this.addresscontroller,
    required this.paymentController,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size mediaquery = MediaQuery.of(context).size;
    final double height = mediaquery.height;
    final double width = mediaquery.width;

    return Container(
      padding: EdgeInsets.symmetric(horizontal: width * 0.05, vertical: height * 0.05),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
      ),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Container(
                width: width * 0.15,
                height: height * 0.007,
                decoration: BoxDecoration(
                  color: Colors.grey[300],
                  borderRadius: BorderRadius.circular(5),
                ),
              ),
            ),
            SizedBox(height: height * 0.025),
            Text(
              item.category.displayName,
              style: TextStyle(
                fontFamily: 'General Sans',
                fontWeight: FontWeight.w500,
                fontSize: 14,
                color: ColorValue.kSecondary,
              ),
            ),
            SizedBox(height: height * 0.01),
            Text(
              item.title,
              style: TextStyle(
                fontFamily: 'General Sans',
                fontSize: 20,
                fontWeight: FontWeight.w500,
              ),
              maxLines: 2,
            ),
            SizedBox(height: height * 0.01),
            Row(
              children: [
                _buildInfoContainer('${item.rate}', 'Star', ColorValue.kPrimary),
                SizedBox(width: 5),
                _buildInfoContainer('${item.sold} Terjual', 'Sold', ColorValue.kDarkGrey),
                SizedBox(width: 5),
                _buildInfoContainer('Stok ${item.stock}', 'Stock', ColorValue.kDarkGrey),
              ],
            ),
            SizedBox(height: height * 0.01),
            Text(
              formatPrice(item.price),
              style: TextStyle(
                fontFamily: 'General Sans',
                fontWeight: FontWeight.w600,
                fontSize: 32,
                color: ColorValue.kBlack,
              ),
            ),
            SizedBox(height: height * 0.01),
            Text(
              'Deskripsi Produk',
              style: TextStyle(
                fontFamily: 'General Sans',
                fontWeight: FontWeight.w600,
                fontSize: 20,
                color: ColorValue.kBlack,
              ),
            ),
            SizedBox(height: height * 0.01),
            Text(
              item.descripsi,
              style: TextStyle(
                fontFamily: 'General Sans',
                fontWeight: FontWeight.w500,
                fontSize: 12,
                color: ColorValue.kBlack,
              ),
            ),
            SizedBox(height: height * 0.05),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  width: width * 0.58,
                  height: height * 0.075,
                  child: ProductModal(item: item),
                ),
                Container(
                  width: width * 0.25,
                  height: height * 0.075,
                  child: CartModal(item: item),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildInfoContainer(String text, String label, Color color) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
      decoration: BoxDecoration(
        color: ColorValue.kWhite,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: color),
      ),
      child: Row(
        children: [
          Icon(CupertinoIcons.star_fill, color: color, size: 12),
          Text(
            text,
            style: TextStyle(
              fontFamily: "General Sans",
              fontWeight: FontWeight.w500,
              fontSize: 12,
              color: ColorValue.kDarkGrey,
            ),
          ),
        ].withSpaceBetween(width: 2),
      ),
    );
  }
}
