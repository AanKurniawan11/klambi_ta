import 'package:get/get.dart';
import 'package:klambi_ta/Pages/profile/cart/components/cart_controllers.dart';

class CartBinding extends Bindings{
  @override
  void dependencies(){
    Get.put(CartControllers());
  }
}