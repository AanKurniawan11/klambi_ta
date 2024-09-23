import 'package:flutter/material.dart';

class DeliverMethod {
  final String name;
  final String imagePath;

  DeliverMethod({required this.name, required this.imagePath});
}

class DeliverOpsi extends StatefulWidget {
  @override
  _DeliverOpsiState createState() => _DeliverOpsiState();
}

class _DeliverOpsiState extends State<DeliverOpsi> {
  bool isDropdownOpen = false;
  int? selectedValue;
  String title = 'Pilih Metode Pengiriman';
  String image = "";

  List<DeliverMethod> paymentMethods = [
    DeliverMethod(name: 'Cash On Delivery', imagePath: 'assets/gopay.png'),
    // DeliverMethod(name: 'Reguler', imagePath: 'assets/sicepat.png'),
    // DeliverMethod(name: 'Instant', imagePath: 'assets/lgo1.png'),
  ];

  @override
  Widget build(BuildContext context) {
    final Size mediaquery = MediaQuery.of(context).size;
    final double height = mediaquery.height;
    final double width = mediaquery.width;
    return Column(
      children: [
        GestureDetector(
          onTap: () {
            setState(() {
              isDropdownOpen = !isDropdownOpen;
            });
          },
          child: Container(
            decoration: BoxDecoration(
              border: Border.all(color: Colors.grey),
              borderRadius: BorderRadius.circular(10),
            ),
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(title, style: TextStyle(fontSize: 16)),
                Icon(isDropdownOpen ?  Icons.arrow_drop_down : Icons.arrow_drop_up),
              ],
            ),
          ),
        ),
        if (isDropdownOpen)
          Container(
            decoration: BoxDecoration(
              border: Border.all(color: Colors.grey),
              borderRadius: BorderRadius.circular(10),
            ),
            margin: EdgeInsets.only(top: 10),
            child: ListView.builder(
              shrinkWrap: true,
              itemCount: paymentMethods.length,
              itemBuilder: (context, index) {
                return RadioListTile(
                  title: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(paymentMethods[index].name),
                      SizedBox(width: 10),
                      Container(
                        width: width * 0.1,
                        height: height * 0.05,
                        foregroundDecoration: BoxDecoration(
                            image: DecorationImage(image: AssetImage(paymentMethods[index].imagePath),fit:BoxFit.cover)
                        ),
                      )
                    ],
                  ),
                  value: index,
                  groupValue: selectedValue,
                  onChanged: (val) {
                    setState(() {
                      selectedValue = val as int?;
                      title = paymentMethods[index].name;
                      image = paymentMethods[index].imagePath;
                      isDropdownOpen = false;
                    });
                  },
                );
              },
            ),
          ),
      ],
    );
  }
}