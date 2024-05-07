import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:real_estate_application/model/properties_land_model.dart';
import 'package:real_estate_application/model/properties_house_apartment_model.dart';
import 'package:real_estate_application/view/custom_widget/snackbar/error.dart';
import 'package:real_estate_application/view/profile/profile_page_options/sell_properties/select_category/select_category.dart';
import 'package:real_estate_application/view/theme/theme_data.dart';

class PropertyController extends GetxController {
  FirebaseAuth auth = FirebaseAuth.instance;
  FirebaseFirestore db = FirebaseFirestore.instance;

  String category = '';
  String type = "";
  TextEditingController title = TextEditingController();
  TextEditingController description = TextEditingController();
  TextEditingController price = TextEditingController();
  Map<String, String> location = {
    "country": "",
    "state": "",
    "city": "",
  };
  List<String> imageUrls = [];
  final isLoading = false.obs;
  String listedBy = "";
  String furnishing = "select direction";
  String constructionStatus = "";
  String carParking = "";
  String bedrooms = "";
  String bathrooms = "";
  TextEditingController areaftsq = TextEditingController();
  String floors = "";
  String facingDirection = "";
  TextEditingController length = TextEditingController();
  TextEditingController breadth = TextEditingController();
  TextEditingController plotArea = TextEditingController();
  String postedBy = "";
  String postedFrom = "";

  addPropertyDetails({
    required String category,
    required String type,
    required String title,
    required String description,
    required String price,
    required Map<String, String> location,
    required List<String> imageUrls,
    required String listedBy,
    required String facingDirection,
    required String length,
    required String breadth,
    required String furnishing,
    required String constructionStatus,
    required String carParking,
    required String bedrooms,
    required String bathrooms,
    required String areaftsq,
    required String floors,
    required String plotArea,
    required String postedBy,
    required String postedFrom,
  }) {
    if (type == "" ||
        title == "" ||
        description == "" ||
        price == "" ||
        listedBy == "" ||
        facingDirection == "select direction" ||
        location['country'] == "" ||
        location["state"] == "null" ||
        location["city"] == "null") {
      successSnackBar("Error", "fill all fields");

      return;
    }

    if (category == 'House' || category == 'Apartment') {
      if (furnishing == "" ||
          constructionStatus == "" ||
          carParking == "" ||
          bedrooms == "" ||
          bathrooms == "" ||
          floors == "" ||
          areaftsq == "") {
        Get.snackbar(
          "Error",
          "fill all fields",
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.red,
        );
        return;
      }
      PropertyHouseAndApartmentModel property = PropertyHouseAndApartmentModel(
          id: db.collection('properties').doc().id,
          userId: auth.currentUser!.uid,
          type: type,
          title: title,
          description: description,
          price: price,
          location: location,
          imageUrls: imageUrls,
          listedBy: listedBy,
          facingDirection: facingDirection,
          furnishing: furnishing,
          constructionStatus: constructionStatus,
          carParking: carParking,
          bedrooms: bedrooms,
          bathrooms: bathrooms,
          areaftsq: areaftsq,
          floors: floors,
          postedBy: postedBy,
          postedFrom: postedFrom,
          category: category);
      if (imageUrls.length < 4) {
        Get.snackbar(
          "Error",
          "Minimum 4 images required",
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.red,
        );
        return;
      }
      db.collection('properties').add(property.toMap());
      Get.snackbar("Success", "property added successfully",
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: AppThemeData.green);

      Get.off(() => SellPropSelectCategory());
    } else if (category == 'Land') {
      if (plotArea == "" || length == "" || breadth == "") {
        Get.snackbar(
          "Error",
          "fill all fields",
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.red,
        );
        return;
      }
      if (imageUrls.length < 4) {
        Get.snackbar(
          "Error",
          "Minimum 4 images required",
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.red,
        );
        return;
      }
      PropertyLandModel property = PropertyLandModel(
          id: db.collection('properties').doc().id,
          userId: auth.currentUser!.uid,
          type: type,
          title: title,
          description: description,
          price: price,
          location: location,
          imageUrls: imageUrls,
          listedBy: listedBy,
          facingDirection: facingDirection,
          length: length,
          breadth: breadth,
          plotArea: plotArea,
          postedBy: postedBy,
          postedFrom: postedFrom,
          category: category);

      db.collection('properties').add(property.toMap());
      Get.snackbar("Success", "property added successfully",
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: AppThemeData.green);
      Get.off(() => SellPropSelectCategory());
    } else {
      Get.snackbar("error", "select category",
          snackPosition: SnackPosition.BOTTOM, backgroundColor: Colors.red);
    }
  }

  deleteProperty(String propertyId) async {
    try {
      await db.collection('properties').doc(propertyId).delete();
      Get.snackbar("Success", "Property deleted successfully",
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: AppThemeData.green);
    } catch (e) {
      Get.snackbar("Error", "Failed to delete property: $e",
          snackPosition: SnackPosition.BOTTOM, backgroundColor: Colors.red);
    }
  }

  uploadImageToFirebase(File imageFile) async {
    try {
      final ref = FirebaseStorage.instance
          .ref()
          .child("images")
          .child("${DateTime.now().millisecondsSinceEpoch}");
      isLoading.value = true;
      final result = await ref.putFile(imageFile);
      final fileUrl = await result.ref.getDownloadURL();
      imageUrls.add(fileUrl);
      isLoading.value = false;
      Get.snackbar("Success", 'Image ${imageUrls.length} successfully saved',
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: AppThemeData.green);
    } catch (e) {
      Get.snackbar("error", 'Error in uploading image $e',
          snackPosition: SnackPosition.BOTTOM, backgroundColor: Colors.red);
    }
  }

  getUserLocation() async {
    bool serviceEnabled = await Geolocator.isLocationServiceEnabled();

    if (!serviceEnabled) {
      Get.snackbar("Error", "Location service is not enabled",
          snackPosition: SnackPosition.BOTTOM, backgroundColor: Colors.red);
    }
    LocationPermission permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        Get.snackbar("Error", "Location permission denied",
            snackPosition: SnackPosition.BOTTOM, backgroundColor: Colors.red);
      }
    }
    if (permission == LocationPermission.deniedForever) {
      Get.snackbar("Error", "Location permissions are permanently denied",
          snackPosition: SnackPosition.BOTTOM, backgroundColor: Colors.red);
    }
    Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);

    List<Placemark> placemarks =
        await placemarkFromCoordinates(position.latitude, position.longitude);

    location["country"] = placemarks.first.country.toString();
    location["state"] = placemarks.first.administrativeArea.toString();
    location["city"] =
        "${placemarks.first.subLocality}, ${placemarks.first.locality}";
    update();
  }
}
