import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:real_estate_application/view/theme/theme_data.dart';

class HomeSearch extends StatelessWidget {
  const HomeSearch({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.04,
      decoration: BoxDecoration(
        color: Colors.grey.shade600,
        borderRadius: const BorderRadius.all(Radius.circular(10)),
      ),
      child: TextFormField(
        textAlign: TextAlign.center,
        decoration: InputDecoration(
          contentPadding: const EdgeInsets.fromLTRB(0, 5, 80, 0),
          hintText: 'Search property',
          hintStyle: GoogleFonts.poppins(
              fontSize: 19,
              color: AppThemeData.white,
              fontWeight: FontWeight.w300),
          border: InputBorder.none,
          prefixIcon: Padding(
            padding: const EdgeInsets.only(left: 30),
            child: Icon(
              Icons.search,
              color: AppThemeData.white,
              size: 25,
            ),
          ),
        ),
      ),
    );
  }
}
