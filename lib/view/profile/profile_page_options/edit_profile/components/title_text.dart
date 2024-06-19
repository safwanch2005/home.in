import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:real_estate_application/view/theme/theme_data.dart';

class EditProfileTitleText extends StatelessWidget {
  const EditProfileTitleText({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Text(
        'Edit Profile',
        style:
            GoogleFonts.poppins(color: AppThemeData.themeColor, fontSize: 70),
      ),
    );
  }
}
