import 'package:get/get.dart';
import 'package:klambi_ta/Pages/home/components/home_controller.dart';

class HomeBinding extends Bindings{
  @override
  void dependencies(){
    Get.put(HomeController());
  }
}