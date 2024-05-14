import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:real_estate_application/view/theme/theme_data.dart';

// ignore: must_be_immutable
class DescriptionPageDetailPage extends StatelessWidget {
  DescriptionPageDetailPage({super.key, required this.description});
  dynamic description;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(
          height: 20,
        ),
        Padding(
          padding: const EdgeInsets.only(left: 25, bottom: 5),
          child: Text(
            "Description",
            style: GoogleFonts.poppins(
                fontSize: 30, color: AppThemeData.themeColor),
          ),
        ),
        Container(
          padding: const EdgeInsets.all(15),
          decoration: BoxDecoration(
            color: AppThemeData.background,
            boxShadow: [
              BoxShadow(
                color: AppThemeData.themeColor.withOpacity(0.5), // Shadow color
                spreadRadius: 5, // Spread radius
                blurRadius: 7, // Blur radius
                offset: const Offset(0, 3), // Offset
              ),
            ],
            borderRadius: const BorderRadius.all(
              Radius.circular(20),
            ),
          ),
          width: double.infinity,
          child: Text(
            description,
            style: GoogleFonts.poppins(
                fontSize: 25,
                fontWeight: FontWeight.w300,
                color: AppThemeData.themeColor),
          ),
        ),
      ],
    );
  }
}
