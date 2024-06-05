import 'package:flutter/material.dart';
import 'package:klambi_ta/color.dart';
import 'package:klambi_ta/component/space_extension.dart';
import '../../../home/model.dart';


class CartProduct extends StatefulWidget {
  final Product item;
  final Function onDelete;
  final Function(int) onQuantityChanged;
  final String Function(double) formatRupiah;

  CartProduct({
    required this.item,
    required this.onDelete,
    required this.onQuantityChanged,
    required this.formatRupiah,
  });

  @override
  _CartProductState createState() => _CartProductState();
}

class _CartProductState extends State<CartProduct> {
  int quantity = 3; // Initial quantity

  void _incrementQuantity() {
    setState(() {
      quantity++;
      widget.onQuantityChanged(quantity);
    });
  }

  void _decrementQuantity() {
    if (quantity > 0) {
      setState(() {
        quantity--;
        widget.onQuantityChanged(quantity);
      });
    }
  }

  Future<void> _confirmDelete(BuildContext context) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Delete Product'),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Text('Are you sure you want to delete this product?'),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: Text('Cancel'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: Text('Delete'),
              onPressed: () {
                widget.onDelete();
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Dismissible(
      key: Key(widget.item.id.toString()),
      direction: DismissDirection.startToEnd,
      onDismissed: (direction) {
        _confirmDelete(context); // Show delete confirmation dialog
      },
      background: Container(
        color: Colors.red,
        alignment: Alignment.centerLeft,
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: Icon(
          Icons.delete,
          color: Colors.white,
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30),
        child: Row(
          children: [
            Container(
              width: size.width * 0.2,
              height: size.height * 0.1,
              foregroundDecoration: BoxDecoration(
                  image: DecorationImage(image: AssetImage(widget.item.image))),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: size.width * 0.6,
                    child: Text(
                      widget.item.title,
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w400,
                        fontFamily: "General Sans",
                        overflow: TextOverflow.ellipsis,
                      ),
                      maxLines: 2,
                    ),
                  ),
                  Text(
                    "ukuran : S",
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                      fontFamily: "General Sans",
                      color: ColorValue.kDarkGrey,
                    ),
                  ),
                  Row(
                    children: [
                      Text(
                        widget.formatRupiah(widget.item.price.toDouble()),
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                          fontFamily: "General Sans",
                          color: ColorValue.kSecondary,
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              border: Border.all(color: ColorValue.kPrimary),
                            ),
                            child: InkWell(
                              onTap: _decrementQuantity,
                              child: const Icon(
                                Icons.remove,
                                size: 16,
                              ),
                            ),
                          ),
                          Text(
                            '$quantity',
                            style: TextStyle(color: Colors.black, fontSize: 16),
                          ),
                          Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              border: Border.all(color: ColorValue.kPrimary),
                            ),
                            child: InkWell(
                              onTap: _incrementQuantity,
                              child: const Icon(
                                Icons.add,
                                size: 16,
                              ),
                            ),
                          ),
                        ].withSpaceBetween(width: 5),
                      ),
                    ].withSpaceBetween(width: 70),
                  ),
                ],
              ),
            ),
          ].withSpaceBetween(width: 14),
        ),
      ),
    );
  }
}
