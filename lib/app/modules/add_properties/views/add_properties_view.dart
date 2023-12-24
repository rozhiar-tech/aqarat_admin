import 'package:aqarat_admin/app/theme/app_colors.dart';
import 'package:flutter/cupertino.dart';
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
          body: SizedBox(
            height: Get.height,
            width: Get.width,
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
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
                        items: const [
                          DropdownMenuItem(
                            value: 1,
                            child: Text(
                              "Rent",
                              style: TextStyle(
                                color: AppColors.greenColor,
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          DropdownMenuItem(
                            value: 2,
                            child: Text(
                              "Buy",
                              style: TextStyle(
                                color: AppColors.greenColor,
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ],
                        onChanged: (value) {
                          if (value == 1) {
                            controller.category.value = "Rent";
                          } else if (value == 2) {
                            controller.category.value = "Buy";
                          }
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
                        items: const [
                          DropdownMenuItem(
                            value: 1,
                            child: Text(
                              "Residential",
                              style: TextStyle(
                                color: AppColors.greenColor,
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          DropdownMenuItem(
                            value: 2,
                            child: Text(
                              "Commercial",
                              style: TextStyle(
                                color: AppColors.greenColor,
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          DropdownMenuItem(
                            value: 3,
                            child: Text(
                              "Tourism",
                              style: TextStyle(
                                color: AppColors.greenColor,
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ],
                        onChanged: (value) {
                          if (value == 1) {
                            controller.type.value = "Residential";
                          } else if (value == 2) {
                            controller.type.value = "Commercial";
                          } else if (value == 3) {
                            controller.type.value = "Tourism";
                          }
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
                      width: Get.width * 0.9,
                      height: Get.height * 0.1,
                      decoration: BoxDecoration(
                        color: AppColors.whiteColor,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: TextFormField(
                        keyboardType: TextInputType.multiline,
                        maxLines: 5,
                        textInputAction: TextInputAction.newline,
                        controller: controller.descriptionController,
                        decoration: InputDecoration(
                          hintText: 'Description',
                          hintStyle: const TextStyle(
                            color: AppColors.greenColor,
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0),
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
                      width: Get.width * 0.9,
                      decoration: BoxDecoration(
                        color: AppColors.whiteColor,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: TextFormField(
                        keyboardType: TextInputType.number,
                        controller: controller.priceController,
                        decoration: InputDecoration(
                          hintText: 'Price',
                          hintStyle: const TextStyle(
                            color: AppColors.greenColor,
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    const Text(
                      "Latitude & Longitude",
                      style: TextStyle(
                        color: AppColors.goldColor,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          width: Get.width * 0.4,
                          decoration: BoxDecoration(
                            color: AppColors.whiteColor,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: TextFormField(
                            keyboardType: TextInputType.number,
                            controller: controller.latitudeController,
                            decoration: InputDecoration(
                              hintText: 'Latitude',
                              hintStyle: const TextStyle(
                                color: AppColors.greenColor,
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                            ),
                          ),
                        ),
                        Container(
                          width: Get.width * 0.4,
                          decoration: BoxDecoration(
                            color: AppColors.whiteColor,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: TextFormField(
                            keyboardType: TextInputType.number,
                            controller: controller.longitudeController,
                            decoration: InputDecoration(
                              hintText: 'Longitude',
                              hintStyle: const TextStyle(
                                color: AppColors.greenColor,
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                            ),
                          ),
                        ),
                      ],
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
                        child: CupertinoPicker(
                          itemExtent: 30,
                          onSelectedItemChanged: (int index) {
                            controller.vip.value = index == 0 ? true : false;
                          },
                          children: const [
                            Text(
                              "Yes",
                              style: TextStyle(
                                color: AppColors.greenColor,
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              "No",
                              style: TextStyle(
                                color: AppColors.greenColor,
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        )),
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
                    const Text(
                      "Area",
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
                      width: Get.width * 0.9,
                      decoration: BoxDecoration(
                        color: AppColors.whiteColor,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: TextFormField(
                        controller: controller.areaController,
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                          hintText: 'Area',
                          hintStyle: const TextStyle(
                            color: AppColors.greenColor,
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    const Text(
                      "address",
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
                      width: Get.width * 0.9,
                      height: Get.height * 0.1,
                      decoration: BoxDecoration(
                        color: AppColors.whiteColor,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: TextFormField(
                        keyboardType: TextInputType.multiline,
                        maxLines: 5,
                        textInputAction: TextInputAction.newline,
                        controller: controller.addressController,
                        decoration: InputDecoration(
                          hintText: 'address',
                          hintStyle: const TextStyle(
                            color: AppColors.greenColor,
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    const Text(
                      "Rwga",
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
                      width: Get.width * 0.9,
                      decoration: BoxDecoration(
                        color: AppColors.whiteColor,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: TextFormField(
                        controller: controller.rwgaController,
                        decoration: InputDecoration(
                          hintText: 'Rwga',
                          hintStyle: const TextStyle(
                            color: AppColors.greenColor,
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    const Text(
                      "Rooms",
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
                      width: Get.width * 0.9,
                      decoration: BoxDecoration(
                        color: AppColors.whiteColor,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: TextFormField(
                        controller: controller.roomsController,
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                          hintText: 'Bedrooms',
                          hintStyle: const TextStyle(
                            color: AppColors.greenColor,
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    const Text(
                      "Bathrooms",
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
                      width: Get.width * 0.9,
                      decoration: BoxDecoration(
                        color: AppColors.whiteColor,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: TextFormField(
                        controller: controller.bathroomsController,
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                          hintText: 'Bathrooms',
                          hintStyle: const TextStyle(
                            color: AppColors.greenColor,
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    const Text(
                      "Floors",
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
                      width: Get.width * 0.9,
                      decoration: BoxDecoration(
                        color: AppColors.whiteColor,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: TextFormField(
                        controller: controller.floorsController,
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                          hintText: 'Floors',
                          hintStyle: const TextStyle(
                            color: AppColors.greenColor,
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    const Text(
                      "Bedrooms",
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
                      width: Get.width * 0.9,
                      decoration: BoxDecoration(
                        color: AppColors.whiteColor,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: TextFormField(
                        controller: controller.bedroomsController,
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                          hintText: 'Bedrooms',
                          hintStyle: const TextStyle(
                            color: AppColors.greenColor,
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    const Text(
                      "Agent Phone",
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
                      width: Get.width * 0.9,
                      decoration: BoxDecoration(
                        color: AppColors.whiteColor,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: TextFormField(
                        controller: controller.agentController,
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                          hintText: 'Agent Phone',
                          hintStyle: const TextStyle(
                            color: AppColors.greenColor,
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                        ),
                      ),
                    ),
                    const Text(
                      "property id",
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
                      width: Get.width * 0.9,
                      decoration: BoxDecoration(
                        color: AppColors.whiteColor,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: TextFormField(
                        controller: controller.idController,
                        enabled: false,
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                          hintText: '${controller.propertyId + 1}',
                          hintStyle: const TextStyle(
                            color: AppColors.greenColor,
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    const Text(
                      "video Link",
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
                      width: Get.width * 0.9,
                      decoration: BoxDecoration(
                        color: AppColors.whiteColor,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: TextFormField(
                        controller: controller.videoController,
                        decoration: InputDecoration(
                          hintText: 'video Link',
                          hintStyle: const TextStyle(
                            color: AppColors.greenColor,
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Container(
                      height: Get.height * 0.06,
                      width: Get.width * 0.9,
                      decoration: BoxDecoration(
                        color: AppColors.goldColor,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: TextButton(
                        onPressed: () async {
                          await controller.sendDataToFirebase();
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
            ),
          ),
        );
      },
    );
  }
}
