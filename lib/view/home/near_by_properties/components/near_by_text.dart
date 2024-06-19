import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:real_estate_application/view/theme/theme_data.dart';

class NearByText extends StatelessWidget {
  const NearByText({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
          horizontal: MediaQuery.of(context).size.width * 0.03, vertical: 10),
      child: Text(
        "Near by Properties",
        style: GoogleFonts.poppins(
            color: AppThemeData.themeColor,
            fontSize: 30,
            fontWeight: FontWeight.w500),
      ),
    );
  }
}
