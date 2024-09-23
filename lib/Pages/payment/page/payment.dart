import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:klambi_ta/Common/colors/color.dart';
import 'package:klambi_ta/Common/routes/routes_name.dart';
import 'package:klambi_ta/Pages/menuprofile/pages/address/controller/address_controller.dart';
import 'package:klambi_ta/Pages/payment/components/test2.dart';
import 'package:klambi_ta/Pages/payment/components/test3.dart';
import 'package:klambi_ta/Pages/payment/controller/payment_controller.dart';
import 'package:klambi_ta/component/loadinfanimation.dart';
import 'package:klambi_ta/component/my_elevatedbutton.dart';
import '../../../component/format_price.dart';
import '../../menuprofile/pages/address/edit/editAddress.dart';

class Payment extends StatelessWidget {
  Payment({super.key});
  final PaymentController controller = Get.put(PaymentController());
  final AddressController addressController = Get.put(AddressController());

  @override
  Widget build(BuildContext context) {
    final Size mediaQuery = MediaQuery.of(context).size;
    final double height = mediaQuery.height;
    final double width = mediaQuery.width;
    final double textScaleFactor = MediaQuery.of(context).textScaleFactor;

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Pembayaran',
          style: TextStyle(
            fontFamily: 'General Sans',
            fontWeight: FontWeight.w600,
            fontSize: 24 * textScaleFactor,
            color: ColorValue.kBlack,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: Obx(() {
        if (controller.isLoading.value) {
          return Loading();
        }

        final order = controller.orderData.value;
        final products = order?.products;
        final addressData = addressController.Show.isNotEmpty ? addressController.Show[0] : null;
        controller.fetchLatestOrder();

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
                      color: ColorValue.kSecondary.withOpacity(0.1),
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
                            fontSize: 14 * textScaleFactor,
                            fontWeight: FontWeight.w600,
                            fontFamily: 'General Sans',
                            color: ColorValue.kSecondary,
                          ),
                        ),
                        SizedBox(height: 10),
                        Row(
                          children: [
                            Icon(Icons.location_on, color: ColorValue.kSecondary, size: 28),
                            SizedBox(width: 10),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Nama Lengkap: ${addressData?.namaLengkap ?? 'N/A'}",
                                    style: TextStyle(
                                      fontSize: 14 * textScaleFactor,
                                      fontWeight: FontWeight.w500,
                                      fontFamily: 'General Sans',
                                    ),
                                  ),
                                  Text(
                                    "No HP: ${addressData?.nomorTelepon ?? 'N/A'}",
                                    style: TextStyle(
                                      fontSize: 14 * textScaleFactor,
                                      fontWeight: FontWeight.w500,
                                      fontFamily: 'General Sans',
                                    ),
                                  ),
                                  SizedBox(height: 5),
                                  Text(
                                    "${addressData?.provinsi ?? ''}, ${addressData?.keterangan ?? ''}",
                                    style: TextStyle(
                                      fontSize: 14 * textScaleFactor,
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
                              if (addressData != null) {
                                Get.to(EditAddressView(addressId: addressData!.id));
                              }
                            },
                            child: Text("Ganti", style: TextStyle(color: ColorValue.kSecondary)),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(height: 20),
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
                            fontSize: 16 * textScaleFactor,
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
                                      fontSize: 14 * textScaleFactor,
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
                                      fontSize: 13 * textScaleFactor,
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
                                          fontSize: 15 * textScaleFactor,
                                          fontWeight: FontWeight.w600,
                                          fontFamily: 'General Sans',
                                          color: ColorValue.kPrimary,
                                        ),
                                      ),
                                      Text(
                                        "x${product.quantity ?? 0}",
                                        style: TextStyle(
                                          fontSize: 13 * textScaleFactor,
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
                          "Total Pesanan (${products?.length ?? 0} produk)",
                          formatPrice(totalProductPrice),
                        ),
                        SizedBox(height: 5),
                        _buildPriceDetailRow(
                          'Biaya Penangan',
                          formatPrice(order?.handlingFee ?? 0),
                        ),
                        SizedBox(height: 5),
                        _buildPriceDetailRow(
                          'Biaya Pengiriman',
                          formatPrice(order?.shippingFee ?? 0),
                        ),
                        Test2(),
                        Test3(),
                        Divider(color: ColorValue.kLightGrey),
                        SizedBox(height: 10),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Total Pembayaran",
                                style: TextStyle(
                                  fontSize: 16 * textScaleFactor,
                                  fontWeight: FontWeight.w700,
                                  fontFamily: 'General Sans',
                                ),
                              ),
                              Text(
                                formatPrice(order?.totalPrice ?? 0),
                                style: TextStyle(
                                  fontSize: 16 * textScaleFactor,
                                  fontWeight: FontWeight.w700,
                                  fontFamily: 'General Sans',
                                  color: ColorValue.kPrimary,
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: 20),
                        My_Button(
                          title: 'Konfirmasi Pembayaran',
                          onclick: () {
                            controller.addHistory();
                            Get.offAllNamed(RouteName.design);
                          },
                          loading: controller.isLoading.value,
                        ),
                      ],
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

  Widget _buildPriceDetailRow(String label, String value) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          label,
          style: TextStyle(
            fontSize: 13,
            fontWeight: FontWeight.w500,
            fontFamily: 'General Sans',
            color: ColorValue.kDarkGrey,
          ),
        ),
        Text(
          value,
          style: TextStyle(
            fontSize: 13,
            fontWeight: FontWeight.w500,
            fontFamily: 'General Sans',
          ),
        ),
      ],
    );
  }
}
