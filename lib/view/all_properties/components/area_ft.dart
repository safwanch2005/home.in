import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:real_estate_application/view/theme/theme_data.dart';

// ignore: must_be_immutable
class AreaSQ2 extends StatelessWidget {
  AreaSQ2({super.key, required this.areaSQ2});
  String areaSQ2 = "";
  @override
  Widget build(BuildContext context) {
    return Text("$areaSQ2 ft^2",
        style: GoogleFonts.poppins(
            fontSize: 20,
            color: AppThemeData.themeColor,
            fontWeight: FontWeight.w400));
  }
}
