import 'package:get/get.dart';
import 'package:klambi_ta/Pages/register/register_controller.dart';

class registerbinding extends Bindings{
  @override
void dependencies(){
    Get.put(registercontroller());
  }
}