import 'package:get/get.dart';
import 'package:klambi_ta/pages/cs/cs_controller.dart';

class CustomerServiceBinding extends Bindings{
  @override
  void dependencies(){
    Get.put(CustomerServiceController());
  }
}