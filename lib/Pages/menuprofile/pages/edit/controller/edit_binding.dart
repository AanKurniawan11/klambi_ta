import 'package:get/get.dart';
import 'package:klambi_ta/Pages/menuprofile/pages/edit/controller/edit_controller.dart';

class EditBinding extends Bindings{
  @override
  void dependencies(){
    Get.put(EditController());
  }
}