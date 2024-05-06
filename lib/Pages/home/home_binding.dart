import 'package:get/get.dart';
import 'home_controller.dart';
import 'package:klambi_ta/Pages/register/register_controller.dart';

class HomeBinding extends Bindings{
  @override
  void dependencies(){
    Get.put(HomeController());
  }
}