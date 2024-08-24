import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:klambi_ta/Pages/payment/controller/payment_controller.dart';
import '../../../Common/colors/color.dart';

class PaymentSelection extends StatefulWidget {
  final Function(String) onCodeChanged;

  PaymentSelection({super.key, required this.onCodeChanged});

  @override
  _PaymentSelectionState createState() => _PaymentSelectionState();
}

class _PaymentSelectionState extends State<PaymentSelection> {
  final PaymentController controller = Get.find(); // Use Get.find() to get the existing instance
  String _selectedPaymentMethod = 'Cash on Delivery';

  @override
  void initState() {
    super.initState();
    // Set the initial value of the controller
    controller.paymeth.value = _selectedPaymentMethod;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 5),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Pilih Metode Pembayaran',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              fontFamily: 'General Sans',
              color: ColorValue.kSecondary,
            ),
          ),
          const SizedBox(height: 10),
          Column(
            children: [
              ListTile(
                title: const Text('Cash on Delivery'),
                leading: Radio<String>(
                  value: 'Cash on Delivery',
                  groupValue: _selectedPaymentMethod,
                  activeColor: ColorValue.kPrimary,
                  onChanged: (String? value) {
                    if (value != null) {
                      setState(() {
                        _selectedPaymentMethod = value;
                        widget.onCodeChanged(value);
                        controller.paymeth.value = value; // Update the payment method in the controller
                      });
                    }
                  },
                ),
              ),
              // Tambahkan lebih banyak ListTile jika ada metode pembayaran lain
            ],
          ),
          const SizedBox(height: 20),
          ElevatedButton(
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(ColorValue.kPrimary),
              padding: MaterialStateProperty.all(
                const EdgeInsets.symmetric(vertical: 15, horizontal: 30),
              ),
              shape: MaterialStateProperty.all(
                RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
            ),
            onPressed: () {
              if (controller.paymeth.value.isEmpty) {
                // Check if a payment method is selected
                Get.snackbar('Error', 'Please select a payment method');
              } else {
                controller.addPay();
              }
            },
            child: const Text(
              'Konfirmasi',
              style: TextStyle(
                color: Colors.white,
                fontSize: 16,
                fontFamily: 'General Sans',
              ),
            ),
          ),
        ],
      ),
    );
  }
}
