import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:klambi_ta/color.dart';
import 'package:klambi_ta/component/cart_product.dart';
import 'package:klambi_ta/component/my_elevatedbutton.dart';
import 'package:klambi_ta/component/space_extension.dart';
import 'package:klambi_ta/model/model.dart';

class Cart extends StatefulWidget {
  const Cart({super.key});

  @override
  _CartState createState() => _CartState();
}

class _CartState extends State<Cart> {
  List<Product> products = List.from(demoProducts);
  List<int> quantities = List<int>.filled(demoProducts.length, 3);

  String formatRupiah(double amount) {
    final NumberFormat formatter = NumberFormat.currency(
      locale: 'id_ID',
      symbol: 'Rp ',
      decimalDigits: 0,
    );
    return formatter.format(amount);
  }

  double get totalPrice {
    double total = 0;
    for (int i = 0; i < products.length; i++) {
      total += products[i].price * quantities[i];
    }
    return total;
  }

  void _handleDelete(int index) {
    setState(() {
      products.removeAt(index);
      quantities.removeAt(index);
    });
  }

  void _handleQuantityChange(int index, int quantity) {
    setState(() {
      quantities[index] = quantity;
    });
  }

  @override
  Widget build(BuildContext context) {
    final Size mediaquery = MediaQuery.of(context).size;
    final double height = mediaquery.height;
    final double width = mediaquery.width;

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              Get.offAndToNamed("/navbar", arguments: 3);
            },
            icon: Icon(Icons.arrow_back)),
        title: Text(
          "Keranjangku",
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
        ),
        centerTitle: true,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            children: [
              ListView.builder(
                itemCount: products.length,
                physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                scrollDirection: Axis.vertical,
                itemBuilder: (context, index) {
                  return CartProduct(
                    item: products[index],
                    onDelete: () {
                      _handleDelete(index);
                    },
                    onQuantityChanged: (quantity) {
                      _handleQuantityChange(index, quantity);
                    },
                    formatRupiah: formatRupiah,
                  );
                },
              ),
              SizedBox(
                height: 150,
              ),
            ],
          ),
        ),
      ),
      bottomSheet: Stack(
        children: [
          Container(
            height: height * 0.22,
            width: double.infinity,
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 20),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Text(
                        "Total :",
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.w600),
                      ),
                      Text(
                        formatRupiah(totalPrice),
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w600,
                            color: ColorValue.kSecondary),
                      ),
                    ].withSpaceBetween(width: 40),
                  ),
                  My_Button(
                    onclick: () {
                      Get.offNamed("/address");
                    },
                    title: "Bayar",
                  ),
                ].withSpaceBetween(height: 20),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
