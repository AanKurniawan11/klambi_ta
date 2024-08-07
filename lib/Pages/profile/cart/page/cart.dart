import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:intl/intl.dart';
import 'package:klambi_ta/component/cart/cart_controllers.dart';
import 'package:klambi_ta/component/my_elevatedbutton.dart';
import 'package:klambi_ta/component/mytext.dart';
import 'package:klambi_ta/component/space_extension.dart';
import 'package:klambi_ta/Common/colors/color.dart';
import 'package:klambi_ta/component/cart/cart_product.dart';
import 'package:klambi_ta/component/home/model.dart';


// class Cart extends StatefulWidget {
//   const Cart({super.key});
//
//   @override
//   _CartState createState() => _CartState();
// }
//
// class _CartState extends State<Cart> {
//   List<Product> products = List.from(demoProducts);
//   List<int> quantities = List<int>.filled(demoProducts.length, 3);
//
//   String formatRupiah(double amount) {
//     final NumberFormat formatter = NumberFormat.currency(
//       locale: 'id_ID',
//       symbol: 'Rp ',
//       decimalDigits: 0,
//     );
//     return formatter.format(amount);
//   }
//
//   double get totalPrice {
//     double total = 0;
//     for (int i = 0; i < products.length; i++) {
//       total += products[i].price * quantities[i];
//     }
//     return total;
//   }
//
//   void _handleDelete(int index) {
//     setState(() {
//       products.removeAt(index);
//       quantities.removeAt(index);
//     });
//   }
//
//   void _handleQuantityChange(int index, int quantity) {
//     setState(() {
//       quantities[index] = quantity;
//     });
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     final Size mediaquery = MediaQuery.of(context).size;
//     final double height = mediaquery.height;
//     final double width = mediaquery.width;
//
//     return Scaffold(
//       appBar: AppBar(
//         title: Text(
//           "Keranjangku",
//           textAlign: TextAlign.center,
//           style: TextStyle(fontSize: 24, fontWeight: FontWeight.w500),
//         ),
//         leading: IconButton(
//             onPressed: () {
//               // Get.back(closeOverlays: bool.fromEnvironment("/navbar"));
//               Get.back();
//             },
//             icon: Icon(Icons.arrow_back)),
//         centerTitle: true,
//         toolbarHeight: height * 0.1,
//       ),
//       body: SafeArea(
//         child: SingleChildScrollView(
//           scrollDirection: Axis.vertical,
//           child: Column(
//             children: [
//               ListView.builder(
//                 itemCount: products.length,
//                 physics: NeverScrollableScrollPhysics(),
//                 shrinkWrap: true,
//                 scrollDirection: Axis.vertical,
//                 itemBuilder: (context, index) {
//                   return CartProduct(
//                     item: products[index],
//                     onDelete: () {
//                       _handleDelete(index);
//                     },
//                     onQuantityChanged: (quantity) {
//                       _handleQuantityChange(index, quantity);
//                     },
//                     formatRupiah: formatRupiah,
//                   );
//                 },
//               ),
//               SizedBox(
//                 height: 150,
//               ),
//             ],
//           ),
//         ),
//       ),
//       bottomSheet: Stack(
//         children: [
//           Container(
//             height: height * 0.2,
//             width: double.infinity,
//             child: Padding(
//               padding: const EdgeInsets.symmetric(vertical: 25),
//               child: Column(
//                 children: [
//                   Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceAround,
//                     children: [
//                       Text(
//                         "Total :",
//                         style: TextStyle(
//                             fontSize: 20, fontWeight: FontWeight.w600),
//                       ),
//                       Text(
//                         formatRupiah(totalPrice),
//                         style: TextStyle(
//                             fontSize: 20,
//                             fontWeight: FontWeight.w600,
//                             color: ColorValue.kSecondary),
//                       ),
//                     ].withSpaceBetween(width: 30),
//                   ),
//                   My_Button(
//                     onclick: () {},
//                     title: "Bayar",
//                   ),
//                 ].withSpaceBetween(height: 25),
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }

// class Cart extends StatelessWidget {
//    Cart({super.key});
//   final CartControllers controllers = Get.put(CartControllers());
//
//    Future<void> _confirmDelete(BuildContext context) async {
//      return showDialog<void>(
//        context: context,
//        barrierDismissible: false, // user must tap button!
//        builder: (BuildContext context) {
//          return AlertDialog(
//            title: Text('Delete Product'),
//            content: SingleChildScrollView(
//              child: ListBody(
//                children: <Widget>[
//                  Text('Are you sure you want to delete this product?'),
//                ],
//              ),
//            ),
//            actions: <Widget>[
//              TextButton(
//                child: Text('Cancel'),
//                onPressed: () {
//                  Navigator.of(context).pop();
//                },
//              ),
//              TextButton(
//                child: Text('Delete'),
//                onPressed: () {
//                  controllers.onDelete();
//                  Navigator.of(context).pop();
//                },
//              ),
//            ],
//          );
//        },
//      );
//    }
//
//    @override
//    Widget build(BuildContext context) {
//      final size = MediaQuery.of(context).size;
//
//      return Dismissible(
//        key: Key(controllers.id.toString()),
//        direction: DismissDirection.startToEnd,
//        onDismissed: (direction) {
//          _confirmDelete(context); // Show delete confirmation dialog
//        },
//        background: Container(
//          color: Colors.red,
//          alignment: Alignment.centerLeft,
//          padding: EdgeInsets.symmetric(horizontal: 20),
//          child: Icon(
//            Icons.delete,
//            color: Colors.white,
//          ),
//        ),
//        child: Padding(
//          padding: const EdgeInsets.symmetric(horizontal: 30),
//          child: Row(
//            children: [
//              Container(
//                width: size.width * 0.2,
//                height: size.height * 0.1,
//                foregroundDecoration: BoxDecoration(
//                    image: DecorationImage(image: AssetImage(controllers.imageUrl.value))),
//              ),
//              Padding(
//                padding: const EdgeInsets.symmetric(vertical: 20),
//                child: Column(
//                  crossAxisAlignment: CrossAxisAlignment.start,
//                  children: [
//                    Container(
//                      width: size.width * 0.6,
//                      child: Text(
//                        controllers.productTitle.value,
//                        style: TextStyle(
//                          fontSize: 18,
//                          fontWeight: FontWeight.w400,
//                          fontFamily: "General Sans",
//                          overflow: TextOverflow.ellipsis,
//                        ),
//                        maxLines: 2,
//                      ),
//                    ),
//                    Text(
//                      "ukuran : S",
//                      style: TextStyle(
//                        fontSize: 14,
//                        fontWeight: FontWeight.w500,
//                        fontFamily: "General Sans",
//                        color: ColorValue.kDarkGrey,
//                      ),
//                    ),
//                    Row(
//                      children: [
//                        Text(
//                          (controllers.productPrice.toString()),
//                          style: TextStyle(
//                            fontSize: 18,
//                            fontWeight: FontWeight.w600,
//                            fontFamily: "General Sans",
//                            color: ColorValue.kSecondary,
//                          ),
//                        ),
//                      ].withSpaceBetween(width: 70),
//                    ),
//                  ],
//                ),
//              ),
//            ].withSpaceBetween(width: 14),
//          ),
//        ),
//      );
//    }
// }
