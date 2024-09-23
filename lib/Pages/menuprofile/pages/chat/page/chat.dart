
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:klambi_ta/Common/colors/color.dart';
import 'package:klambi_ta/Pages/menuprofile/pages/chat/controller/chat_controller.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

class ChatPage extends StatelessWidget {
  final ChatController chatController = Get.put(ChatController());
  final ImagePicker _picker = ImagePicker();
  final TextEditingController _messageController = TextEditingController();

  Future<void> _pickImage() async {
    final XFile? image = await _picker.pickImage(source: ImageSource.gallery);
    if (image != null) {
      // Kirim gambar ke chatController atau server
      // chatController.sendImage(File(image.path)); // Ganti dengan fungsi kirim gambar yang sesuai
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Chat', style: TextStyle(color: Colors.white)),
        backgroundColor: ColorValue.kPrimary,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Get.offAllNamed("/navbar"),
        ),
      ),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: Obx(() {
                if (chatController.isLoading.value) {
                  return Center(
                    child: LoadingAnimationWidget.discreteCircle(
                        color: ColorValue.kPrimary, size: 40), // Indikator loading
                  );
                }
                if (chatController.hasNoMessages.value) {
                  return Center(
                    child: Text(
                      "No messages yet",
                      style: TextStyle(color: Colors.grey, fontSize: 16),
                    ),
                  );
                }

                return ListView.builder(
                  padding: EdgeInsets.all(10.0),
                  itemCount: chatController.chatList.length,
                  itemBuilder: (context, index) {
                    final chat = chatController.chatList[index];
                    bool isSender = chat.senderType == "Me"; // Contoh pengecekan apakah pengirim adalah pengguna
                    return Align(
                      alignment: isSender ? Alignment.centerRight : Alignment.centerLeft,
                      child: Container(
                        margin: EdgeInsets.symmetric(vertical: 5),
                        padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                        decoration: BoxDecoration(
                          color: isSender ? ColorValue.kPrimary : Colors.grey.shade200,
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(20),
                            topRight: Radius.circular(20),
                            bottomLeft: isSender ? Radius.circular(20) : Radius.circular(0),
                            bottomRight: isSender ? Radius.circular(0) : Radius.circular(20),
                          ),
                        ),
                        child: Column(
                          crossAxisAlignment:
                          isSender ? CrossAxisAlignment.end : CrossAxisAlignment.start,
                          children: [
                            if (chat.message.isNotEmpty)
                              Text(
                                chat.message,
                                style: TextStyle(
                                  color: isSender ? Colors.white : Colors.black,
                                  fontSize: 16,
                                ),
                              ),
                            SizedBox(height: 5),
                            Text(
                              chat.createdAt.toString(),
                              style: TextStyle(
                                color: isSender ? Colors.white70 : Colors.grey,
                                fontSize: 12,
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                );
              }),
            ),
            Container(
              color: Colors.white,
              padding: EdgeInsets.symmetric(horizontal: 8.0, vertical: 10.0),
              child: Row(
                children: [
                  IconButton(
                    icon: Icon(Icons.image, color: ColorValue.kPrimary),
                    onPressed: _pickImage,
                  ),
                  Expanded(
                    child: TextField(
                      controller: _messageController,
                      onChanged: (value) {
                        chatController.message.value = value;
                      },
                      decoration: InputDecoration(
                        hintText: "Type your message...",
                        filled: true,
                        fillColor: Colors.grey.shade200,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30),
                          borderSide: BorderSide.none,
                        ),
                        contentPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                      ),
                    ),
                  ),
                  SizedBox(width: 10),
                  CircleAvatar(
                    radius: 25,
                    backgroundColor: ColorValue.kPrimary,
                    child: IconButton(
                      icon: Icon(Icons.send, color: Colors.white),
                      onPressed: () {
                        chatController.sendchat(1); // Ganti dengan ID penerima yang sesuai
                        _messageController.clear(); // Hapus pesan setelah mengirim
                      },
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
