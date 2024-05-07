import 'package:get/get.dart';
import 'package:klambi_ta/Pages/history/history_controller.dart';
import 'package:klambi_ta/Pages/whislist/whislist_controller.dart';

class WhislistBinding extends Bindings{
  @override
  void dependencies(){
    Get.put(WhislistController());
  }
}