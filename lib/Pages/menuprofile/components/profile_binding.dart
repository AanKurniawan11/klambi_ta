import 'package:get/get.dart';
import 'package:klambi_ta/Pages/menuprofile/components/profile_controller.dart';

class ProfileBinding extends Bindings{
  @override
  void dependencies(){
    Get.put(ProfileController());
  }
}