import 'package:get/get.dart';
import 'package:klambi_ta/Pages/detail/components/detail_controller.dart';

class DetailBinding extends Bindings{
  @override
  void dependencies(){
    Get.put(DetailController());
  }
}