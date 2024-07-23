import 'package:get/get.dart';
import 'package:klambi_ta/Pages/address/components/address_controller.dart';

class AddressBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(AddressController());
  }
}
