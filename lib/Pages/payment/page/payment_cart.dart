import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:klambi_ta/Common/colors/color.dart';
import 'package:klambi_ta/Pages/cart/controller/cart_controllers.dart';
import 'package:klambi_ta/Pages/menuprofile/pages/address/controller/address_controller.dart';
import 'package:klambi_ta/Pages/payment/components/paymethcart.dart';
import 'package:klambi_ta/Pages/payment/controller/payment_controller.dart';
import 'package:klambi_ta/component/my_elevatedbutton.dart';
import 'package:klambi_ta/component/space_extension.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import '../../../component/format_price.dart';
import '../components/test2.dart';

class PaymentCart extends StatelessWidget {
  PaymentCart({super.key});
  final PaymentController controller = Get.put(PaymentController());
  final CartControllers cartcontroller = Get.put(CartControllers());

  @override
  Widget build(BuildContext context) {
    final Size mediaQuery = MediaQuery.of(context).size;
    final double height = mediaQuery.height;
    final double width = mediaQuery.width;

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Pembayaran',
          style: TextStyle(
            fontFamily: 'General Sans',
            fontWeight: FontWeight.w600,
            fontSize: 24,
            color: ColorValue.kBlack,
          ),
        ),
        centerTitle: true,
        leading: IconButton(
          onPressed: () {
            Get.offAllNamed("/navbar");
          },
          icon: Icon(Icons.arrow_back, color: ColorValue.kBlack),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: Obx(() {
        if (controller.isLoading.value) {
          return
            Center(child: LoadingAnimationWidget.discreteCircle(
              color: ColorValue.kPrimary,
              size: 50,
              secondRingColor: ColorValue.kSecondary,
              thirdRingColor: ColorValue.kDanger,
            ));
        }
        if (cartcontroller.order.value == null) {
          return Center(child: Text('Tidak ada data pesanan.'));
        }
        final order = cartcontroller.orderData.value?.order;
        final products = cartcontroller.orderData.value?.products;
        final address = order?.address;

        // Calculate total price for all products
        int totalProductPrice = 0;
        if (products != null) {
          for (var product in products) {
            totalProductPrice += (product.price ?? 0) * (product.quantity ?? 0);
          }
        }

        return SingleChildScrollView(
          child: Column(
            children: [
              Center(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    width: width * 0.9,
                    padding: const EdgeInsets.all(16.0),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      color: ColorValue.kPrimary.withOpacity(0.1),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.2),
                          blurRadius: 10,
                          offset: Offset(0, 5),
                        ),
                      ],
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Dikirim ke:",
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                            fontFamily: 'General Sans',
                            color: ColorValue.kPrimary,
                          ),
                        ),
                        SizedBox(height: 10),
                        Row(
                          children: [
                            Icon(Icons.location_on, color: ColorValue.kPrimary, size: 28),
                            SizedBox(width: 10),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Nama Lengkap: ${address?.namaLengkap}",
                                    style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w500,
                                      fontFamily: 'General Sans',
                                    ),
                                  ),
                                  Text(
                                    "No HP: ${address?.nomorTelepon}",
                                    style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w500,
                                      fontFamily: 'General Sans',
                                    ),
                                  ),
                                  SizedBox(height: 5),
                                  Text(
                                    "${address?.provinsi}, ${address?.keterangan}",
                                    style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w400,
                                      fontFamily: 'General Sans',
                                      color: Colors.grey[700],
                                    ),
                                    maxLines: 2,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        Align(
                          alignment: Alignment.bottomRight,
                          child: TextButton(
                            onPressed: () {
                              // Get.offAllNamed("/edit");
                            },
                            child: Text("Ganti", style: TextStyle(color: ColorValue.kPrimary)),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(height: 20),
              // Rincian Pesanan
              Container(
                width: width * 0.9,
                padding: const EdgeInsets.all(16.0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.2),
                      blurRadius: 10,
                      offset: Offset(0, 5),
                    ),
                  ],
                ),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Icon(CupertinoIcons.cart_fill, color: ColorValue.kDarkGrey, size: 28),
                        SizedBox(width: 10),
                        Text(
                          "Rincian Pesanan",
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                            fontFamily: 'General Sans',
                          ),
                        ),
                      ],
                    ),
                    Divider(color: ColorValue.kLightGrey),
                    SizedBox(height: 10),
                    for (var product in products ?? [])
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 8.0),
                        child: Row(
                          children: [
                            Container(
                              width: width * 0.25,
                              height: height * 0.12,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8),
                                image: DecorationImage(
                                  image: NetworkImage(product.image ?? ''),
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            SizedBox(width: 12),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    product.title ?? 'Judul Produk',
                                    style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w600,
                                      fontFamily: 'General Sans',
                                    ),
                                    maxLines: 2,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                  SizedBox(height: 5),
                                  Text(
                                    "Ukuran: ${product.size ?? 'N/A'}",
                                    style: TextStyle(
                                      fontSize: 13,
                                      fontWeight: FontWeight.w500,
                                      fontFamily: 'General Sans',
                                      color: Colors.grey[700],
                                    ),
                                  ),
                                  SizedBox(height: 5),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        formatPrice(product.price ?? 0),
                                        style: TextStyle(
                                          fontSize: 15,
                                          fontWeight: FontWeight.w600,
                                          fontFamily: 'General Sans',
                                          color: ColorValue.kPrimary,
                                        ),
                                      ),
                                      Text(
                                        "x${product.quantity ?? 0}",
                                        style: TextStyle(
                                          fontSize: 13,
                                          fontWeight: FontWeight.w500,
                                          fontFamily: 'General Sans',
                                          color: Colors.grey[700],
                                        ),
                                      ),
                                    ],
                                  )
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    SizedBox(height: 20),
                    Column(
                        children: [
                          _buildPriceDetailRow(
                            "Total Pesanan (${products?[0].quantity ?? 0} produk)",
                            formatPrice(totalProductPrice),
                          ),
                          _buildPriceDetailRow(
                            'Biaya Penangan',
                            formatPrice(order?.handlingFee ?? 0),
                          ),
                          _buildPriceDetailRow(
                            'Biaya Pengiriman',
                            formatPrice(order?.shippingFee ?? 0),
                          ),
                        ].withSpaceBetween(height: 5)
                    ),
                    SizedBox(height: 20),
                    Divider(color: ColorValue.kLightGrey),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Total Pembayaran",
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                              fontFamily: 'General Sans',
                            ),
                          ),
                          Text(
                            formatPrice((totalProductPrice +
                                (order?.handlingFee ?? 0) +
                                (order?.shippingFee ?? 0))),
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w700,
                              fontFamily: 'General Sans',
                              color: ColorValue.kPrimary,
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 20),
                    Test2(),
                    My_Button(
                        title: 'Konfirmasi Pembayaran',
                        onclick: (){
                          controller.addHistory();
                          Get.offAllNamed("/design");
                        }
                    ),

                  ],
                ),
              ),
            ],
          ),
        );
      }),
    );
  }

  Widget _buildPriceDetailRow(String title, String value) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w600,
            fontFamily: 'General Sans',
          ),
        ),
        Text(
          value,
          style: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w600,
            fontFamily: 'General Sans',
            color: Colors.grey[700],
          ),
        ),
      ],
    );
  }

}
