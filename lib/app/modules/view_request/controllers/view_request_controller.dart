import 'package:get/get.dart';

class ViewRequestController extends GetxController {
  RxString title = 'Requests'.obs;
  String propertyName = '';
  double price = 0.0;
  String date = '';
  String description = '';
  String location = '';
  String phone = '';
  String username = '';

  retrieveArguments() {
    final arguments = Get.arguments;
    propertyName = arguments[0];
    price = arguments[1];
    description = arguments[2];
    location = arguments[3];
    phone = arguments[4];
    username = arguments[5];
    date = arguments[6];
  }

  final count = 0.obs;
  @override
  void onInit() {
    super.onInit();
    retrieveArguments();
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
