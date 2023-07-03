import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class ChatScreenController extends GetxController {
  //TODO: Implement ChatScreenController
  RxString title = 'Chat'.obs;
  RxString chatRoomId = ''.obs;
  RxString userId = 'xA5lRs5krEa3LKEeVhvT'.obs;
  var chatMessages = [].obs;
  TextEditingController messageController = TextEditingController();

  @override
  void onInit() {
    final arguments = Get.arguments;
    chatRoomId.value = arguments;

    fetchMessages();

    super.onInit();
  }

  void fetchMessages() {
    // create a stream to listen to the messages
    Stream chatStream = FirebaseFirestore.instance
        .collection('chatrooms')
        .doc(chatRoomId.value)
        .collection('chats')
        .orderBy('time', descending: true)
        .snapshots();
    // listen to the stream and add the messages to the chatMessages list
    chatStream.listen((event) {
      chatMessages.value = event.docs;
      print(chatMessages);
      print(chatStream);
    });
  }

  void sendMessage() {
    // check if the message is empty or not
    if (messageController.text.isNotEmpty) {
      // create a map to store the message and the time
      Map<String, dynamic> messageMap = {
        'message': messageController.text,
        'time': DateTime.now(),
        'sendBy': userId.value
      };
      // add the message to the chatroom
      FirebaseFirestore.instance
          .collection('chatrooms')
          .doc(chatRoomId.value)
          .collection('chats')
          .add(messageMap);
      // clear the message controller
      messageController.clear();
    }
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }
}
