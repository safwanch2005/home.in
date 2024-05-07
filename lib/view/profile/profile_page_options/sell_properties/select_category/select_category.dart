import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:real_estate_application/controller/propertycontroller.dart';
import 'package:real_estate_application/view/profile/profile_page_options/sell_properties/select_category/custom_catogory_button.dart';
import 'package:real_estate_application/view/profile/profile_page_options/sell_properties/select_category/form/form_page.dart';
import 'package:real_estate_application/view/theme/theme_data.dart';

// ignore: must_be_immutable
class SellPropSelectCategory extends StatelessWidget {
  SellPropSelectCategory({super.key});
  final ctrl = Get.put(PropertyController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppThemeData.black,
      appBar: AppBar(
        backgroundColor: AppThemeData.black,
        foregroundColor: AppThemeData.white,
        title: Text(
          "Sell my property",
          style: GoogleFonts.poppins(fontWeight: FontWeight.w300),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Select category",
              style: GoogleFonts.poppins(
                  fontWeight: FontWeight.w300,
                  color: AppThemeData.white,
                  fontSize: 45),
            ),
            const SizedBox(height: 10),
            GestureDetector(
                onTap: () {
                  Get.to(
                    () => FormPage(isLand: false),
                  );
                  ctrl.category = "House";
                },
                child: CustomCategoryBotton(
                    icon: FontAwesomeIcons.house, text: "House")),
            GestureDetector(
              onTap: () {
                Get.to(() => FormPage(
                      isLand: true,
                    ));
                ctrl.category = "Land";
              },
              child: CustomCategoryBotton(
                  icon: FontAwesomeIcons.mapLocationDot, text: 'Land'),
            ),
            GestureDetector(
              onTap: () {
                Get.to(() => FormPage(
                      isLand: false,
                    ));
                ctrl.category = "Apartment";
              },
              child: CustomCategoryBotton(
                  icon: FontAwesomeIcons.buildingUser, text: "Appartment"),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.3,
            ),
          ],
        ),
      ),
    );
  }
}
