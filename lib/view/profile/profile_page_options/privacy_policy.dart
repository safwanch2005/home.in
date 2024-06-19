import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:real_estate_application/view/profile/profile_page_options/custom_botton.dart';
import 'package:real_estate_application/view/profile/profile_page_options/privacy_policy/privacy_policy_page.dart';

class PrivacyPolicy extends StatelessWidget {
  const PrivacyPolicy({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Get.to(const PrivacyPolicyPage());
      },
      child: ProfileCustomBotton(
        icon: FontAwesomeIcons.shieldHalved,
        text: "Privacy policy",
      ),
    );
  }
}
