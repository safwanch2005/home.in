import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:real_estate_application/view/theme/theme_data.dart';

Center propNotFound() {
  return Center(
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        FaIcon(FontAwesomeIcons.faceFrown,
            size: 35, color: AppThemeData.themeColorShade),
        const SizedBox(
          height: 5,
        ),
        Text(
          "No properties found\n",
          style: GoogleFonts.poppins(
              fontSize: 25, color: AppThemeData.themeColorShade),
        ),
      ],
    ),
  );
}
