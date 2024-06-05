import 'package:get/get.dart';
import 'cart_controllers.dart';


class CartBinding extends Bindings{
  @override
  void dependencies(){
    Get.put(CartControllers());
  }
}