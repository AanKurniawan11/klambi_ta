import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:geocoding/geocoding.dart';
import 'package:get/get.dart';
import 'package:klambi_ta/Pages/menuprofile/pages/address/controller/address_controller.dart';

import '../../../../../Common/colors/color.dart';

class GetLokasi extends StatefulWidget {
  GetLokasi({Key? key}) : super(key: key);

  @override
  State<GetLokasi> createState() => _GetLokasiState();
}

class _GetLokasiState extends State<GetLokasi> {
  String locationMessage = 'Current location';
  String address = '';
  GoogleMapController? _mapController;
  LatLng? _currentPosition;

  @override
  void initState() {
    super.initState();
    _getCurrentLocation();
  }

  Future<void> _getCurrentLocation() async {
    bool serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      return Future.error("Location services are disabled.");
    }

    LocationPermission permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return Future.error("Location permissions are denied.");
      }
    }

    if (permission == LocationPermission.deniedForever) {
      return Future.error("Location permissions are permanently denied.");
    }

    Position position = await Geolocator.getCurrentPosition();
    _currentPosition = LatLng(position.latitude, position.longitude);

    // Reverse Geocoding to get the address
    List<Placemark> placemarks = await placemarkFromCoordinates(position.latitude, position.longitude);
    Placemark place = placemarks[0];
    address = "${place.street}, ${place.locality}, ${place.postalCode}, ${place.country}";

    setState(() {
      locationMessage = 'Latitude: ${position.latitude}, Longitude: ${position.longitude}';
      _mapController?.animateCamera(CameraUpdate.newLatLng(_currentPosition!));
    });
  }

  Future<void> _updateAddress(LatLng position) async {
    List<Placemark> placemarks = await placemarkFromCoordinates(position.latitude, position.longitude);
    Placemark place = placemarks[0];
    setState(() {
      _currentPosition = position;
      address = "${place.subLocality}, ${place.locality}, ${place.postalCode}, ${place.subAdministrativeArea}, ${place.administrativeArea}";
      locationMessage = 'Latitude: ${position.latitude}, Longitude: ${position.longitude}';
    });
  }

  void _onMapCreated(GoogleMapController controller) {
    _mapController = controller;
  }

  void _onCameraIdle() async {
    if (_mapController != null) {
      LatLng centerPosition = await _mapController!.getLatLng(
        ScreenCoordinate(
          x: MediaQuery.of(context).size.width ~/ 2,
          y: MediaQuery.of(context).size.height ~/ 2,
        ),
      );
      _updateAddress(centerPosition);
    }
  }

  void _selectLocation() {
    if (_currentPosition != null) {
      final AddressController addressController = Get.find<AddressController>();

      addressController.latitude.value = _currentPosition!.latitude;
      addressController.longitude.value = _currentPosition!.longitude;
      print(addressController.latitude);
      print(addressController.longitude);
      Get.back(result: address);
    } else {
      print("Location is not selected yet.");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Maps"),
      ),
      body: Stack(
        children: <Widget>[
          GoogleMap(
            onMapCreated: _onMapCreated,
            initialCameraPosition: CameraPosition(
              target: _currentPosition ?? LatLng(0, 0),
              zoom: 15,
            ),
            myLocationEnabled: true,
            myLocationButtonEnabled: true,
            onCameraIdle: _onCameraIdle,
          ),
          Center(
            child: Icon(Icons.location_pin, size: 50, color: Colors.red),
          ),
          Positioned(
            bottom: 100,
            left: 10,
            right: 10,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 8),
                Text('$address', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
              ],
            ),
          ),
          Positioned(
            bottom: 20,
            left: 10,
            right: 10,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                // _buildElevatedButton(
                //   label: "Lokasi Saat ini",
                //   onPressed: _getCurrentLocation,
                // ),
                _buildElevatedButton(
                  label: "Simpan Lokasi",
                  onPressed: _selectLocation,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  ElevatedButton _buildElevatedButton({
    required String label,
    required VoidCallback onPressed,
  }) {
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
        elevation: MaterialStateProperty.all(8),
        shadowColor: MaterialStateProperty.all(Colors.black.withOpacity(0.3)),
      ),
      onPressed: onPressed,
      child: Text(
        label,
        style: TextStyle(
          color: Colors.white,
          fontSize: 16,
          fontFamily: 'General Sans',
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}
