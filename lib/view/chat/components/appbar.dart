import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:real_estate_application/view/theme/theme_data.dart';

AppBar appbar() {
  return AppBar(
    toolbarHeight: 45,
    centerTitle: true,
    title: Text(
      "messages",
      style: GoogleFonts.poppins(color: AppThemeData.themeColor, fontSize: 30),
    ),
  );
}
