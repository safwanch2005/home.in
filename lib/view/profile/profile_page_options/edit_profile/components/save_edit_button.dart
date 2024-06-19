import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:real_estate_application/controller/authcontroller.dart';
import 'package:real_estate_application/controller/indexcontroller.dart';
import 'package:real_estate_application/view/theme/theme_data.dart';

class SaveEditProfileButtom extends StatelessWidget {
  SaveEditProfileButtom({super.key});
  final ctrl = Get.put(AuthController());
  final indexCtrl = Get.put(IndexController());
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: ElevatedButton(
        style:
            ElevatedButton.styleFrom(backgroundColor: AppThemeData.themeColor),
        onPressed: () async {
          ctrl.editUserDetails();
          Get.back();
        },
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            'save',
            style: GoogleFonts.poppins(
                color: AppThemeData.background, fontSize: 30),
          ),
        ),
      ),
    );
  }
}
