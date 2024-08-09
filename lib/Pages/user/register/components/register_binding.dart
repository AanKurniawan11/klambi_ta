import 'package:get/get.dart';
import 'package:klambi_ta/Pages/user/register/components/register_controller.dart';

class Registerbinding extends Bindings{
  @override
void dependencies(){
    Get.put(RegisterController());
  }
}