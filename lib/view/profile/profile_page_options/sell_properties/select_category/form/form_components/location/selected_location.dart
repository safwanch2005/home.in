import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:real_estate_application/controller/propertycontroller.dart';
import 'package:real_estate_application/view/theme/theme_data.dart';

// ignore: must_be_immutable
class SelectedLocation extends StatelessWidget {
  SelectedLocation({super.key});
  PropertyController ctrl = Get.find();

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.center,
      child: GetBuilder<PropertyController>(builder: (controller) {
        return ctrl.location["city"] == "null"
            ? const SizedBox(height: 0)
            : Text(
                "${ctrl.location["city"]}, ${ctrl.location["state"]}, ${ctrl.location["country"]}",
                textAlign: TextAlign.center,
                style: GoogleFonts.poppins(
                    fontWeight: FontWeight.w500,
                    fontSize: 25,
                    color: AppThemeData.themeColor),
              );
      }),
    );
  }
}
