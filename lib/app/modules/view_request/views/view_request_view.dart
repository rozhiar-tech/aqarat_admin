import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/view_request_controller.dart';

class ViewRequestView extends GetView<ViewRequestController> {
  const ViewRequestView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GetX(
        init: ViewRequestController(),
        builder: (controller) {
          return Scaffold(
            appBar: AppBar(
              title: Text(controller.title.value),
              centerTitle: true,
            ),
            body: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    controller.propertyName,
                    style: TextStyle(fontSize: 20),
                  ),
                  SizedBox(
                    height: Get.height * 0.02,
                  ),
                  Text(
                    controller.username,
                    style: TextStyle(fontSize: 20),
                  ),
                  SizedBox(
                    height: Get.height * 0.02,
                  ),
                  Text(
                    controller.location,
                    style: TextStyle(fontSize: 20),
                  ),
                  SizedBox(
                    height: Get.height * 0.02,
                  ),
                  Text(
                    controller.price.toString(),
                    style: TextStyle(fontSize: 20),
                  ),
                  SizedBox(
                    height: Get.height * 0.02,
                  ),
                  Text(
                    controller.description,
                    style: TextStyle(fontSize: 20),
                  ),
                  SizedBox(
                    height: Get.height * 0.02,
                  ),
                  Text(
                    controller.phone,
                    style: TextStyle(fontSize: 20),
                  ),
                  SizedBox(
                    height: Get.height * 0.02,
                  ),
                  Text(
                    controller.date,
                    style: TextStyle(fontSize: 20),
                  ),
                ],
              ),
            ),
          );
        });
  }
}
