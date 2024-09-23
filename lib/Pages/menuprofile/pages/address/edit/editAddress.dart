import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:klambi_ta/Common/routes/routes_name.dart';
import 'package:klambi_ta/Pages/history/controller/historycontroller.dart';
import 'package:klambi_ta/Pages/insert/components/nama.dart';
import 'package:klambi_ta/Pages/insert/components/optional_note.dart';
import 'package:klambi_ta/Pages/insert/components/regional_province.dart';
import 'package:klambi_ta/Pages/insert/components/telepon.dart';
import 'package:klambi_ta/Pages/menuprofile/pages/address/Page/getLokasi.dart';
import 'package:klambi_ta/common/colors/color.dart';
import '../controller/address_controller.dart';

class EditAddressView extends StatelessWidget {
  final int addressId;
  final AddressController controller = Get.put(AddressController());
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();


  EditAddressView({required this.addressId, super.key});

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: _onWillPop,
      child: Scaffold(
        backgroundColor: ColorValue.kBackground,
        appBar: AppBar(
          title: Text(
            'Edit Alamat',
            style: TextStyle(
              fontFamily: 'General Sans',
              fontWeight: FontWeight.w500,
              fontSize: 24,
              color: ColorValue.kBlack,
            ),
          ),
          leading: IconButton(
            onPressed: () {
              _onWillPop();
            },
            icon: Icon(Icons.arrow_back),
          ),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 20),
            child: Column(
              children: [
                _buildContactSection(),
                _buildAddressSection(),
                SizedBox(height: 20),
                _buildSaveButton(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<bool> _onWillPop() async {
    return await showDialog(
      context: Get.context!,
      builder: (context) => AlertDialog(
        title: Text("Konfirmasi"),
        content: Text("Apakah Anda yakin ingin kembali? Perubahan yang belum disimpan akan hilang."),
        actions: <Widget>[
          TextButton(
            child: Text("Tidak"),
            onPressed: () => Navigator.of(context).pop(false),
          ),
          TextButton(
            child: Text("Ya"),
            onPressed: () => Navigator.of(context).pop(true),
          ),
        ],
      ),
    ) ?? false; // Mengembalikan false jika dialog tidak diisi
  }

  Widget _buildContactSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          child: Text("Kontak", style: TextStyle(fontSize: 15, fontFamily: "General Sans")),
        ),
        Nama(onChanged: (value) => controller.namaLengkap.value = value),
        Telepon(onChanged: (value) => controller.nomorTelepon.value = value),
      ],
    );
  }

  Widget _buildAddressSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          child: Text("Alamat", style: TextStyle(fontSize: 15, fontFamily: "General Sans")),
        ),
        Provinsi(onCodeChanged: (value) => controller.provinsi.value = value),
        Keterangan(onChanged: (value) => controller.keterangan.value = value),
        SizedBox(height: 20),
        TextButton(
          onPressed: () async {
            final address = await Get.to(GetLokasi());
            if (address != null) {
              controller.keterangan.value = address;
            } else {
              Get.snackbar('Warning', 'No location selected', snackPosition: SnackPosition.BOTTOM);
            }
          },
          child: Text("Ubah Lokasi Map"),
        ),
        if (_isMapVisible()) _buildMap(),
      ],
    );
  }

  Widget _buildSaveButton() {
    return ElevatedButton(
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all(ColorValue.kPrimary),
        shape: MaterialStateProperty.all(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),
        padding: MaterialStateProperty.all(
          EdgeInsets.symmetric(vertical: 15, horizontal: 30),
        ),
        elevation: MaterialStateProperty.all(5),
      ),
      onPressed: () {
        // Validasi data sebelum menyimpan
        if (controller.namaLengkap.value.isEmpty) {
          Get.snackbar('Error', 'Nama lengkap harus diisi', snackPosition: SnackPosition.BOTTOM);
          return;
        }
        if (controller.nomorTelepon.value.isEmpty) {
          Get.snackbar('Error', 'Nomor telepon harus diisi', snackPosition: SnackPosition.BOTTOM);
          return;
        }
        if (controller.provinsi.value.isEmpty) {
          Get.snackbar('Error', 'Provinsi harus dipilih', snackPosition: SnackPosition.BOTTOM);
          return;
        }
        if (controller.keterangan.value.isEmpty) {
          Get.snackbar('Error', 'Keterangan alamat harus diisi', snackPosition: SnackPosition.BOTTOM);
          return;
        }
        if (controller.latitude.value == 0.0 || controller.longitude.value == 0.0) {
          Get.snackbar('Error', 'Lokasi harus dipilih di peta', snackPosition: SnackPosition.BOTTOM);
          return;
        }

        controller.updateAddress(addressId);
        Get.offAllNamed(RouteName.addAddress);
      },
      child: Text('Simpan', style: TextStyle(
        color: Colors.white,
        fontSize: 16,
        fontFamily: 'General Sans',
      )),
    );
  }

  bool _isMapVisible() {
    return controller.latitude.value != 0.0 && controller.longitude.value != 0.0;
  }

  void _handleConfirm() async {
    if (_formKey.currentState!.validate() && controller.isValidForm()) {
      try {
        await controller.submitAddress();
        Get.offAllNamed("/addAddress");
      } catch (e) {
        Get.snackbar('Error', 'Failed to submit address', snackPosition: SnackPosition.BOTTOM);
      }
    } else {
      Get.snackbar('Error', 'Pastikan semua field terisi dengan benar.', snackPosition: SnackPosition.BOTTOM);
    }
  }

  Widget _buildMap() {
    return SizedBox(
      height: 300,
      width: double.infinity,
      child: GoogleMap(
        initialCameraPosition: CameraPosition(
          target: LatLng(controller.latitude.value, controller.longitude.value),
          zoom: 15,
        ),
        markers: {
          Marker(
            markerId: MarkerId('selected-location'),
            position: LatLng(controller.latitude.value, controller.longitude.value),
          ),
        },
        gestureRecognizers: Set(),
        zoomControlsEnabled: false,
        scrollGesturesEnabled: false,
        tiltGesturesEnabled: false,
        rotateGesturesEnabled: false,
        mapToolbarEnabled: false,
      ),
    );
  }
}
