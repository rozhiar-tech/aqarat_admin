import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class AddPropertiesController extends GetxController {
  //TODO: Implement AddPropertiesController
  RxString title = 'Add'.obs;
  RxString category = 'Category'.obs;
  RxString type = 'Type'.obs;
  RxString vip = 'VIP'.obs;
  RxString imageName = 'image'.obs;
  final ImagePicker picker = ImagePicker();
  File? image;
  TextEditingController descriptionController = TextEditingController();
  TextEditingController priceController = TextEditingController();
  TextEditingController addressController = TextEditingController();

  Future<void> getImageFromGallery() async {
    final pickedImage = await picker.pickImage(source: ImageSource.gallery);

    image = File(pickedImage!.path);
  }

  Future<void> getImageFromCamera() async {
    final pickedImage = await picker.pickImage(source: ImageSource.camera);

    image = File(pickedImage!.path);
  }

  Future<void> sendDataToFirebase() async {
    final ref = FirebaseFirestore.instance.collection('properties');
    final imageName = image!.path.split('/').last;

    // Upload the image name to the 'images' subcollection
    await ref
        .doc()
        .collection('images')
        .doc(imageName)
        .set({'image': imageName});

    // Get the download URL of the image (if needed)
    final imageUrl = await ref.doc().collection('images').doc(imageName).get();

    // Add the property data to the main collection
    await ref.add({
      'title': title.value,
      'category': category.value,
      'type': type.value,
      'vip': vip.value,
      'description': descriptionController.text,
      'price': priceController.text,
      'address': addressController.text,
      // 'photos': imageUrl['image'],
    });
  }

  final count = 0.obs;
  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void increment() => count.value++;
}
