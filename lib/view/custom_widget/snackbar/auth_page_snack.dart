import 'package:get/get.dart';

authPageSnack(String title, String message) {
  Get.snackbar(title, message, snackPosition: SnackPosition.BOTTOM);
}
