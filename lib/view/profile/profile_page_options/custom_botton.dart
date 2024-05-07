import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:real_estate_application/view/theme/theme_data.dart';

// ignore: must_be_immutable
class ProfileCustomBotton extends StatelessWidget {
  ProfileCustomBotton({super.key, required this.text, required this.icon});
  dynamic text;
  dynamic icon;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.06,
      width: double.infinity,
      decoration: const BoxDecoration(
          color: Colors.white24,
          borderRadius: BorderRadius.all(Radius.circular(20))),
      child: Row(
        children: [
          SizedBox(
            width: MediaQuery.of(context).size.width * 0.06,
          ),
          FaIcon(
            icon,
            size: 20,
            color: AppThemeData.white,
          ),
          SizedBox(
            width: MediaQuery.of(context).size.width * 0.06,
          ),
          Text(
            text,
            style: GoogleFonts.poppins(fontSize: 20, color: AppThemeData.white),
          )
        ],
      ),
    );
  }
}
