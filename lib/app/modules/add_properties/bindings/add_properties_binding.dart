import 'package:get/get.dart';

import '../controllers/add_properties_controller.dart';

class AddPropertiesBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AddPropertiesController>(
      () => AddPropertiesController(),
    );
  }
}
