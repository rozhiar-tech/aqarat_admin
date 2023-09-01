import 'package:get/get.dart';

import '../controllers/add_projects_controller.dart';

class AddProjectsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AddProjectsController>(
      () => AddProjectsController(),
    );
  }
}
