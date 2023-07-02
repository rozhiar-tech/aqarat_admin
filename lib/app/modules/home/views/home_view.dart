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
                  child: Text(controller.title.value),
                  style: ElevatedButton.styleFrom(
                    primary: Colors.red,
                    onPrimary: Colors.white,
                    onSurface: Colors.grey,
                    fixedSize: Size(200, 50),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                ElevatedButton(
                  onPressed: () {
                    Get.toNamed('/edit-properties');
                  },
                  child: Text('Edit Properties'),
                  style: ElevatedButton.styleFrom(
                    primary: Colors.red,
                    onPrimary: Colors.white,
                    onSurface: Colors.grey,
                    fixedSize: Size(200, 50),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                ElevatedButton(
                  onPressed: () {
                    Get.toNamed('/chats');
                  },
                  child: Text('Chats'),
                  style: ElevatedButton.styleFrom(
                    primary: Colors.red,
                    onPrimary: Colors.white,
                    onSurface: Colors.grey,
                    fixedSize: Size(200, 50),
                  ),
                ),
              ],
            ),
          ));
        });
  }
}
