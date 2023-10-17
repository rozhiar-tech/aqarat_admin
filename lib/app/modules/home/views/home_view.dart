import 'package:aqarat_admin/app/theme/app_colors.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GetX<HomeController>(
        init: HomeController(),
        builder: (controller) {
          return Scaffold(
            backgroundColor: AppColors.greenColor,
            body: Container(
              height: Get.height,
              width: Get.width,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      Get.toNamed('/add-properties');
                    },
                    style: ElevatedButton.styleFrom(
                      primary: AppColors.goldColor,
                      onPrimary: Colors.white,
                      onSurface: Colors.grey,
                      fixedSize: const Size(200, 50),
                    ),
                    child: Text(controller.title.value),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  ElevatedButton(
                    onPressed: () {
                      Get.toNamed('/edit-properties');
                    },
                    style: ElevatedButton.styleFrom(
                      primary: AppColors.goldColor,
                      onPrimary: Colors.white,
                      onSurface: Colors.grey,
                      fixedSize: const Size(200, 50),
                    ),
                    child: const Text('Edit Properties'),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  ElevatedButton(
                    onPressed: () {
                      Get.toNamed('/chats');
                    },
                    style: ElevatedButton.styleFrom(
                      primary: AppColors.goldColor,
                      onPrimary: Colors.white,
                      onSurface: Colors.grey,
                      fixedSize: const Size(200, 50),
                    ),
                    child: const Text('Chats'),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  ElevatedButton(
                    onPressed: () {
                      Get.toNamed('/login');
                    },
                    style: ElevatedButton.styleFrom(
                      primary: AppColors.goldColor,
                      onPrimary: Colors.white,
                      onSurface: Colors.grey,
                      fixedSize: const Size(200, 50),
                    ),
                    child: const Text('Login'),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  ElevatedButton(
                    onPressed: () {
                      Get.toNamed('/add-projects');
                    },
                    style: ElevatedButton.styleFrom(
                      primary: AppColors.goldColor,
                      onPrimary: Colors.white,
                      onSurface: Colors.grey,
                      fixedSize: const Size(200, 50),
                    ),
                    child: const Text('Add Project'),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  ElevatedButton(
                    onPressed: () {
                      Get.toNamed('/requests');
                    },
                    style: ElevatedButton.styleFrom(
                      primary: AppColors.goldColor,
                      onPrimary: Colors.white,
                      onSurface: Colors.grey,
                      fixedSize: const Size(200, 50),
                    ),
                    child: const Text('see requests'),
                  ),
                ],
              ),
            ),
          );
        });
  }
}
