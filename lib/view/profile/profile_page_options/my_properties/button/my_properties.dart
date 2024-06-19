import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:real_estate_application/view/profile/profile_page_options/custom_botton.dart';
import 'package:real_estate_application/view/profile/profile_page_options/my_properties/my_properties_page.dart';

class MyProperties extends StatelessWidget {
  const MyProperties({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Get.to(() => const MyPropertiesPage()),
      child: ProfileCustomBotton(
        icon: FontAwesomeIcons.buildingUser,
        text: "My properties and requests",
      ),
    );
  }
}
