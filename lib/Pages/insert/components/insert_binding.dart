import 'package:get/get.dart';
import 'package:klambi_ta/Pages/insert/components/insert_controller.dart';

class InserAddressBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(InsertAddressController());
  }
}
