import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../../../theme/app_colors.dart';
import '../controllers/requests_controller.dart';

class RequestsView extends GetView<RequestsController> {
  const RequestsView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GetX(
        init: RequestsController(),
        builder: (controller) {
          return Scaffold(
            body: ListView.builder(
              itemCount: controller.requests.length,
              itemBuilder: (context, index) {
                Timestamp timestamp = controller.requests[index]['date'];

                DateTime dateTime = timestamp.toDate();

                String formattedDate =
                    DateFormat('yyyy-MM-dd HH:mm:ss').format(dateTime);
                return Card(
                  child: ListTile(
                    leading: const Icon(Icons.request_page),
                    title:
                        Text(' ${controller.requests[index]['propertyName']}'),
                    subtitle: Text(
                      formattedDate.toString().substring(0, 10),
                      style: const TextStyle(color: AppColors.greenColor),
                    ),
                    trailing: Text(
                      '${controller.requests[index]['price']} \$',
                      style: const TextStyle(
                          color: AppColors.greenColor,
                          fontWeight: FontWeight.bold
                          // fontSize: 20,
                          ),
                    ),
                    onTap: () {
                      Get.toNamed("view-request", arguments: [
                        controller.requests[index]['propertyName'],
                        controller.requests[index]['price'],
                        controller.requests[index]['description'],
                        controller.requests[index]['location'],
                        controller.requests[index]['phone'],
                        controller.requests[index]['username'],
                        formattedDate,
                      ]);
                    },
                  ),
                );
              },
            ),
          );
        });
  }
}
