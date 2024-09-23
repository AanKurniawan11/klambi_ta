import 'dart:convert';

import 'package:get/get.dart';
import 'package:klambi_ta/Pages/menuprofile/pages/chat/components/chatresponsemodel.dart';
import 'package:klambi_ta/Pages/menuprofile/pages/chat/components/showchatresponsemodel.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;


class ChatController extends GetxController {
  late final SharedPreferences prefs;
  var message = "".obs;
  var chatList = <Datum>[].obs;
  var isLoading = false.obs;
  var hasNoMessages = false.obs;

  @override
  void onInit() async {
    super.onInit();
    await setPreference();
    await _showMessageWithDelay();
  }

  Future<void> setPreference() async {
    prefs = await SharedPreferences.getInstance();
  }

  Future<void> sendchat(int id) async {
    var token = await prefs.getString("token");
    final chat = ChatResponseModel(
      receiverId: id,
      message: message.value,
    );

    print(message);
    if (chat.message.isEmpty) {
      print('Message field is required.');
      return; // Jangan lanjutkan jika pesan kosong
    }

    isLoading.value = true;
    try {
      final response = await http.post(
        Uri.parse('https://klambi.ta.rplrus.com/api/send-message'),
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $token',
        },
        body: jsonEncode(chat.toJson()),
      );

      print('Response body: ${response.body}'); // Tambahkan log ini
      if (response.statusCode == 200) {
        message.value = "";
        await _showMessageWithDelay();
      } else {
        print('Failed to send message: ${response.statusCode}');
        print('Response body: ${response.body}');
      }
    } catch (e) {
      print('Error: $e');
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> _showMessageWithDelay() async {
    isLoading.value = true;
    await Future.delayed(Duration(seconds: 3)); // Delay selama 10 detik

    await showMessage();
    isLoading.value = false;
  }

  Future<void> showMessage() async {
    var token = await prefs.getString("token");
    String url = 'https://klambi.ta.rplrus.com/api/get-message';

    try {
      final response = await http.get(
        Uri.parse(url),
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $token',
        },
      );

      if (response.statusCode == 200) {
        var jsonResponse = json.decode(response.body);
        ShowchatResponseModel chatResponse = ShowchatResponseModel.fromJson(jsonResponse);

        chatList.value = chatResponse.data;
        hasNoMessages.value = chatList.isEmpty;
      } else {
        print('Failed to retrieve messages: ${response.statusCode}');
      }
    } catch (e) {
      print('Error: $e');
    }
  }
}
