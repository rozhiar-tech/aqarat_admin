import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/edit_properties_controller.dart';

class EditPropertiesView extends GetView<EditPropertiesController> {
  const EditPropertiesView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('EditPropertiesView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'EditPropertiesView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
