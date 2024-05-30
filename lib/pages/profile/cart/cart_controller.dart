import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../home/models/OversizeResponseModel.dart';

class CartController extends GetxController{
  RxList<Datum> responeCart = <Datum>[].obs;
  RxBool isRefresh = false.obs;

  void addCart(BuildContext context, Datum itemCart) {
    bool addList = false;
    for (var item in responeCart.value) {
      if (item.id == itemCart.id) {
        addList = true;
        break;
      }
    }
    if (!addList) {
      responeCart.value.add(itemCart);
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text("Item Add to Bag."),
          duration: Duration(seconds: 2),
        ),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text("Sudah ada."),
          duration: Duration(seconds: 2),
        ),
      );
    }
    print("add ${itemCart.title}");
    for (var item in responeCart.value) {
      print("old data : ${item.title}");
    }
  }

  void removeFromCart(BuildContext context, int id, String name) {
    responeCart.removeWhere((item) => item.id == id);

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('$name telah dihapus dari keranjang.'),
        duration: Duration(seconds: 2),
      ),
    );

    // Trigger a change by assigning a new list instance
    responeCart = responeCart.toList().obs;
  }

  void checkout(BuildContext context, String selectedPayment) {
    if (responeCart.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Cart is empty. Add items to proceed.'),
          duration: const Duration(seconds: 2),
        ),
      );
      return;
    }

    if (selectedPayment.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Please select a payment method.'),
          duration: const Duration(seconds: 2),
        ),
      );
      return;
    }

    // Perform payment logic here

    // Show a confirmation dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Transaction Complete'),
          content: Text('Thank you for your purchase!'),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
                // Clear the cart after successful purchase
                responeCart.clear();
              },
              child: Text('Close'),
            ),
          ],
        );
      },
    );
  }

  // void confirmDelete(BuildContext context) async {
  //   return showDialog<void>(
  //     context: context,
  //     barrierDismissible: false, // user must tap button!
  //     builder: (BuildContext context) {
  //       return AlertDialog(
  //         title: Text('Delete Product'),
  //         content: SingleChildScrollView(
  //           child: ListBody(
  //             children: <Widget>[
  //               Text('Are you sure you want to delete this product?'),
  //             ],
  //           ),
  //         ),
  //         actions: <Widget>[
  //           TextButton(
  //             child: Text('Cancel'),
  //             onPressed: () {
  //               Navigator.of(context).pop();
  //             },
  //           ),
  //           TextButton(
  //             child: Text('Delete'),
  //             onPressed: () {
  //               responeCart.onDelete();
  //               Navigator.of(context).pop();
  //             },
  //           ),
  //         ],
  //       );
  //     },
  //   );
  // }

}
