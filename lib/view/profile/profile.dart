import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:real_estate_application/controller/authcontroller.dart';
import 'package:real_estate_application/view/profile/profile_details.dart';
import 'package:real_estate_application/view/profile/profile_page_options/about.dart';
import 'package:real_estate_application/view/profile/profile_page_options/edit_profile.dart';
import 'package:real_estate_application/view/profile/profile_page_options/log_out.dart';
import 'package:real_estate_application/view/profile/profile_page_options/my_properties/button/my_properties.dart';
import 'package:real_estate_application/view/profile/profile_page_options/notifications.dart';
import 'package:real_estate_application/view/profile/profile_page_options/rate_us.dart';
import 'package:real_estate_application/view/profile/profile_page_options/select_language.dart';
import 'package:real_estate_application/view/profile/profile_page_options/sell_properties/sell_properties.dart';
import 'package:real_estate_application/view/theme/theme_data.dart';

class ProfilePage extends StatelessWidget {
  ProfilePage({super.key});
  final AuthController ctrl = Get.find<AuthController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppThemeData.background,
      body: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: MediaQuery.of(context).size.width * 0.05,
          vertical: MediaQuery.of(context).size.height * 0.02,
        ),
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ProfileDetails(),
            SizedBox(height: MediaQuery.of(context).size.height * 0.05),
            const EditProfile(),
            const SizedBox(height: 10),
            const MyProperties(),
            const SizedBox(height: 10),
            const SellMyProperties(),
            const SizedBox(height: 10),
            const Notifications(),
            const SizedBox(height: 10),
            const SelectLanguage(),
            const SizedBox(height: 10),
            const RateUs(),
            const SizedBox(height: 10),
            const AboutPage(),
            const SizedBox(height: 10),
            const LogOut(),
            const SizedBox(height: 15),
            Text(
              "version 1.0.0",
              style: GoogleFonts.poppins(
                  color: AppThemeData.themeColorShade, fontSize: 15),
            ),
          ],
        ),
      ),
    );
  }
}
