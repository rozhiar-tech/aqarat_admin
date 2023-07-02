import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/add_properties_controller.dart';

class AddPropertiesView extends GetView<AddPropertiesController> {
  const AddPropertiesView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('AddPropertiesView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'AddPropertiesView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
