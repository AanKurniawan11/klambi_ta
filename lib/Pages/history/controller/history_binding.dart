import 'package:get/get.dart';

import 'historycontroller.dart';

class HistoryBinding extends Bindings{
  @override
  void dependencies(){
    Get.put(HistoryController());
  }
}