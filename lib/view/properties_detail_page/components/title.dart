import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:real_estate_application/view/theme/theme_data.dart';

// ignore: must_be_immutable
class TitleDetailPage extends StatelessWidget {
  TitleDetailPage({super.key, required this.title});
  String title;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Text(
        title,
        style: GoogleFonts.poppins(
            fontSize: 30,
            color: AppThemeData.themeColor,
            fontWeight: FontWeight.w300),
      ),
    );
  }
}
