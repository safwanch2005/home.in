import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:real_estate_application/view/theme/theme_data.dart';

// ignore: must_be_immutable
class CustomCategoryBotton extends StatelessWidget {
  CustomCategoryBotton({super.key, required this.text, required this.icon});
  dynamic text;
  dynamic icon;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: MediaQuery.of(context).size.height * 0.06,
          width: MediaQuery.of(context).size.width * 0.7,
          decoration: BoxDecoration(
            color: AppThemeData.background,
            borderRadius: const BorderRadius.all(Radius.circular(20)),
            boxShadow: [
              BoxShadow(
                color: AppThemeData.themeColor.withOpacity(0.4), // Shadow color
                spreadRadius: 4, // Spread radius
                blurRadius: 10, // Blur radius
                offset: const Offset(0, 3), // Offset
              ),
            ],
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(
                width: MediaQuery.of(context).size.height * 0.05,
              ),
              FaIcon(
                icon,
                color: AppThemeData.themeColor,
                size: 20,
              ),
              SizedBox(
                width: MediaQuery.of(context).size.height * 0.035,
              ),
              Text(
                text,
                style: GoogleFonts.poppins(
                    fontSize: 25, color: AppThemeData.themeColor),
              )
            ],
          ),
        ),
        const SizedBox(
          height: 15,
        )
      ],
    );
  }
}
