import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:real_estate_application/view/theme/theme_data.dart';

AppBar appbar(String friendName) {
  return AppBar(
    shape: Border(
      bottom: BorderSide(color: AppThemeData.themeColorShade, width: 1),
    ),
    foregroundColor: AppThemeData.themeColor,
    backgroundColor: AppThemeData.background,
    toolbarHeight: 65,
    title: Row(
      children: [
        const CircleAvatar(
          radius: 20,
          backgroundImage: AssetImage(
            "assets/profile.jpeg",
          ),
        ),
        const SizedBox(
          width: 15,
        ),
        Text(
          friendName,
          style: GoogleFonts.poppins(fontSize: 30),
        ),
      ],
    ),
  );
}
