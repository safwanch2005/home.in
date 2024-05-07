import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:real_estate_application/controller/authcontroller.dart';
import 'package:real_estate_application/firebase/firebase_constants.dart';
import 'package:real_estate_application/view/theme/theme_data.dart';

class ProfileDetails extends StatelessWidget {
  ProfileDetails({super.key});
  final AuthController ctrl = Get.find<AuthController>();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const CircleAvatar(
              radius: 70,
              backgroundColor: Colors.white12,
              backgroundImage: AssetImage(
                "assets/profile.jpeg",
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  auth.currentUser!.displayName.toString(),
                  style: GoogleFonts.poppins(
                      fontSize: 30, color: AppThemeData.white),
                ),
                Text(
                  auth.currentUser!.emailVerified
                      ? auth.currentUser!.email.toString()
                      : auth.currentUser!.phoneNumber.toString(),
                  style: GoogleFonts.poppins(
                      fontSize: 13, color: AppThemeData.greyShade),
                ),
              ],
            ),
            Column(
              //mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Icon(Icons.sunny, color: AppThemeData.white, size: 30),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.1,
                )
              ],
            )
          ],
        ),
      ],
    );
  }
}
