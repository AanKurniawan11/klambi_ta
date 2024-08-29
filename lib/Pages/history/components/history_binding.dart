import 'package:get/get.dart';

import '../page/testcontroller.dart';

class HistoryBinding extends Bindings{
  @override
  void dependencies(){
    Get.put(HistoryController());
  }
}