import 'package:get/get.dart';

import '../controllers/edit_properties_controller.dart';

class EditPropertiesBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<EditPropertiesController>(
      () => EditPropertiesController(),
    );
  }
}
