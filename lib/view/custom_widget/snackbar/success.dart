import 'package:get/get.dart';
import 'package:real_estate_application/view/theme/theme_data.dart';

successSnackbar(String title, String despription) {
  Get.snackbar(title, despription,
      snackPosition: SnackPosition.BOTTOM, backgroundColor: AppThemeData.green);
}
