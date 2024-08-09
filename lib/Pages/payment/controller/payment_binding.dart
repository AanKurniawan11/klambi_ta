import 'package:get/get.dart';
import 'package:klambi_ta/Pages/payment/controller/payment_controller.dart';

class PaymentBinding extends Bindings{
  @override
  void dependencies(){
    Get.put((PaymentController));
  }
}