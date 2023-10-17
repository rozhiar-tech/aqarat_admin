import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';


class RequestsController extends GetxController {
  //TODO: Implement RequestsController
  RxList requests = [].obs;

  Future fetchRequests() async {
    QuerySnapshot querySnapshot =
        await FirebaseFirestore.instance.collection('requests').get();
    requests.value = querySnapshot.docs;
  }

  final count = 0.obs;
  @override
  Future<void> onInit() async {
    super.onInit();
    await fetchRequests();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void increment() => count.value++;
}
