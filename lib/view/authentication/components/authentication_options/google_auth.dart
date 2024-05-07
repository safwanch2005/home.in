import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:real_estate_application/controller/authcontroller.dart';
import 'package:real_estate_application/view/theme/theme_data.dart';

class GoogleAuth extends StatelessWidget {
  GoogleAuth({super.key});
  final ctrl = Get.put(AuthController());

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        ctrl.signInWithGoogle();
      },
      child: Container(
        height: MediaQuery.of(context).size.height * 0.06,
        width: double.infinity,
        decoration: BoxDecoration(
            color: AppThemeData.white,
            border: Border.all(color: AppThemeData.green, width: 1),
            borderRadius: const BorderRadius.all(
              Radius.circular(30),
            )),
        child: Container(
          margin: const EdgeInsets.only(left: 10),
          child: ListTile(
            leading: Image.asset(
              "assets/google_icon.png",
              height: 30,
              width: 30,
            ),
            title: Text(
              "Continue with Google",
              style:
                  GoogleFonts.poppins(color: AppThemeData.green, fontSize: 15),
            ),
          ),
        ),
      ),
    );
  }
}
