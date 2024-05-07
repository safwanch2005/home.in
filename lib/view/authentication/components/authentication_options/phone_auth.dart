import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:real_estate_application/controller/authcontroller.dart';
import 'package:real_estate_application/view/authentication/phone_auth_page.dart';
import 'package:real_estate_application/view/theme/theme_data.dart';

class PhoneAuth extends StatelessWidget {
  PhoneAuth({super.key});
  final ctrl = Get.put(AuthController());

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        gotoPhoneAuthPage();
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
          margin: const EdgeInsets.only(left: 15),
          child: ListTile(
            leading:
                Icon(Icons.phone_iphone, size: 23, color: AppThemeData.green),
            title: Text(
              "Continue with phone",
              style:
                  GoogleFonts.poppins(color: AppThemeData.green, fontSize: 15),
            ),
          ),
        ),
      ),
    );
  }

  gotoPhoneAuthPage() {
    ctrl.phoneNumber.clear();
    ctrl.otp.clear();
    Get.to(() => PhoneAuthPage());
  }
}
