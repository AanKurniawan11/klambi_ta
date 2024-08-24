import 'package:flutter/material.dart';

class PaymentMethod {
  final String name;
  final String imagePath;

  PaymentMethod({required this.name, required this.imagePath});
}

class PayList extends StatefulWidget {
  final void Function(String, String) onPaymentMethodSelected;

  PayList({required this.onPaymentMethodSelected});

  @override
  _PayListState createState() => _PayListState();
}

class _PayListState extends State<PayList> {
  bool isDropdownOpen = false;
  int? selectedValue;
  String title = 'Pilih Metode Pembayaran';
  String image = "";

  List<PaymentMethod> paymentMethods = [
    PaymentMethod(name: 'Cash on Delivery', imagePath: 'assets/cod.png'),
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
                Icon(isDropdownOpen ? Icons.arrow_drop_down : Icons.arrow_drop_up),
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
                        width: width * 0.13,
                        height: height * 0.033,
                        foregroundDecoration: BoxDecoration(
                            image: DecorationImage(image: AssetImage(paymentMethods[index].imagePath), fit: BoxFit.cover)
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

                      // Call the callback function to update the payment method
                      widget.onPaymentMethodSelected(title, image);
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
