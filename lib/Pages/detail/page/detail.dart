  import 'package:flutter/cupertino.dart';
  import 'package:flutter/material.dart';
  import 'package:klambi_ta/Pages/cart/controller/cart_controllers.dart';
import 'package:klambi_ta/Pages/detail/components/buidup_panel.dart';
import 'package:klambi_ta/Pages/detail/components/shimmer_image.dart';
  import 'package:klambi_ta/Pages/detail/controller/detail_controller.dart';
  import 'package:klambi_ta/Pages/home/components/home_controller.dart';
  import 'package:klambi_ta/Pages/home/components/recomend_product.dart';
  import 'package:klambi_ta/Pages/menuprofile/pages/address/controller/address_controller.dart';
  import 'package:klambi_ta/Pages/payment/controller/payment_controller.dart';
import 'package:klambi_ta/Pages/payment/page/payment.dart';
import 'package:klambi_ta/Pages/payment/page/test.dart';
import 'package:klambi_ta/component/format_price.dart';
  import 'package:klambi_ta/component/my_elevatedbutton.dart';
  import 'package:intl/intl.dart';
  import 'package:klambi_ta/Common/colors/color.dart';
  import 'package:klambi_ta/Pages/home/components/allproductresponsemodel.dart';
  import 'package:klambi_ta/Pages/detail/components/sizes.dart';
import 'package:klambi_ta/component/sizesPay.dart';
  import 'package:klambi_ta/component/space_extension.dart';
  import 'package:get/get.dart';
  import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
  import 'package:sliding_up_panel/sliding_up_panel.dart';
  import 'package:shimmer/shimmer.dart';

  class DetailView extends StatelessWidget {
    final controller = Get.put(DetailController());
    final cartcontroller = Get.put(CartControllers());
    final homecontroller = Get.put(HomeController());
    final showcontroller = Get.put(AddressController());
    final paymentcontroller = Get.put(PaymentController());
    final Datum item;

    DetailView({super.key, required this.item});

    @override
    Widget build(BuildContext context) {
      final Size mediaquery = MediaQuery.of(context).size;
      final double height = mediaquery.height;
      final double width = mediaquery.width;

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
          leading: IconButton(onPressed: (){Get.offAllNamed("/navbar");}, icon: Icon(CupertinoIcons.arrow_left)),
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
            // height: height,
            // width: width,
            cartcontroller: cartcontroller,
            homecontroller: homecontroller,
            addresscontroller: showcontroller,
            paymentController: paymentcontroller,
          ),
          body: ListView(
            children: [
              Container(
                child: ShimmerImage(imageUrl:homecontroller.imageUrl(item.imagee) ),
              ),
              // Add other content of your detail view here
            ],
          ),
        ),
      );
    }
  }

