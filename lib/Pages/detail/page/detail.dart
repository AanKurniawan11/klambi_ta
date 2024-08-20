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
            height: height,
            width: width,
            cartcontroller: cartcontroller,
            homecontroller: homecontroller,
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

    // Widget _buildPanel(BuildContext context) {
    //   final Size mediaquery = MediaQuery.of(context).size;
    //   final double height = mediaquery.height;
    //   final double width = mediaquery.width;
    //   return Container(
    //     padding: EdgeInsets.symmetric(horizontal: 20, vertical: 25),
    //     decoration: BoxDecoration(
    //       color: Colors.white,
    //       borderRadius: BorderRadius.only(
    //         topLeft: Radius.circular(20),
    //         topRight: Radius.circular(20),
    //       ),
    //     ),
    //     child: SingleChildScrollView(
    //       child: Column(
    //         crossAxisAlignment: CrossAxisAlignment.start,
    //         children: [
    //           Center(
    //             child: Container(
    //               width: width * 0.15,
    //               height: height * 0.007,
    //               decoration: BoxDecoration(
    //                 color: Colors.grey[300],
    //                 borderRadius: BorderRadius.circular(5),
    //               ),
    //             ),
    //           ),
    //           SizedBox(height: 25),
    //           Text(
    //             item.category.displayName,
    //             style: TextStyle(
    //               fontFamily: 'General Sans',
    //               fontWeight: FontWeight.w500,
    //               fontSize: 14,
    //               color: ColorValue.kSecondary,
    //             ),
    //           ),
    //           Row(
    //             children: [
    //               Container(
    //                 width: width * 0.79,
    //                 child: Text(
    //                   item.title,
    //                   style: TextStyle(
    //                     fontFamily: 'General Sans',
    //                     fontSize: 20,
    //                     fontWeight: FontWeight.w500,
    //                   ),
    //                   maxLines: 2,
    //                 ),
    //               ),
    //             ],
    //           ),
    //           SizedBox(height: 10),
    //           Row(
    //             children: [
    //               Container(
    //                 padding: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
    //                 decoration: BoxDecoration(
    //                   color: ColorValue.kWhite,
    //                   borderRadius: BorderRadius.circular(10),
    //                   border: Border.all(
    //                     color: ColorValue.kBlack,
    //                   ),
    //                 ),
    //                 child: Row(
    //                   children: [
    //                     Icon(
    //                       CupertinoIcons.star_fill,
    //                       color: ColorValue.kPrimary,
    //                       size: 12,
    //                     ),
    //                     Text(
    //                       item.rate.toString(),
    //                       style: TextStyle(
    //                         fontFamily: "General Sans",
    //                         fontWeight: FontWeight.w500,
    //                         fontSize: 12,
    //                         color: ColorValue.kDarkGrey,
    //                       ),
    //                     ),
    //                     Text(
    //                       "(15)",
    //                       style: TextStyle(
    //                         fontFamily: "General Sans",
    //                         fontWeight: FontWeight.w500,
    //                         fontSize: 12,
    //                         color: ColorValue.kDarkGrey,
    //                       ),
    //                     ),
    //                   ].withSpaceBetween(width: 2),
    //                 ),
    //               ),
    //               SizedBox(width: 5),
    //               Container(
    //                 padding: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
    //                 decoration: BoxDecoration(
    //                   color: ColorValue.kWhite,
    //                   borderRadius: BorderRadius.circular(10),
    //                   border: Border.all(
    //                     color: ColorValue.kBlack,
    //                   ),
    //                 ),
    //                 child: Text(
    //                   '20 Pembelian',
    //                   style: TextStyle(
    //                     fontFamily: "General Sans",
    //                     fontWeight: FontWeight.w500,
    //                     fontSize: 12,
    //                     color: ColorValue.kDarkGrey,
    //                   ),
    //                 ),
    //               ),
    //               SizedBox(width: 5),
    //               Container(
    //                 padding: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
    //                 decoration: BoxDecoration(
    //                   color: ColorValue.kWhite,
    //                   borderRadius: BorderRadius.circular(10),
    //                   border: Border.all(
    //                     color: ColorValue.kBlack,
    //                   ),
    //                 ),
    //                 child: Text(
    //                   "Stock ${item.stock.toString()}",
    //                   style: TextStyle(
    //                     fontFamily: "General Sans",
    //                     fontWeight: FontWeight.w500,
    //                     fontSize: 12,
    //                     color: ColorValue.kDarkGrey,
    //                   ),
    //                 ),
    //               ),
    //             ],
    //           ),
    //           SizedBox(height: 10),
    //           Text(
    //             formatPrice(item.price),
    //             style: TextStyle(
    //               fontFamily: 'General Sans',
    //               fontWeight: FontWeight.w600,
    //               fontSize: 32,
    //               color: ColorValue.kBlack,
    //             ),
    //           ),
    //           SizedBox(height: 10),
    //           Text(
    //             'Deskripsi Produk',
    //             style: TextStyle(
    //               fontFamily: 'General Sans',
    //               fontWeight: FontWeight.w600,
    //               fontSize: 20,
    //               color: ColorValue.kBlack,
    //             ),
    //           ),
    //           SizedBox(height: 10),
    //           Text(
    //             item.descripsi,
    //             style: TextStyle(
    //               fontFamily: 'General Sans',
    //               fontWeight: FontWeight.w500,
    //               fontSize: 12,
    //               color: ColorValue.kBlack,
    //             ),
    //           ),
    //           SizedBox(
    //             height: 40,
    //           ),
    //           Row(
    //             mainAxisAlignment: MainAxisAlignment.spaceBetween,
    //             children: [
    //               Container(
    //                 width: width * 0.58,
    //                 height: height * 0.075,
    //                 child: My_Button(
    //                   onclick: (){
    //                     Get.to(Payment());
    //                   },
    //                   title: "Langsung Beli",
    //                 ),
    //               ),
    //               Container(
    //                 width: width * 0.25,
    //                 height: height * 0.075,
    //                 child: ElevatedButton(
    //                   onPressed: () {
    //                     showMaterialModalBottomSheet(
    //                       context: context,
    //                       builder: (context) => SingleChildScrollView(
    //                         controller: ModalScrollController.of(context),
    //                         child: Container(
    //                           height: height * 0.53,
    //                           // width: 100,
    //                           color: ColorValue.kWhite,
    //                           child: Padding(
    //                             padding: const EdgeInsets.all(15),
    //                             child: Column(
    //                               mainAxisAlignment: MainAxisAlignment.start,
    //                               crossAxisAlignment: CrossAxisAlignment.start,
    //                               children: [
    //                                 GestureDetector(
    //                                   onTap: () {
    //                                     Get.back();
    //                                   },
    //                                   child: Align(
    //                                       alignment: Alignment.topRight,
    //                                       child: Icon(Icons.close)),
    //                                 ),
    //                                 Padding(
    //                                   padding: const EdgeInsets.all(8.0),
    //                                   child: Row(
    //                                     children: [
    //                                       Container(
    //                                         height: 100,
    //                                         width: 100,
    //                                         foregroundDecoration: BoxDecoration(
    //                                             image: DecorationImage(
    //                                                 image: NetworkImage(
    //                                                     homecontroller.imageUrl(item.imagee)))),
    //                                       ),
    //                                       SizedBox(
    //                                         width: 10,
    //                                       ),
    //                                       Column(
    //                                         crossAxisAlignment:
    //                                         CrossAxisAlignment.start,
    //                                         children: [
    //                                           Container(
    //                                               width: width * 0.6,
    //                                               child: Text(
    //                                                 item.title,
    //                                                 style: TextStyle(
    //                                                     fontFamily:
    //                                                     "General Sans"),
    //                                                 maxLines: 2,
    //                                               )),
    //                                           Text(
    //                                             formatPrice(item.price),
    //
    //
    //                                             style: TextStyle(
    //                                                 fontFamily: "General Sans",
    //                                                 fontSize: 16,
    //                                                 color:
    //                                                 ColorValue.kSecondary),
    //                                           )
    //                                         ],
    //                                       )
    //                                     ],
    //                                   ),
    //                                 ),
    //                                 SizedBox(height: 20),
    //                                 Text(
    //                                   "Pilih Ukuran",
    //                                   style: TextStyle(
    //                                       fontSize: 14,
    //                                       fontWeight: FontWeight.w500,
    //                                       color: ColorValue.kDarkGrey),
    //                                 ),
    //                                 Divider(
    //                                   thickness: 1,
    //                                   indent: 3,
    //                                   endIndent: 3,
    //                                   color: ColorValue.kLightGrey,
    //                                 ),
    //                                 Sizes(onChanged: (value) {
    //                                   cartcontroller.size.value = value;
    //                                 }),
    //                                 SizedBox(height: 10),
    //                                 Divider(
    //                                   thickness: 1,
    //                                   indent: 3,
    //                                   endIndent: 3,
    //                                   color: ColorValue.kLightGrey,
    //                                 ),
    //                                 Padding(
    //                                   padding: const EdgeInsets.all(8.0),
    //                                   child: Row(
    //                                       mainAxisAlignment:
    //                                       MainAxisAlignment.spaceBetween,
    //                                       children: [
    //                                         Text(
    //                                           "Jumlah",
    //                                           style: TextStyle(
    //                                               fontSize: 14,
    //                                               fontWeight: FontWeight.w500,
    //                                               color: ColorValue.kDarkGrey),
    //                                         ),
    //                                         Obx(() {
    //                                           return Container(
    //                                             width: width * 0.26,
    //                                             height: height * 0.04,
    //                                             decoration: BoxDecoration(
    //                                                 color: ColorValue.kLightGrey,
    //                                                 border: Border.fromBorderSide(
    //                                                   BorderSide(
    //                                                       color: ColorValue
    //                                                           .kDarkGrey),
    //                                                 ),
    //                                                 borderRadius:
    //                                                 BorderRadius.circular(
    //                                                     10)),
    //                                             child: Row(
    //                                               mainAxisAlignment:
    //                                               MainAxisAlignment.center,
    //                                               children: [
    //                                                 IconButton(
    //                                                   icon: Icon(
    //                                                     Icons.remove,
    //                                                     size: 10,
    //                                                   ),
    //                                                   onPressed: () {
    //                                                     if (cartcontroller
    //                                                         .quantity.value >
    //                                                         0) {
    //                                                       cartcontroller
    //                                                           .quantity.value--;
    //                                                     }
    //                                                   },
    //                                                 ),
    //                                                 Text(
    //                                                   cartcontroller.quantity
    //                                                       .value
    //                                                       .toString(),
    //                                                   style: TextStyle(
    //                                                       fontSize: 10),
    //                                                 ),
    //                                                 IconButton(
    //                                                   icon: Icon(
    //                                                     Icons.add,
    //                                                     size: 10,
    //                                                   ),
    //                                                   onPressed: () {
    //                                                     cartcontroller
    //                                                         .quantity.value++;
    //                                                   },
    //                                                 ),
    //                                               ],
    //                                             ),
    //                                           );
    //                                         }),
    //                                       ].withSpaceBetween(height: 20)),
    //                                 ),
    //                                 SizedBox(
    //                                   height: 20,
    //                                 ),
    //                                 Center(
    //                                   child: GestureDetector(
    //                                     onTap: () {
    //                                       if (cartcontroller.quantity.value ==
    //                                           0) {
    //                                         ScaffoldMessenger.of(context)
    //                                             .showSnackBar(
    //                                           SnackBar(
    //                                             content: Text(
    //                                                 "Tidak ada barang untuk ditambahkan ke keranjang"),
    //                                             behavior:
    //                                             SnackBarBehavior.floating,
    //                                             margin: EdgeInsets.only(
    //                                                 bottom: 700.0,
    //                                                 left: 20.0,
    //                                                 right: 20.0), // Margin untuk menempatkan SnackBar di atas
    //                                           ),
    //                                         );
    //                                       } else {
    //                                         cartcontroller.addToCart(item.id);
    //                                         Get.toNamed("/cart");
    //                                       }
    //                                     },
    //                                     child: Container(
    //                                       width: width * 0.8,
    //                                       height: height * 0.06,
    //                                       decoration: BoxDecoration(
    //                                           color: ColorValue.kPrimary,
    //                                           borderRadius:
    //                                           BorderRadius.circular(10)),
    //                                       child: Center(
    //                                           child: Text(
    //                                             "Tambahkan ke Keranjang",
    //                                             style: TextStyle(
    //                                                 fontFamily: "General Sans"),
    //                                           )),
    //                                     ),
    //                                   ),
    //                                 ),
    //                               ],
    //                             ),
    //                           ),
    //                         ),
    //                       ),
    //                     );
    //                   },
    //                   style: ButtonStyle(
    //                     backgroundColor:
    //                     MaterialStateProperty.all(ColorValue.kSecondary),
    //                     minimumSize: MaterialStateProperty.all(
    //                         Size(width * 0.85, height * 0.065)),
    //                     shape: MaterialStateProperty.all<RoundedRectangleBorder>(
    //                       RoundedRectangleBorder(
    //                         borderRadius: BorderRadius.circular(12.0),
    //                       ),
    //                     ),
    //                   ),
    //                   child: Icon(
    //                     Icons.shopping_cart_checkout_outlined,
    //                     color: Colors.white,
    //                   ),
    //                 ),
    //               )
    //             ],
    //           ),
    //         ],
    //       ),
    //     ),
    //   );
    // }
  }

