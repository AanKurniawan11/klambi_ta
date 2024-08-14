import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:klambi_ta/Pages/cart/controller/cart_controllers.dart';
import 'package:klambi_ta/Common/colors/color.dart';
import 'package:klambi_ta/Pages/home/components/home_controller.dart';
import 'package:klambi_ta/Pages/menuprofile/pages/address/Page/ReqAddress.dart';
import 'package:klambi_ta/Pages/menuprofile/pages/address/controller/address_controller.dart';
import 'package:klambi_ta/component/space_extension.dart';

class Cart extends StatelessWidget {
  Cart({super.key});

  final CartControllers controllers = Get.put(CartControllers());
  final HomeController homecontroller = Get.put(HomeController());
  final AddressController Showcontroller = Get.put(AddressController());

  @override
  Widget build(BuildContext context) {
    final Size mediaquery = MediaQuery.of(context).size;
    final double height = mediaquery.height;
    final double width = mediaquery.width;

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Keranjang Saya',
          style: TextStyle(
            fontFamily: 'General Sans',
            fontWeight: FontWeight.w500,
            fontSize: 23,
          ),
        ),
        leading: IconButton(
          onPressed: () {
            Get.back();
          },
          icon: Icon(Icons.arrow_back_outlined),
        ),
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Obx(() {
        if (controllers.Cartdata.isEmpty) {
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 150),
            child: Center(
              child: Column(
                children: [
                  Container(
                    height: height * 0.3,
                    width: width * 0.8,
                    foregroundDecoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage("assets/cartEmpty.png"),
                      ),
                    ),
                  ),
                  Text("Tidak ada barang di keranjang"),
                ],
              ),
            ),
          );
        }
        return ListView.builder(
          padding: EdgeInsets.only(bottom: 100),
          shrinkWrap: true,
          scrollDirection: Axis.vertical,
          itemCount: controllers.Cartdata.length,
          itemBuilder: (context, index) {
            final item = controllers.Cartdata[index];

            return Dismissible(
              key: Key(item.productId.toString()),
              direction: DismissDirection.endToStart,
              onDismissed: (direction) {
                controllers.DeleteCartItem({
                  "products_id": item.productId,
                  "quantity": item.quantity,
                  "size": item.size,
                }).then((_) {
                  // Hapus item dari tampilan setelah dihapus
                  controllers.Cartdata.removeAt(index);
                  controllers.update(); // Memastikan bahwa pembaruan state dilakukan

                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('${item.productTitle} dihapus dari keranjang')),
                  );
                });
              },
              background: Container(
                color: Colors.red,
                alignment: Alignment.centerRight,
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: Icon(
                  Icons.delete,
                  color: Colors.white,
                ),
              ),
              child: Container(
                height: height * 0.2,
                width: double.infinity,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(bottom: 45, left: 20),
                      child: Container(
                        height: height * 0.12,
                        width: width * 0.18,
                        foregroundDecoration: BoxDecoration(
                          image: DecorationImage(
                            image: NetworkImage(item.imageUrl),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            width: width * 0.58,
                            child: Text(
                              "${item.productTitle}",
                              style: TextStyle(fontFamily: "General Sans"),
                            ),
                          ),
                          Text(
                            "Ukuran : ${item.size}",
                            style: TextStyle(fontFamily: "General Sans"),
                          ),
                          Text(
                            NumberFormat.currency(
                              locale: 'id_ID',
                              symbol: 'Rp ',
                              decimalDigits: 0,
                            ).format(item.productPrice),
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w600,
                              color: ColorValue.kSecondary,
                              fontFamily: "General Sans",
                            ),
                          ),
                          GetBuilder<CartControllers>(
                            builder: (tx) => Text(
                              "Jumlah : ${NumberFormat.currency(locale: 'id_ID', symbol: 'Rp ', decimalDigits: 0).format(tx.Cartdata[index].quantity * tx.Cartdata[index].productPrice)}",
                            ),
                          ),
                          Container(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                GestureDetector(
                                  onTap: () {
                                    if (item.quantity > 0) {
                                      item.quantity--;
                                      controllers.update();
                                      controllers.updateTotalPrice();
                                    }
                                  },
                                  child: Container(
                                    decoration: BoxDecoration(
                                      shape: BoxShape.rectangle,
                                      border: Border.fromBorderSide(BorderSide(color: ColorValue.kPrimary)),
                                      borderRadius: BorderRadius.circular(6),
                                    ),
                                    child: Icon(Icons.remove, size: 18),
                                  ),
                                ),
                                GetBuilder<CartControllers>(
                                  builder: (tx) => Text(
                                    tx.Cartdata[index].quantity.toString(),
                                    style: TextStyle(fontSize: 16),
                                  ),
                                ),
                                GestureDetector(
                                  onTap: () {
                                    item.quantity++;
                                    controllers.update();
                                    controllers.updateTotalPrice();
                                  },
                                  child: Container(
                                    decoration: BoxDecoration(
                                      shape: BoxShape.rectangle,
                                      border: Border.fromBorderSide(BorderSide(color: ColorValue.kPrimary)),
                                      borderRadius: BorderRadius.circular(6),
                                    ),
                                    child: Icon(Icons.add, size: 18),
                                  ),
                                ),
                              ].withSpaceBetween(width: 8),
                            ),
                          ),
                        ].withSpaceBetween(height: 2),
                      ),
                    ),
                    Column(
                      children: [
                        Obx(
                              () => Checkbox(
                            value: controllers.selectedItems.contains(item),
                            checkColor: ColorValue.kWhite,
                            activeColor: ColorValue.kSecondary,
                            side: BorderSide(color: ColorValue.kSecondary),
                            onChanged: (bool? value) {
                              controllers.toggleSelection(item);
                              controllers.selectedCart(item.id, value ?? false, item.quantity);
                            },
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            );
          },
        );
      }),
      bottomSheet: Obx(() {
        final totalPrice = controllers.totalPrice.value;
        final hasSelectedItems = controllers.selectedItems.isNotEmpty;

        return Container(
          padding: EdgeInsets.all(5),
          height: height * 0.13,
          color: Colors.white,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsets.all(10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Total:", style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600)),
                    Text(
                      NumberFormat.currency(locale: 'id_ID', symbol: 'Rp ', decimalDigits: 0).format(totalPrice),
                      style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600, color: ColorValue.kSecondary),
                    ),
                  ],
                ),
              ),
              GestureDetector(
                onTap: () {
                  if (hasSelectedItems) {
                    if (Showcontroller.Show.isNotEmpty) {
                      Get.offNamed("/payment");
                    } else {
                      Get.to(ReqAddres());
                    }
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('Silakan pilih item terlebih dahulu')),
                    );
                  }
                },
                child: Container(
                  margin: EdgeInsets.only(bottom: 4),
                  width: width * 0.9,
                  height: height * 0.055,
                  decoration: BoxDecoration(
                    color: hasSelectedItems ? ColorValue.kPrimary : ColorValue.kDarkGrey,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Center(
                    child: Text(
                      "Beli",
                      style: TextStyle(
                        fontFamily: "General Sans",
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      }),
    );
  }
}
