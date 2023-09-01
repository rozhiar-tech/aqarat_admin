import 'package:get/get.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class EditPropertiesController extends GetxController {
  // Define a RxList to hold the properties
  RxList<Property> properties = <Property>[].obs;

  @override
  void onInit() {
    super.onInit();
    // Fetch properties when the controller is initialized
    fetchProperties();
  }

  // Function to fetch properties from Firestore
  Future<void> fetchProperties() async {
    try {
      // Get a reference to the 'properties' collection
      final CollectionReference propertiesCollection =
          FirebaseFirestore.instance.collection('properties');

      // Query the collection and get the documents
      final QuerySnapshot querySnapshot = await propertiesCollection.get();

      // Convert the documents to Property objects and store in the properties list
      properties.value =
          querySnapshot.docs.map((doc) => Property.fromSnapshot(doc)).toList();
    } catch (e) {
      // Handle any errors
      print('Error fetching properties: $e');
    }
  }

  void deleteProperty(Property property) async {
    try {
      // Get a reference to the 'properties' collection
      final CollectionReference propertiesCollection =
          FirebaseFirestore.instance.collection('properties');

      // Delete the property document using its document ID
      await propertiesCollection.doc(property.id).delete();
      properties.remove(property);

      // Show a success message
      Get.snackbar('Success', 'Property deleted successfully');
    } catch (e) {
      // Handle any errors
      print('Error deleting property: $e');
      Get.snackbar('Error', 'Failed to delete property: $e');
    }
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void updateProperty(Property property) {
    // Get a reference to the 'properties' collection
    final CollectionReference propertiesCollection =
        FirebaseFirestore.instance.collection('properties');

    // Update the property document using its document ID
    propertiesCollection.doc(property.id).update({
      'address': property.address,
      // Add other fields to update here
    });

    // Show a success message
    Get.snackbar('Success', 'Property updated successfully');
  }
}

// Define a Property class to represent a property document
class Property {
  final String imageUrl;
  late final String address;
  final String id;

  Property({
    required this.imageUrl,
    required this.address,
    required this.id,
  });

  // Factory constructor to create a Property object from a Firestore document
  factory Property.fromSnapshot(DocumentSnapshot snapshot) {
    final data = snapshot.data() as Map<String, dynamic>;
    return Property(
      imageUrl: data['photos'][0] ?? '',
      address: data['address'] ?? '',
      id: snapshot.id,
    );
  }
}
