import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:real_estate_application/view/theme/theme_data.dart';

class PostedTime extends StatelessWidget {
  const PostedTime({super.key});

  @override
  Widget build(BuildContext context) {
    return Text(
      "week ago   ",
      style: GoogleFonts.poppins(color: AppThemeData.themeColor, fontSize: 20),
    );
  }
}
