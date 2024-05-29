import 'package:get/get.dart';
import 'package:klambi_ta/Pages/profile/edit/edit_controller.dart';

class EditBinding extends Bindings{
  @override
  void dependencies(){
    Get.put(EditController());
  }
}