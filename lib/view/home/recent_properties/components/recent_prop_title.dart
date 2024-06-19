import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:real_estate_application/view/theme/theme_data.dart';

// ignore: must_be_immutable
class RecentPropTitle extends StatelessWidget {
  RecentPropTitle({super.key, required this.title});
  String title = "";
  @override
  Widget build(BuildContext context) {
    return Text(title.length <= 13 ? title : '${title.substring(0, 13)}...',
        style: GoogleFonts.poppins(
            fontSize: 40,
            color: AppThemeData.background,
            fontWeight: FontWeight.w500));
  }
}
