import 'dart:async';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:klambi_ta/Common/routes/routes_name.dart';
import '../../../Common/colors/color.dart';
import '../../../component/format_price.dart';
import '../controller/payment_controller.dart';

class PaymentConfirmationPage extends StatefulWidget {
  @override
  _PaymentConfirmationPageState createState() => _PaymentConfirmationPageState();
}

class _PaymentConfirmationPageState extends State<PaymentConfirmationPage> {
  final PaymentController controller = Get.find();
  Timer? _paymentTimer;
  Duration _paymentDuration = Duration(hours: 24);
  String _timeLeft = '';

  @override
  void initState() {
    super.initState();
    _startPaymentTimer();
  }

  void _startPaymentTimer() {
    _paymentTimer?.cancel();
    _paymentTimer = Timer.periodic(Duration(seconds: 1), (timer) {
      setState(() {
        if (_paymentDuration.inSeconds > 0) {
          _paymentDuration -= Duration(seconds: 1);
          _timeLeft = _formatDuration(_paymentDuration);
        } else {
          _paymentTimer?.cancel();
        }
      });
    });
  }

  String _formatDuration(Duration duration) {
    String twoDigits(int n) => n.toString().padLeft(2, '0');
    final hours = twoDigits(duration.inHours.remainder(24));
    final minutes = twoDigits(duration.inMinutes.remainder(60));
    final seconds = twoDigits(duration.inSeconds.remainder(60));
    return "$hours:$minutes:$seconds";
  }

  @override
  void dispose() {
    _paymentTimer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final order = controller.orderData.value!;

    return Scaffold(
      appBar: AppBar(
        title: Text('Konfirmasi Pembayaran',style: TextStyle(color: Colors.white),),
        backgroundColor: ColorValue.kSecondary,
        elevation: 6,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Obx(() => Container(
          padding: EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.3),
                spreadRadius: 3,
                blurRadius: 5,
                offset: Offset(0, 3), // changes position of shadow
              ),
            ],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildTotalPaymentSection(order),
              SizedBox(height: 10),
              _buildPaymentDeadlineSection(),
              SizedBox(height: 20),
              _buildBankInfoSection(),
              SizedBox(height: 20),
              _buildVerificationInfoSection(),
              SizedBox(height: 20),
              _buildImageUploadSection(),
              SizedBox(height: 20),
              _buildConfirmButton(),
            ],
          ),
        )),
      ),
    );
  }

  Widget _buildTotalPaymentSection(order) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          "Total Pembayaran",
          style: TextStyle(
            fontFamily: 'General Sans',
            fontWeight: FontWeight.bold,
            fontSize: 16,
          ),
        ),
        Text(
          formatPrice(order.totalPrice ?? 0),
          style: TextStyle(
            fontFamily: 'General Sans',
            fontSize: 16,
            color: ColorValue.kPrimary,
          ),
        ),
      ],
    );
  }

  Widget _buildPaymentDeadlineSection() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          "Bayar Dalam:",
          style: TextStyle(
            fontFamily: 'General Sans',
            fontWeight: FontWeight.bold,
            fontSize: 16,
          ),
        ),
        Text(
          '$_timeLeft',
          style: TextStyle(
            fontFamily: 'General Sans',
            fontSize: 16,
            color: ColorValue.kSecondary,
          ),
        ),
      ],
    );
  }

  Widget _buildBankInfoSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Container(
              height: 50,
              width: 50,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("assets/bsi.png"),
                  fit: BoxFit.cover,
                ),
                borderRadius: BorderRadius.circular(10),
              ),
            ),
            SizedBox(width: 10),
            Text(
              'Bank Syariah Indonesia (BSI)',
              style: TextStyle(
                fontFamily: 'General Sans',
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
            ),
          ],
        ),
        Divider(color: ColorValue.kLightGrey),
        Text(
          'No. Rek/Virtual Account',
          style: TextStyle(
            fontFamily: 'General Sans',
            fontWeight: FontWeight.bold,
            fontSize: 16,
          ),
        ),
        Text(
          '600 0823 4075 9058',
          style: TextStyle(
            fontFamily: 'General Sans',
            fontSize: 16,
            color: ColorValue.kPrimary,
          ),
        ),
      ],
    );
  }

  Widget _buildVerificationInfoSection() {
    return Text(
      "Proses verifikasi kurang dari 10 menit setelah pembayaran berhasil",
      style: TextStyle(
        fontFamily: 'General Sans',
        fontSize: 16,
        color: ColorValue.kSecondary,
      ),
    );
  }

  Widget _buildImageUploadSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Unggah Bukti Pembayaran:',
          style: TextStyle(
            fontFamily: 'General Sans',
            fontWeight: FontWeight.bold,
            fontSize: 16,
          ),
        ),
        SizedBox(height: 10),
        GestureDetector(
          onTap: () async {
            await controller.pickImage();
          },
          child: Container(
            height: 200,
            width: double.infinity,
            decoration: BoxDecoration(
              border: Border.all(color: Colors.grey),
              borderRadius: BorderRadius.circular(10),
              image: controller.selectedImage != null
                  ? DecorationImage(
                image: FileImage(controller.selectedImage!),
                fit: BoxFit.cover,
              )
                  : null,
            ),
            child: controller.selectedImage == null
                ? Center(
              child: Icon(
                Icons.camera_alt,
                size: 50,
                color: Colors.grey,
              ),
            )
                : null,
          ),
        ),
      ],
    );
  }

  Widget _buildConfirmButton() {
    return Center(
      child: ElevatedButton(
        onPressed: controller.isLoading.value
            ? null
            : () async {
          await controller.confirmPayment();
          await controller.addHistory();
          Get.toNamed(RouteName.design);
          Get.back();
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: ColorValue.kPrimary,
          padding: EdgeInsets.symmetric(vertical: 16,horizontal: 16),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        child: controller.isLoading.value
            ? CircularProgressIndicator(
          color: Colors.white,
        )
            : Text(
          'Konfirmasi Pembayaran',
          style: TextStyle(
            fontFamily: 'General Sans',
            fontSize: 16,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
