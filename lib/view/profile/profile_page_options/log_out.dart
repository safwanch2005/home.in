import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:real_estate_application/firebase/firebase_constants.dart';
import 'package:real_estate_application/view/authentication/authentication_page.dart';
import 'package:real_estate_application/view/profile/profile_page_options/custom_botton.dart';
import 'package:real_estate_application/view/theme/theme_data.dart';

class LogOut extends StatelessWidget {
  const LogOut({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        showConfirmationDialog(context);
      },
      child: ProfileCustomBotton(
        icon: FontAwesomeIcons.arrowRightFromBracket,
        text: "Log out",
      ),
    );
  }

  showConfirmationDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: AppThemeData.background,
          title: Text(
            'Confirm Deletion',
            style: GoogleFonts.poppins(color: AppThemeData.themeColor),
          ),
          content: Text(
            'Are you sure you want to log out?',
            style: GoogleFonts.poppins(
                fontSize: 17, color: AppThemeData.themeColor),
          ),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Get.back();
              },
              child: Text(
                'no',
                style: GoogleFonts.poppins(color: AppThemeData.black),
              ),
            ),
            TextButton(
              onPressed: () async {
                Get.back();
                await auth.signOut();
                Get.offAll(() => const AuthenticationPage());
              },
              child: Text(
                'Yes',
                style: GoogleFonts.poppins(color: Colors.red),
              ),
            ),
          ],
        );
      },
    );
  }
}
