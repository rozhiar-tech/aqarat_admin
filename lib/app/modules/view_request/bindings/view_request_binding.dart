import 'package:get/get.dart';

import '../controllers/view_request_controller.dart';

class ViewRequestBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ViewRequestController>(
      () => ViewRequestController(),
    );
  }
}
