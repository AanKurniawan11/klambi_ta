import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import '../../../Common/colors/color.dart';
import '../../../Common/routes/routes_name.dart';
import '../../../component/format_price.dart';
import '../../../component/sizesPay.dart';
import '../../home/components/home_controller.dart';
import '../../menuprofile/pages/address/controller/address_controller.dart';
import '../../payment/controller/payment_controller.dart';


class ProductModal extends StatelessWidget {
  final item;
  final PaymentController paymentController = Get.find<PaymentController>();
  final AddressController addressController = Get.find<AddressController>();
  final HomeController homeController = Get.find<HomeController>();

  ProductModal({required this.item});

  @override
  Widget build(BuildContext context) {
    final Size mediaQuery = MediaQuery.of(context).size;
    final double height = mediaQuery.height;
    final double width = mediaQuery.width;

    return ElevatedButton(
      onPressed: item.stock > 0 ? () => _showBottomSheet(context, width, height) : null,
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all(
            item.stock > 0 ? ColorValue.kPrimary : Colors.grey),
        minimumSize: MaterialStateProperty.all(Size(width * 0.85, height * 0.065)),
        shape: MaterialStateProperty.all(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12.0),
          ),
        ),
      ),
      child: Text(
        "Langsung Beli",
        style: const TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.w600,
          fontSize: 18,
        ),
      ),
    );
  }

  void _showBottomSheet(BuildContext context, double width, double height) {
    showMaterialModalBottomSheet(
      context: context,
      builder: (context) => SingleChildScrollView(
        controller: ModalScrollController.of(context),
        child: Container(
          height: height * 0.53,
          color: ColorValue.kWhite,
          padding: const EdgeInsets.all(15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _closeButton(context),
              _productInfo(context, width),
              const SizedBox(height: 20),
              _sectionTitle("Pilih Ukuran"),
              Divider(color: ColorValue.kLightGrey),
              _sizePicker(context),
              const SizedBox(height: 10),
              Divider(color: ColorValue.kLightGrey),
              _quantitySelector(context, width, height),
              const SizedBox(height: 20),
              _buyButton(context, width, height),
            ],
          ),
        ),
      ),
    );
  }

  Widget _closeButton(BuildContext context) {
    return GestureDetector(
      onTap: () => Get.back(),
      child: Align(
        alignment: Alignment.topRight,
        child: Icon(Icons.close),
      ),
    );
  }

  Widget _productInfo(BuildContext context, double width) {
    return Row(
      children: [
        Container(
          height: 100,
          width: 100,
          foregroundDecoration: BoxDecoration(
            image: DecorationImage(
              image: NetworkImage(homeController.imageUrl(item.imagee)),
            ),
          ),
        ),
        const SizedBox(width: 10),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: width * 0.6,
              child: Text(
                item.title,
                style: TextStyle(fontFamily: "General Sans"),
                maxLines: 2,
              ),
            ),
            Text(
              formatPrice(item.price),
              style: TextStyle(
                fontFamily: "General Sans",
                fontSize: 16,
                color: ColorValue.kSecondary,
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _sectionTitle(String title) {
    return Text(
      title,
      style: TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.w500,
        color: ColorValue.kDarkGrey,
      ),
    );
  }

  Widget _sizePicker(BuildContext context) {
    return SizesPay(
      onChanged: (value) {
        paymentController.size.value = value;
      },
    );
  }

  Widget _quantitySelector(BuildContext context, double width, double height) {
    return Obx(() {
      return Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            "Jumlah",
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w500,
              color: ColorValue.kDarkGrey,
            ),
          ),
          Container(
            width: width * 0.26,
            height: height * 0.04,
            decoration: BoxDecoration(
              color: ColorValue.kLightGrey,
              border: Border.all(color: ColorValue.kDarkGrey),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                  icon: Icon(Icons.remove, size: 10),
                  onPressed: () {
                    if (paymentController.quantity.value > 1) {
                      paymentController.quantity.value--;
                    }
                  },
                ),
                Text(
                  paymentController.quantity.value.toString(),
                  style: TextStyle(fontSize: 10),
                ),
                IconButton(
                  icon: Icon(Icons.add, size: 10),
                  onPressed: () {
                    if (paymentController.quantity.value < item.stock) {
                      paymentController.quantity.value++;
                    } else {
                      _showStockAlert(context);
                    }
                  },
                ),
              ],
            ),
          ),
        ],
      );
    });
  }

  Widget _buyButton(BuildContext context, double width, double height) {
    return Center(
      child: GestureDetector(
        onTap: () {
          if (paymentController.quantity.value > 0 &&
              paymentController.size.value != null) {
            if (addressController.Show.isNotEmpty) {
              paymentController.addOrder(item.id);
              Get.toNamed(RouteName.payment);
            } else {
              _showAddressAlert(context);
            }
          } else if (paymentController.size.value == null) {
            _showSizeAlert(context);
          } else {
            Get.snackbar(
              "Kuantitas Tidak Valid",
              "Jumlah produk tidak boleh nol",
              snackPosition: SnackPosition.BOTTOM,
              backgroundColor: Colors.red,
              colorText: Colors.white,
            );          }
        },
        child: Container(
          width: width * 0.8,
          height: height * 0.06,
          decoration: BoxDecoration(
            color: ColorValue.kPrimary,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Center(
            child: Text(
              "Beli",
              style: TextStyle(
                fontFamily: "General Sans",
                color: ColorValue.kWhite,
              ),
            ),
          ),
        ),
      ),
    );
  }

  void _showStockAlert(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text("Stok Terbatas"),
        content: Text("Jumlah produk melebihi stok yang tersedia."),
        actions: <Widget>[
          TextButton(
            child: Text("OK"),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ],
      ),
    );
  }

  void _showAddressAlert(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        backgroundColor: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
        title: Row(
          children: [
            Icon(Icons.warning, color: Colors.amber, size: 24),
            SizedBox(width: 8),
            Text("Alamat Belum Diisi", style: TextStyle(fontSize: 18)),
          ],
        ),
        content: Text(
          "Silakan isi alamat Anda sebelum melanjutkan.",
          style: TextStyle(fontSize: 16),
        ),
        actions: <Widget>[
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: ColorValue.kSecondary, // Ganti dengan warna yang diinginkan
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
            ),
            child: Text("Tambah Alamat"),
            onPressed: () {
              Navigator.of(context).pop();
              Get.toNamed(RouteName.addAddress);
            },
          ),
        ],
      ),
    );
  }

  void _showSizeAlert(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text("Ukuran Belum Dipilih"),
        content: Text("Silakan pilih ukuran produk."),
        actions: <Widget>[
          TextButton(
            child: Text("OK"),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ],
      ),
    );
  }

  void _showQuantityAlert(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text("Jumlah Tidak Valid"),
        content: Text("Silakan pilih jumlah produk yang ingin dibeli."),
        actions: <Widget>[
          TextButton(
            child: Text("OK"),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ],
      ),
    );
  }
}
