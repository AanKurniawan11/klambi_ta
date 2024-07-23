import 'package:get/get.dart';
import 'cs_controller.dart';

class CustomerServiceBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(CustomerServiceController());
  }
}
