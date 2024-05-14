import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:real_estate_application/view/theme/theme_data.dart';

// ignore: must_be_immutable
class TittleMyProp extends StatelessWidget {
  TittleMyProp({super.key, required this.title});
  String title = "";
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 5),
      child: Text(title.length <= 15 ? title : '${title.substring(0, 15)}...',
          textAlign: TextAlign.center,
          style: GoogleFonts.poppins(
              fontSize: 20,
              color: AppThemeData.themeColor,
              fontWeight: FontWeight.w400)),
    );
  }
}
