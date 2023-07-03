import 'package:get/get.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class ChatsController extends GetxController {
  //TODO: Implement ChatsController
  RxString userId = 'xA5lRs5krEa3LKEeVhvT'.obs;
  RxList chatRooms = [].obs;
  RxString userImage = ''.obs;
  RxString userName = ''.obs;

  // feth chats based on user id
  Future getChatsBasedOnUser() async {
    QuerySnapshot querySnapshot = await FirebaseFirestore.instance
        .collection('chatrooms')
        .where('users', arrayContains: userId.value)
        .get();
    chatRooms.value = querySnapshot.docs;
  }

  Future getUserData() async {
    DocumentSnapshot documentSnapshot = await FirebaseFirestore.instance
        .collection('users')
        .doc(chatRooms[0]['users'][0])
        .get();
    userImage.value = documentSnapshot['profilePic'];
    userName.value = documentSnapshot['name'];
  }

  // void goToChatScreen() {
  //   if (chatRooms.isNotEmpty) {
  //     for (var chatRoom in chatRooms) {
  //       List<dynamic> users = chatRoom[
  //           'users']; // Assuming each chat room has a 'users' field as an array
  //       // Add your conditions to select the desired chat room
  //       // For example, you could check if the chat room contains a specific user ID
  //       if (users.contains(userId.value)) {
  //         String chatRoomId = '${users.join('-')}-xA5lRs5krEa3LKEeVhvT';
  //         Get.toNamed('/chat-screen', arguments: chatRoomId);
  //         break; // Exit the loop after finding the desired chat room
  //       }
  //     }
  //   }
  // }

  final count = 0.obs;
  @override
  Future<void> onInit() async {
    await getChatsBasedOnUser();

    super.onInit();
  }

  @override
  void onReady() {
    getUserData();
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void increment() => count.value++;
}
