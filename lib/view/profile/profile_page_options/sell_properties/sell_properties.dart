import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:real_estate_application/view/profile/profile_page_options/custom_botton.dart';
import 'package:real_estate_application/view/profile/profile_page_options/sell_properties/select_category/select_category.dart';

class SellMyProperties extends StatelessWidget {
  const SellMyProperties({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Get.to(() => SellPropSelectCategory()),
      child: ProfileCustomBotton(
        icon: FontAwesomeIcons.plus,
        text: "Sell my properties",
      ),
    );
  }
}
