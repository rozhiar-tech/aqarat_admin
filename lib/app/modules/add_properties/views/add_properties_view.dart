import 'package:aqarat_admin/app/theme/app_colors.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/add_properties_controller.dart';

class AddPropertiesView extends GetView<AddPropertiesController> {
  const AddPropertiesView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GetX(
        init: AddPropertiesController(),
        builder: (controller) {
          return Scaffold(
              appBar: AppBar(
                title: Text(
                  controller.title.value,
                  style: const TextStyle(
                    color: AppColors.goldColor,
                  ),
                ),
                leading: IconButton(
                  onPressed: () {
                    Get.back();
                  },
                  icon: const Icon(
                    Icons.arrow_back_ios,
                    color: AppColors.goldColor,
                  ),
                ),
                backgroundColor: AppColors.greenColor,
                elevation: 0,
                centerTitle: true,
              ),
              backgroundColor: AppColors.greenColor,
              body: SingleChildScrollView(
                child: SizedBox(
                  height: Get.height,
                  width: Get.width,
                  child: Column(
                    children: [
                      const Text(
                        "Category",
                        style: TextStyle(
                          color: AppColors.goldColor,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Container(
                        height: Get.height * 0.06,
                        width: Get.width * 0.9,
                        decoration: BoxDecoration(
                          color: AppColors.whiteColor,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: DropdownButtonFormField(
                          value: 1,
                          decoration: const InputDecoration(
                            border: InputBorder.none,
                            contentPadding: EdgeInsets.only(
                              left: 10,
                            ),
                          ),
                          items: [
                            const DropdownMenuItem(
                              child: Text(
                                "Rent",
                                style: TextStyle(
                                  color: AppColors.greenColor,
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              value: 1,
                            ),
                            const DropdownMenuItem(
                              child: Text(
                                "Buy",
                                style: TextStyle(
                                  color: AppColors.greenColor,
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              value: 2,
                            ),
                          ],
                          onChanged: (value) {
                            controller.category.value = value.toString();
                          },
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      const Text(
                        "Type",
                        style: TextStyle(
                          color: AppColors.goldColor,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Container(
                        height: Get.height * 0.06,
                        width: Get.width * 0.9,
                        decoration: BoxDecoration(
                          color: AppColors.whiteColor,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: DropdownButtonFormField(
                          value: 1,
                          decoration: const InputDecoration(
                            border: InputBorder.none,
                            contentPadding: EdgeInsets.only(
                              left: 10,
                            ),
                          ),
                          items: [
                            const DropdownMenuItem(
                              child: Text(
                                "Residential",
                                style: TextStyle(
                                  color: AppColors.greenColor,
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              value: 1,
                            ),
                            const DropdownMenuItem(
                              child: Text(
                                "Commercial",
                                style: TextStyle(
                                  color: AppColors.greenColor,
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              value: 2,
                            ),
                            const DropdownMenuItem(
                              child: Text(
                                "Tourism",
                                style: TextStyle(
                                  color: AppColors.greenColor,
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              value: 3,
                            ),
                          ],
                          onChanged: (value) {
                            controller.type.value = value.toString();
                          },
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      const Text(
                        "Description",
                        style: TextStyle(
                          color: AppColors.goldColor,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Container(
                        height: Get.height * 0.1,
                        width: Get.width * 0.9,
                        decoration: BoxDecoration(
                          color: AppColors.whiteColor,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: TextFormField(
                          controller: controller.descriptionController,
                          onChanged: (value) =>
                              controller.descriptionController.text = value,
                          keyboardType: TextInputType.multiline,
                          maxLines: 5,
                          textInputAction: TextInputAction.newline,
                          decoration: const InputDecoration(
                            border: InputBorder.none,
                            contentPadding: EdgeInsets.only(
                              left: 10,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      const Text(
                        "Price",
                        style: TextStyle(
                          color: AppColors.goldColor,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Container(
                        height: Get.height * 0.06,
                        width: Get.width * 0.9,
                        decoration: BoxDecoration(
                          color: AppColors.whiteColor,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: TextFormField(
                          controller: controller.priceController,
                          onChanged: (value) =>
                              controller.priceController.text = value,
                          keyboardType: TextInputType.number,
                          decoration: const InputDecoration(
                            border: InputBorder.none,
                            contentPadding: EdgeInsets.only(
                              left: 10,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      const Text(
                        "Location",
                        style: TextStyle(
                          color: AppColors.goldColor,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Container(
                        height: Get.height * 0.06,
                        width: Get.width * 0.9,
                        decoration: BoxDecoration(
                          color: AppColors.whiteColor,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: TextFormField(
                          controller: controller.addressController,
                          onChanged: (value) =>
                              controller.addressController.text = value,
                          decoration: const InputDecoration(
                            border: InputBorder.none,
                            contentPadding: EdgeInsets.only(
                              left: 10,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      const Text(
                        "Vip",
                        style: TextStyle(
                          color: AppColors.goldColor,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Container(
                        height: Get.height * 0.06,
                        width: Get.width * 0.9,
                        decoration: BoxDecoration(
                          color: AppColors.whiteColor,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: DropdownButtonFormField(
                          value: 1,
                          decoration: const InputDecoration(
                            border: InputBorder.none,
                            contentPadding: EdgeInsets.only(
                              left: 10,
                            ),
                          ),
                          items: [
                            const DropdownMenuItem(
                              child: Text(
                                "Yes",
                                style: TextStyle(
                                  color: AppColors.greenColor,
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              value: 1,
                            ),
                            const DropdownMenuItem(
                              child: Text(
                                "No",
                                style: TextStyle(
                                  color: AppColors.greenColor,
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              value: 2,
                            ),
                          ],
                          onChanged: (value) {
                            controller.vip.value = value.toString();
                          },
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      const Text(
                        "Choose Image",
                        style: TextStyle(
                          color: AppColors.goldColor,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Container(
                        height: Get.height * 0.06,
                        width: Get.width * 0.9,
                        decoration: BoxDecoration(
                          color: AppColors.whiteColor,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                controller.imageName.value,
                                style: const TextStyle(
                                  color: AppColors.greenColor,
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            IconButton(
                              icon: const Icon(
                                Icons.image,
                                color: AppColors.greenColor,
                              ),
                              onPressed: () {
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
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Text(
                        "Submitt",
                        style: TextStyle(
                          color: AppColors.greenColor,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Container(
                        height: Get.height * 0.06,
                        width: Get.width * 0.9,
                        decoration: BoxDecoration(
                          color: AppColors.greenColor,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: TextButton(
                          onPressed: () {
                            controller.sendDataToFirebase();
                          },
                          child: const Text(
                            "Add",
                            style: TextStyle(
                              color: AppColors.whiteColor,
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ));
        });
  }
}
