import 'package:get/get.dart';
import 'package:klambi_ta/Pages/login/login_controller.dart';
import 'package:klambi_ta/Pages/register/register_controller.dart';

class loginbinding extends Bindings{
  @override
  void dependencies(){
    Get.put(LoginController());
  }
}