import 'package:get/get.dart';
import 'package:klambi_ta/Pages/profile/cart/cart_controller.dart';

class CartBinding extends Bindings{
  @override
  void dependencies(){
    Get.put(CartController());
  }
}