import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:klambi_ta/Pages/cart/controller/cart_controllers.dart';
import 'package:klambi_ta/component/space_extension.dart';
import '../../../Common/colors/color.dart';

class CartItem extends StatelessWidget {
  CartItem({super.key});
  final CartControllers controllers = Get.find();

  @override
  Widget build(BuildContext context) {
    final Size mediaquery = MediaQuery.of(context).size;
    final double width = mediaquery.width;

    return ListView.builder(
      padding: EdgeInsets.only(bottom: 100),
      shrinkWrap: true,
      scrollDirection: Axis.vertical,
      itemCount: controllers.Cartdata.length,
      itemBuilder: (context, index) {
        final item = controllers.Cartdata[index];

        return Dismissible(
          key: ValueKey(item.productId),
          direction: DismissDirection.endToStart,
          onDismissed: (direction) {
            controllers.deleteCartItem(item.productId, item.quantity, item.size);
          },
          background: Container(
            color: Colors.red,
            alignment: Alignment.centerRight,
            padding: EdgeInsets.only(right: 20),
            child: Icon(
              Icons.delete,
              color: Colors.white,
              size: 40,
            ),
          ),
          child: Card(
            elevation: 5,
            margin: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            child: Padding(
              padding: EdgeInsets.all(10),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    height: width * 0.3, // Responsif berdasarkan lebar
                    width: width * 0.3,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      image: DecorationImage(
                        image: NetworkImage(item.imageUrl),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  SizedBox(width: 10),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.only(top: 10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "${item.productTitle}",
                            style: TextStyle(
                              fontFamily: "General Sans",
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                            ),
                            overflow: TextOverflow.ellipsis,
                          ),
                          SizedBox(height: 5),
                          Text(
                            "Ukuran : ${item.size}",
                            style: TextStyle(fontFamily: "General Sans"),
                          ),
                          SizedBox(height: 5),
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
                          SizedBox(height: 5),
                          GetBuilder<CartControllers>(
                            builder: (tx) => Text(
                              "Jumlah : ${NumberFormat.currency(locale: 'id_ID', symbol: 'Rp ', decimalDigits: 0).format(tx.Cartdata[index].quantity * tx.Cartdata[index].productPrice)}",
                            ),
                          ),
                          SizedBox(height: 10),
                          Row(
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
                                    border: Border.fromBorderSide(
                                        BorderSide(color: ColorValue.kPrimary)),
                                    borderRadius: BorderRadius.circular(6),
                                  ),
                                  child: Icon(Icons.remove, size: 18),
                                ),
                              ),
                              GetBuilder<CartControllers>(
                                builder: (tx) => Padding(
                                  padding: const EdgeInsets.symmetric(horizontal: 10),
                                  child: Text(
                                    tx.Cartdata[index].quantity.toString(),
                                    style: TextStyle(fontSize: 16),
                                  ),
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
                                    border: Border.fromBorderSide(
                                        BorderSide(color: ColorValue.kPrimary)),
                                    borderRadius: BorderRadius.circular(6),
                                  ),
                                  child: Icon(Icons.add, size: 18),
                                ),
                              ),
                            ].withSpaceBetween(width: 8),
                          ),
                        ].withSpaceBetween(height: 2),
                      ),
                    ),
                  ),
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
            ),
          ),
        );
      },
    );
  }
}
