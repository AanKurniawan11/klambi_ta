  import 'package:flutter/cupertino.dart';
  import 'package:flutter/material.dart';
  import 'package:klambi_ta/Pages/cart/controller/cart_controllers.dart';
import 'package:klambi_ta/Pages/detail/components/buidup_panel.dart';
import 'package:klambi_ta/Pages/detail/components/shimmer_image.dart';
  import 'package:klambi_ta/Pages/detail/controller/detail_controller.dart';
import 'package:klambi_ta/Pages/history/controller/historycontroller.dart';
  import 'package:klambi_ta/Pages/home/components/home_controller.dart';
  import 'package:klambi_ta/Pages/menuprofile/pages/address/controller/address_controller.dart';
  import 'package:klambi_ta/Pages/payment/controller/payment_controller.dart';
  import 'package:klambi_ta/Common/colors/color.dart';
  import 'package:klambi_ta/Pages/home/components/allproductresponsemodel.dart';
  import 'package:get/get.dart';
  import 'package:sliding_up_panel/sliding_up_panel.dart';

  class DetailView extends StatelessWidget {
    final controller = Get.put(DetailController());
    final cartcontroller = Get.put(CartControllers());
    final homecontroller = Get.put(HomeController());
    final showcontroller = Get.put(AddressController());
    final paymentcontroller = Get.put(PaymentController());
    final historycontroller = Get.put(HistoryController());
    final Datum item;

    DetailView({super.key, required this.item});

    @override
    Widget build(BuildContext context) {
      final Size mediaquery = MediaQuery.of(context).size;
      final double height = mediaquery.height;
      final double width = mediaquery.width;

      // Check if the item is out of stock
      bool isOutOfStock = item.stock <= 0;

      return Scaffold(
        backgroundColor: ColorValue.kBackground,
        appBar: AppBar(
          title: Text(
            'Detail Produk',
            style: TextStyle(
              fontFamily: 'General Sans',
              fontWeight: FontWeight.w500,
              fontSize: 23,
            ),
          ),
          leading: IconButton(onPressed: (){Get.back();}, icon: Icon(CupertinoIcons.arrow_left)),
          backgroundColor: Colors.transparent,
          elevation: 0, // Remove appbar shadow
        ),
        body: SlidingUpPanel(
          minHeight: height * 0.4,
          panelSnapping: true,
          backdropOpacity: 0.5,
          backdropTapClosesPanel: true,
          borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.2),
              blurRadius: 10.0,
            ),
          ],
          panel: ProductDetailPanel(
            item: item,
            cartcontroller: cartcontroller,
            homecontroller: homecontroller,
            addresscontroller: showcontroller,
            paymentController: paymentcontroller,
          ),
          body: ListView(
            children: [
              Container(
                child: ShimmerImage(
                  imageUrl: homecontroller.imageUrl(item.imagee),
                ),
              ),
              // Add other content of your detail view here
            ],
          ),
        ),
      );
    }

  }

