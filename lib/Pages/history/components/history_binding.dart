import 'package:get/get.dart';
import 'package:klambi_ta/Pages/history/components/history_controller.dart';

class HistoryBinding extends Bindings{
  @override
  void dependencies(){
    Get.put(HistoryController());
  }
}