import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:wechat_assets_picker/wechat_assets_picker.dart';

class AddPropertiesController extends GetxController {
  RxString title = 'Add'.obs;
  RxString category = 'Rent'.obs;
  RxString type = 'Commercial'.obs;
  RxBool vip = false.obs;
  RxString imageName = 'image'.obs;
  final ImagePicker picker = ImagePicker();
  File? image;
  List<AssetEntity> pickedImages = [];

  FirebaseStorage firebase_storage = FirebaseStorage.instance;
  TextEditingController descriptionController = TextEditingController();
  TextEditingController priceController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  TextEditingController areaController = TextEditingController();
  TextEditingController roomsController = TextEditingController();
  TextEditingController bathroomsController = TextEditingController();
  TextEditingController floorsController = TextEditingController();
  TextEditingController bedroomsController = TextEditingController();
  TextEditingController rwgaController = TextEditingController();

  Future<void> getImageFromGallery() async {
    try {
      pickedImages = (await AssetPicker.pickAssets(
        Get.context!,
        // Set the maximum number of images that can be picked
      ))!;
    } on Exception catch (e) {
      // Handle any error that occurs during image selection
    }

    if (pickedImages.isNotEmpty) {
      List<File> imageFiles = [];

      for (AssetEntity asset in pickedImages) {
        final file = await asset.file;
        if (file != null) {
          imageFiles.add(file);
        }
      }

      // Now you have a list of selected image files (imageFiles)
      // You can process and upload these files to Firebase Storage or perform any other operations.
    }
  }

  Future<void> getImageFromCamera() async {
    final pickedImage = await picker.pickImage(source: ImageSource.camera);

    image = File(pickedImage!.path);
  }

  Future<void> sendDataToFirebase() async {
    final ref = FirebaseFirestore.instance.collection('properties');
    print('Sending data to Firebase');

    try {
      // Create a new document reference for the property
      final propertyRef = ref.doc();

      // Create a list to store the image URLs
      List<String> imageUrls = [];

      for (AssetEntity asset in pickedImages) {
        final imageName = asset.title;
        final filePath = await asset.file;
        print('Image name: $imageName');
        print('File path: $filePath');

        if (filePath != null) {
          // Upload the image to Firebase Storage
          final storageRef = firebase_storage.ref().child('images/$imageName');
          final uploadTask = storageRef.putFile(File(filePath.path));
          final snapshot = await uploadTask.whenComplete(() {});
          print('Image uploaded to Firebase');

          // Get the download URL of the uploaded image
          final imageUrl = await snapshot.ref.getDownloadURL();
          print('Download URL: $imageUrl');

          // Add the image URL to the list
          imageUrls.add(imageUrl);
        } else {
          print('File path is null for image: $imageName');
        }
      }

      // Add the property data to the main collection
      await propertyRef.set({
        'category': category.value,
        'type': type.value,
        'vip': vip.value,
        'description': descriptionController.text,
        'price': priceController.text,
        'address': addressController.text,
        'area': areaController.text,
        'rooms': roomsController.text,
        'bathrooms': bathroomsController.text,
        'floors': floorsController.text,
        'bedrooms': bedroomsController.text,
        'rwgasore': rwgaController.text,

        'photos':
            imageUrls, // Assign the list of image URLs to the 'photos' field
      });

      Get.defaultDialog(
          title: 'Success',
          middleText: 'Property added successfully',
          textConfirm: 'OK',
          onConfirm: () {
            Get.back();
            Get.back();
          }

          // Get.toNamed('/home');
          );
    } catch (e) {
      print('Error uploading images and data to Firebase: $e');
    }
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
