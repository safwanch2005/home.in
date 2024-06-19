import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:real_estate_application/controller/authcontroller.dart';
import 'package:real_estate_application/view/profile/profile_details.dart';
import 'package:real_estate_application/view/profile/profile_page_options/privacy_policy.dart';
import 'package:real_estate_application/view/profile/profile_page_options/edit_profile_option.dart';
import 'package:real_estate_application/view/profile/profile_page_options/log_out.dart';
import 'package:real_estate_application/view/profile/profile_page_options/my_properties/button/my_properties.dart';
import 'package:real_estate_application/view/profile/profile_page_options/sell_properties/sell_properties.dart';
import 'package:real_estate_application/view/theme/theme_data.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  final AuthController ctrl = Get.find<AuthController>();

  @override
  void initState() {
    super.initState();
    ctrl.getUserData();
    _rebuildPageAfterDelay();
  }

  void _rebuildPageAfterDelay() {
    Future.delayed(const Duration(milliseconds: 600), () {
      if (mounted) {
        setState(() {});
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppThemeData.background,
      body: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: MediaQuery.of(context).size.width * 0.05,
          vertical: MediaQuery.of(context).size.height * 0.08,
        ),
        child: SingleChildScrollView(
          child: Column(
            // mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ProfileDetails(),
              SizedBox(height: MediaQuery.of(context).size.height * 0.07),
              EditProfile(),
              const SizedBox(height: 10),
              const MyProperties(),
              const SizedBox(height: 10),
              const SellMyProperties(),
              const SizedBox(height: 10),
              const PrivacyPolicy(),
              const SizedBox(height: 10),
              const LogOut(),
              const SizedBox(height: 15),
              Text(
                "version 1.0.0",
                style: GoogleFonts.poppins(
                    color: AppThemeData.themeColorShade, fontSize: 20),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
