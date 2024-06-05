import 'package:flutter/material.dart';
import 'package:klambi_ta/color.dart';
import 'package:klambi_ta/component/space_extension.dart';
import 'package:get/get.dart';
import '../../detail/detail.dart';
import '../../home/allproductresponsemodel.dart';

Future<void> _confirmDelete(BuildContext context) async {
  Datum items;
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
              Navigator.of(context).pop();
            },
          ),
        ],
      );
    },
  );
}

Widget WhislistCard(
  BuildContext context,
  Datum item,
) {
  final size = MediaQuery.of(context).size;

  return GestureDetector(
      onTap: () {
        Get.to(DetailView(item: item));
      },
      child: Dismissible(
        key: Key(item.id.toString()),
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
                    image: DecorationImage(image: AssetImage(item.imageUrl))),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      width: size.width * 0.6,
                      child: Text(
                        item.title,
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
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5),
                                border: Border.all(color: ColorValue.kPrimary),
                              ),
                            ),
                            Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5),
                                border: Border.all(color: ColorValue.kPrimary),
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
      ));
}

Widget ProductCard(List<Datum> itemList, RxList<Datum> productResponseAll) {
  return Column(
    children: [
      ListView.builder(
        itemCount: itemList.length,
        physics: NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        scrollDirection: Axis.vertical,
        itemBuilder: (context, index) {
          return WhislistCard(context, itemList[index]);
        },
      ),
      SizedBox(
        height: 150,
      ),
    ],
  );
}
