import 'package:get/get.dart';
import 'package:klambi_ta/Pages/menuprofile/pages/chat/controller/chat_controller.dart';

class ChatBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(ChatController());
  }
}
