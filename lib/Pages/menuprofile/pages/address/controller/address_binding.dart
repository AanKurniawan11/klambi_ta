import 'package:get/get.dart';
import 'package:klambi_ta/Pages/menuprofile/pages/address/controller/address_controller.dart';

class AddressBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(AddressController());
  }
}
