import 'package:get/get.dart';
import 'package:klambi_ta/profile/edit/edit_controller.dart';
import 'package:klambi_ta/profile/profile_controller.dart';

class EditBinding extends Bindings{
  @override
  void dependencies(){
    Get.put(EditController());
  }
}