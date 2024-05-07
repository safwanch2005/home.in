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
          decoration: const BoxDecoration(
            color: Colors.white24,
            borderRadius: BorderRadius.all(Radius.circular(20)),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(
                width: MediaQuery.of(context).size.height * 0.05,
              ),
              FaIcon(
                icon,
                color: AppThemeData.white,
                size: 20,
              ),
              SizedBox(
                width: MediaQuery.of(context).size.height * 0.035,
              ),
              Text(
                text,
                style: GoogleFonts.poppins(
                    fontSize: 25, color: AppThemeData.white),
              )
            ],
          ),
        ),
        const SizedBox(
          height: 10,
        )
      ],
    );
  }
}
