import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:real_estate_application/controller/authcontroller.dart';
import 'package:real_estate_application/firebase/firebase_constants.dart';
import 'package:real_estate_application/view/theme/theme_data.dart';

class EditProfileTextField extends StatelessWidget {
  EditProfileTextField({super.key});
  final ctrl = Get.put(AuthController());

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
          horizontal: MediaQuery.of(context).size.width * 0.08),
      child: TextField(
        controller: ctrl.userName,
        textAlign: TextAlign.center,
        decoration: InputDecoration(
          hintText: ctrl.userName.text,
          hintStyle: GoogleFonts.poppins(
              color: AppThemeData.themeColorShade, fontSize: 20),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
            borderSide: BorderSide(color: AppThemeData.themeColor, width: 1.5),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(40),
            borderSide: BorderSide(color: AppThemeData.themeColor, width: 2),
          ),
        ),
      ),
    );
  }
}
