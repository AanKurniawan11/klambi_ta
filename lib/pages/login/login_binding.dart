import 'package:get/get.dart';
import 'package:klambi_ta/Pages/login/login_controller.dart';

class loginbinding extends Bindings{
  @override
  void dependencies(){
    Get.put(LoginController());
  }
}