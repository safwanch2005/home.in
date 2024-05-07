import 'package:flutter/material.dart';
import 'package:get/get.dart';

successSnackBar(String title, String message) {
  Get.snackbar(title, message,
      snackPosition: SnackPosition.BOTTOM, backgroundColor: Colors.red);
}
