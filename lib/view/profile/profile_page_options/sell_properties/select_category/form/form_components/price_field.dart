import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:real_estate_application/controller/propertycontroller.dart';
import 'package:real_estate_application/view/theme/theme_data.dart';

// ignore: must_be_immutable
class PriceField extends StatelessWidget {
  PriceField({super.key});
  PropertyController ctrl = Get.find();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(
          height: 20,
        ),
        Text(
          "Price",
          style:
              GoogleFonts.poppins(fontSize: 25, color: AppThemeData.themeColor),
        ),
        const SizedBox(
          height: 10,
        ),
        TextField(
          style:
              GoogleFonts.poppins(fontSize: 20, color: AppThemeData.themeColor),
          keyboardType: TextInputType.number,
          controller: ctrl.price,
          decoration: InputDecoration(
            filled: true,
            fillColor: AppThemeData.background,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20),
            ),
            prefixIcon: Padding(
              padding: const EdgeInsets.all(20),
              child: FaIcon(
                FontAwesomeIcons.indianRupeeSign,
                color: AppThemeData.themeColor,
                size: 30,
              ),
            ),
            hintText: 'Enter price',
            hintStyle: GoogleFonts.poppins(
                fontSize: 23, color: AppThemeData.themeColor),
          ),
        ),
      ],
    );
  }
}
