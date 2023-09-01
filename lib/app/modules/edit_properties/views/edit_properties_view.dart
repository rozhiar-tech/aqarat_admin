import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/edit_properties_controller.dart';

class EditPropertiesView extends GetView<EditPropertiesController> {
  const EditPropertiesView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Edit Properties'),
        centerTitle: true,
      ),
      body: Obx(() {
        final properties = controller
            .properties; // Get the list of properties from the controller

        if (properties.isEmpty) {
          // If there are no properties to display, show a message
          return Center(
            child: Text(
              'No properties to display',
              style: TextStyle(fontSize: 20),
            ),
          );
        }

        // If there are properties, display them as cards
        return ListView.builder(
          itemCount: properties.length,
          itemBuilder: (context, index) {
            final property = properties[index];

            return Card(
              margin: EdgeInsets.all(8.0),
              child: ListTile(
                leading: Image.network(
                    property.imageUrl), // Display the property image
                title: Text(property.address), // Display the property address
                trailing: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    IconButton(
                      icon: Icon(Icons.edit),
                      onPressed: () {
                        // Add functionality to edit the property here
                        // You can navigate to an edit property page
                        Get.to(() => EditPropertyScreen(property: property));
                      },
                    ),
                    IconButton(
                      icon: Icon(Icons.delete),
                      onPressed: () {
                        // Add functionality to delete the property here
                        // You can show a confirmation dialog before deleting
                        Get.defaultDialog(
                          title: "Delete Property",
                          content: Column(
                            children: [
                              Text(
                                  "Are you sure you want to delete this property?"),
                              SizedBox(
                                height: 20,
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  ElevatedButton(
                                    onPressed: () {
                                      Get.back();
                                    },
                                    child: Text("Cancel"),
                                  ),
                                  ElevatedButton(
                                    onPressed: () {
                                      controller.deleteProperty(property);
                                      Get.back();
                                    },
                                    child: Text("Delete"),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        );
                      },
                    ),
                  ],
                ),
              ),
            );
          },
        );
      }),
    );
  }
}

class EditPropertyScreen extends StatelessWidget {
  final Property property;
  final EditPropertiesController controller = Get.find();

  EditPropertyScreen({required this.property});

  @override
  Widget build(BuildContext context) {
    final TextEditingController addressController =
        TextEditingController(text: property.address);

    return Scaffold(
      appBar: AppBar(
        title: Text('Edit Property'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextFormField(
              controller: addressController,
              decoration: InputDecoration(labelText: 'Address'),
              // Handle the editing of other property fields here
            ),
            // Add other form fields for editing property details
            ElevatedButton(
              onPressed: () {
                // Update the property's address with the new value
                property.address = addressController.text;

                // Update the property in the properties list
                final index =
                    controller.properties.indexWhere((p) => p == property);
                if (index != -1) {
                  controller.properties[index] = property;
                }

                // Update the property in Firestore (you need to implement this)
                // For simplicity, I assume a function updateProperty is available
                controller.updateProperty(property);

                // Close the screen
                Get.back();
              },
              child: Text('Save Changes'),
            ),
          ],
        ),
      ),
    );
  }
}
