import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:real_estate_application/view/theme/theme_data.dart';

// ignore: must_be_immutable
class NearByPropCat extends StatelessWidget {
  NearByPropCat({super.key, required this.category, required this.type});
  String category = "";
  String type = "";
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text("$category - $type",
            style: GoogleFonts.poppins(
                fontSize: 20,
                color: AppThemeData.background,
                fontWeight: FontWeight.w400)),
      ],
    );
  }
}
