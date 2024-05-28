import 'package:get/get.dart';
import 'package:klambi_ta/Pages/design/design_controller.dart';

class DesignBinding extends Bindings{
  @override
  void dependencies(){
    Get.put(DesignController());
  }
}