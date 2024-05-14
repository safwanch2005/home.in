import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:real_estate_application/view/theme/theme_data.dart';

// ignore: must_be_immutable
class PriceAllProp extends StatelessWidget {
  PriceAllProp({super.key, required this.price});
  String price = "";
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: AppThemeData.background,
          boxShadow: [
            BoxShadow(
              color: AppThemeData.themeColor.withOpacity(0.5), // Shadow color
              spreadRadius: 5, // Spread radius
              blurRadius: 7, // Blur radius
              offset: const Offset(0, 3), // Offset
            ),
          ],
          borderRadius: const BorderRadius.all(Radius.circular(15))),
      child: Text(
        " ₹ $price ",
        style: GoogleFonts.poppins(
            fontSize: 35,
            color: AppThemeData.themeColor,
            fontWeight: FontWeight.w300),
      ),
    );
  }
}
