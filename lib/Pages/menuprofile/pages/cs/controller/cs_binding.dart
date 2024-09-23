import 'package:get/get.dart';
import 'package:klambi_ta/Pages/menuprofile/pages/cs/controller/cs_controller.dart';

class CustomerServiceBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(CustomerServiceController());
  }
}
