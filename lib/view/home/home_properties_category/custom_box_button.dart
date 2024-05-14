import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:real_estate_application/view/home/home_properties_category/saved/saved_property_page.dart';
import 'package:real_estate_application/view/theme/theme_data.dart';

// ignore: must_be_immutable
class CustomBoxButton extends StatelessWidget {
  CustomBoxButton({super.key, required this.text, required this.icon});
  String text;
  dynamic icon;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (text == 'Saved') {
          Get.to(() => const SavedPropertyPage());
        }
      },
      child: Container(
        height: 100,
        width: 200,
        padding:
            EdgeInsets.only(left: MediaQuery.of(context).size.width * 0.07),
        decoration: BoxDecoration(
          border: Border.all(color: AppThemeData.themeColor),
          color: AppThemeData.background,
          boxShadow: [
            BoxShadow(
              color: AppThemeData.themeColor.withOpacity(0.5), // Shadow color
              spreadRadius: 5,
              blurRadius: 7,
              offset: const Offset(0, 3),
            ),
          ],
          borderRadius: BorderRadius.circular(20),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Icon(
              icon,
              size: 30,
              color: AppThemeData.themeColor,
            ),
            const SizedBox(
              width: 15,
            ),
            Text(
              text,
              style: TextStyle(
                color: AppThemeData.themeColor,
                fontSize: 25,
                fontWeight: FontWeight.w400,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
