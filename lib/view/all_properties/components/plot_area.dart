import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:real_estate_application/view/theme/theme_data.dart';

// ignore: must_be_immutable
class PlotAreaAllProp extends StatelessWidget {
  PlotAreaAllProp({super.key, required this.plotArea});
  String plotArea = "";
  @override
  Widget build(BuildContext context) {
    return Text("$plotArea sq.ft",
        style: GoogleFonts.poppins(
            fontSize: 20,
            color: AppThemeData.themeColor,
            fontWeight: FontWeight.w400));
  }
}
