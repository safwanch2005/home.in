import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:real_estate_application/firebase/firebase_constants.dart';
import 'package:real_estate_application/view/custom_widget/snackbar/error.dart';
import 'package:real_estate_application/view/custom_widget/snackbar/success.dart';

class NearByPropertiesController extends GetxController {
  String? country;
  String? state;
  String? city;
  bool locationEnabled = false;

  getNearByProperties() {
    return db
        .collection("properties")
        .where('hide', isEqualTo: false)
        .where('isAccepted', isEqualTo: 2)
        .where('location.state', isEqualTo: state)
        .snapshots();
  }

  getUserLocation() async {
    bool serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      locationEnabled = false;
      errorSnackBar("Error", "Location service is not enabled");
    }

    LocationPermission permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        locationEnabled = false;
        errorSnackBar("Error", "Location permission denied");
      }
    }
    // if (permission == LocationPermission.deniedForever) {
    //   locationEnabled = false;
    //   errorSnackBar("Error", "Location permissions are permanently denied");
    // }
    try {
      Position position = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.high);

      List<Placemark> placemarks =
          await placemarkFromCoordinates(position.latitude, position.longitude);

      country = placemarks.first.country.toString();
      state = placemarks.first.administrativeArea.toString();
      city = "${placemarks.first.subLocality}, ${placemarks.first.locality}";
      update();
      locationEnabled = true;
      successSnackbar("Success", "Permission allowed");
    } catch (e) {
      locationEnabled = false;
      errorSnackBar("Error", "Failed to get location: $e");
    }
  }
}
