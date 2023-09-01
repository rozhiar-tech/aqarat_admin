import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../theme/app_colors.dart';
import '../controllers/add_projects_controller.dart';

class AddProjectsView extends GetView<AddProjectsController> {
  const AddProjectsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetX(
      init: AddProjectsController(),
      builder: (controller) {
        return Scaffold(
          appBar: AppBar(
            title: Text(controller.title.value),
          ),
          body: SingleChildScrollView(
            child: Container(
              padding: EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  TextFormField(
                    decoration: InputDecoration(labelText: 'Client'),
                    // You can bind this to your controller if needed.
                    controller: controller.clientController,
                  ),
                  TextFormField(
                    decoration: InputDecoration(
                      labelText: 'Description',
                    ),
                    controller: controller.descriptionController,
                    // You can bind this to your controller if needed.
                  ),
                  TextFormField(
                    decoration: InputDecoration(labelText: 'Grass Area'),
                    keyboardType: TextInputType.number,
                    // You can bind this to your controller if needed.
                    controller: controller.grassAreaController,
                  ),
                  TextFormField(
                    decoration: InputDecoration(labelText: 'Location'),
                    // You can bind this to your controller if needed.
                    controller: controller.locationController,
                  ),
                  TextFormField(
                    decoration: InputDecoration(labelText: 'Name'),
                    // You can bind this to your controller if needed.
                    controller: controller.nameController,
                  ),
                  SizedBox(height: 20.0),
                  ElevatedButton(
                    onPressed: () {
                      // Add functionality for handling photos here.
                      Get.defaultDialog(
                        title: "Choose Image",
                        content: Column(
                          children: [
                            ListTile(
                              onTap: () {
                                controller.getImageFromCamera();
                                Get.back();
                              },
                              leading: const Icon(
                                Icons.camera,
                                color: AppColors.greenColor,
                              ),
                              title: const Text(
                                "Camera",
                                style: TextStyle(
                                  color: AppColors.greenColor,
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            ListTile(
                              onTap: () {
                                controller.getImageFromGallery();
                                Get.back();
                              },
                              leading: const Icon(
                                Icons.image,
                                color: AppColors.greenColor,
                              ),
                              title: const Text(
                                "Gallery",
                                style: TextStyle(
                                  color: AppColors.greenColor,
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                    child: Text('Add Photos'),
                  ),
                  SizedBox(height: 20.0),
                  TextFormField(
                    decoration: InputDecoration(labelText: 'Video URL'),
                    // You can bind this to your controller if needed.
                    controller: controller.videoUrlController,
                  ),
                  SizedBox(height: 20.0),
                  ElevatedButton(
                    onPressed: () {
                      // Add functionality for saving the project here.
                      controller.sendDataToFirebase();
                    },
                    child: Text('Save Project'),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
