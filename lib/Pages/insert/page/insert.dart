import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:klambi_ta/Common/colors/color.dart';
import 'package:klambi_ta/Pages/insert/components/optional_note.dart';
import 'package:klambi_ta/Pages/menuprofile/pages/address/controller/address_controller.dart';
import 'package:klambi_ta/Pages/menuprofile/pages/address/Page/getLokasi.dart';
import 'package:klambi_ta/Pages/insert/components/nama.dart';
import 'package:klambi_ta/Pages/insert/components/telepon.dart';
import 'package:klambi_ta/Pages/insert/components/regional_province.dart';

class InsertAddressPageView extends StatelessWidget {
  final AddressController controller = Get.put(AddressController());
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  InsertAddressPageView({super.key});

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: _onWillPop,
      child: Scaffold(
        backgroundColor: ColorValue.kBackground,
        appBar: AppBar(
          title: Text(
            'Masukkan Alamat',
            style: TextStyle(
              fontFamily: 'General Sans',
              fontWeight: FontWeight.w500,
              fontSize: 24,
              color: ColorValue.kBlack,
            ),
          ),
        ),
        body: Obx(() {
          return SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 20),
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildSection("Kontak", [
                    Nama(onChanged: (value) => controller.namaLengkap.value = value),
                    Telepon(onChanged: (value) => controller.nomorTelepon.value = value),
                  ]),
                  _buildSection("Alamat", [
                    Provinsi(onCodeChanged: (value) => controller.provinsi.value = value),
                    Keterangan(onChanged: (value) => controller.keterangan.value = value),
                    TextButton(
                      onPressed: () async {
                        final address = await Get.to(GetLokasi());
                        if (address != null) {
                          controller.keterangan.value = address;
                        } else {
                          Get.snackbar('Warning', 'No location selected', snackPosition: SnackPosition.BOTTOM);
                        }
                      },
                      child: Text("Pilih Lokasi Map"),
                    ),
                    if (_isMapVisible()) _buildMap(),
                  ]),
                  SizedBox(height: 20),
                  _buildActionButtons(),
                  SizedBox(height: 20),
                ],
              ),
            ),
          );
        }),
      ),
    );
  }

  Future<bool> _onWillPop() async {
    return await showDialog(
      context: Get.context!,
      builder: (context) => AlertDialog(
        title: Text("Konfirmasi"),
        content: Text("Apakah Anda yakin ingin kembali? Semua data yang diisi akan hilang."),
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

  Widget _buildSection(String title, List<Widget> children) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          child: Text(title, style: TextStyle(fontSize: 15)),
        ),
        ...children,
      ],
    );
  }

  bool _isMapVisible() {
    return controller.latitude.value != 0.0 && controller.longitude.value != 0.0;
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
        zoomControlsEnabled: false,
        onMapCreated: (mapController) {
          controller.mapController = mapController;
        },
        scrollGesturesEnabled: true,
        tiltGesturesEnabled: true,
        rotateGesturesEnabled: true,
        mapToolbarEnabled: true,
      ),
    );
  }

  Widget _buildActionButtons() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        _buildButton('Konfirmasi', _handleConfirm),
      ],
    );
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

  Widget _buildButton(String title, VoidCallback onPressed) {
    return ElevatedButton(
      style: _buttonStyle(),
      onPressed: onPressed,
      child: Text(
        title,
        style: TextStyle(
          color: Colors.white,
          fontSize: 16,
          fontFamily: 'General Sans',
        ),
      ),
    );
  }

  ButtonStyle _buttonStyle() {
    return ElevatedButton.styleFrom(
      backgroundColor: ColorValue.kPrimary,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      padding: EdgeInsets.symmetric(vertical: 15, horizontal: 30),
      elevation: 5,
    );
  }
}
