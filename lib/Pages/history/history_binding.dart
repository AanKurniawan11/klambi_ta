import 'package:get/get.dart';
import 'package:klambi_ta/Pages/history/history_controller.dart';
import 'package:klambi_ta/Pages/register/register_controller.dart';

class HistoryBinding extends Bindings{
  @override
  void dependencies(){
    Get.put(HistoryController());
  }
}