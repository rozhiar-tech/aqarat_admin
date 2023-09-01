import 'dart:ffi';
import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:wechat_assets_picker/wechat_assets_picker.dart';

class AddProjectsController extends GetxController {
  //TODO: Implement AddProjectsController
  RxString title = 'Add Projects '.obs;
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final FirebaseStorage _storage = FirebaseStorage.instance;

  // Define variables to store project data
  RxString client = ''.obs;
  RxString description = ''.obs;
  RxDouble grassArea = 0.0.obs;
  RxString location = ''.obs;
  RxString name = ''.obs;
  RxString videoUrl = ''.obs;
  RxString imageName = 'image'.obs;
  final ImagePicker picker = ImagePicker();
  File? image;
  List<AssetEntity> pickedImages = [];
  FirebaseStorage firebase_storage = FirebaseStorage.instance;
  TextEditingController descriptionController = TextEditingController();
  TextEditingController clientController = TextEditingController();
  TextEditingController grassAreaController = TextEditingController();
  TextEditingController locationController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController videoUrlController = TextEditingController();

  // Function to save the project data to Firestore

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
          imageFiles.add(file as File);
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
    // add validation here to see all fields are filled
    User? user = _auth.currentUser;
    if (pickedImages.isEmpty) {
      Get.defaultDialog(
          title: 'Error',
          middleText: 'Please select at least one image',
          textConfirm: 'OK',
          onConfirm: () => Get.back());
      return;
    }

    if (clientController.text.isEmpty ||
        descriptionController.text.isEmpty ||
        grassAreaController.text.isEmpty ||
        locationController.text.isEmpty ||
        nameController.text.isEmpty ||
        videoUrlController.text.isEmpty) {
      Get.defaultDialog(
          title: 'Error',
          middleText: 'Please fill all the fields ',
          textConfirm: 'OK',
          onConfirm: () => Get.back());
      return;
    }
    final ref = FirebaseFirestore.instance.collection('projects');
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
        'client': clientController.text,
        'description': descriptionController.text,
        'grassArea': int.parse(grassAreaController.text),
        'location': locationController.text,
        'name': nameController.text,
        'videoUrl': videoUrlController.text,
        'userId': user?.uid,
        'createdAt': FieldValue.serverTimestamp(),
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
