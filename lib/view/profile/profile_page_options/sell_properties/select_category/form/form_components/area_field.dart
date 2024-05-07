import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:real_estate_application/controller/propertycontroller.dart';
import 'package:real_estate_application/view/theme/theme_data.dart';

// ignore: must_be_immutable
class AreaTextField extends StatelessWidget {
  AreaTextField({super.key});
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
          "Area(ft^2)",
          style: GoogleFonts.poppins(fontSize: 25, color: AppThemeData.white),
        ),
        const SizedBox(
          height: 10,
        ),
        TextField(
          style: GoogleFonts.poppins(fontSize: 20),
          keyboardType: TextInputType.number,
          controller: ctrl.areaftsq,
          decoration: InputDecoration(
            filled: true,
            fillColor: Colors.grey[100],
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20),
            ),
            hintText: 'Area in square feet',
            hintStyle:
                GoogleFonts.poppins(fontSize: 23, color: AppThemeData.black),
            suffixText: "ft^2",
          ),
        ),
      ],
    );
  }
}
