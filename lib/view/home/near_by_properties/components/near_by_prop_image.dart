import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:real_estate_application/view/theme/theme_data.dart';

// ignore: must_be_immutable
class NearByPropImage extends StatelessWidget {
  NearByPropImage({super.key, required this.imgUrl, required this.isSold});
  String imgUrl = "";
  bool? isSold;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 318,
      width: double.infinity,
      decoration: BoxDecoration(
          //color: Colors.black38,

          borderRadius: BorderRadius.circular(15),
          border: Border.all(color: AppThemeData.themeColor, width: 1)),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(15),
        child: Placeholder(
          color: AppThemeData.themeColor.withOpacity(0.1),
          child: Stack(
            children: [
              Image.network(
                imgUrl,
                fit: BoxFit.fill,
              ),
              if (isSold! && isSold != null)
                Positioned.fill(
                  child: BackdropFilter(
                    filter: ImageFilter.blur(sigmaX: 5.0, sigmaY: 5.0),
                    child: Container(
                      color: Colors.black.withOpacity(0.5),
                      child: Center(
                        child: Text(
                          'Property Sold',
                          style: GoogleFonts.poppins(
                            color: Colors.white,
                            fontSize: 35,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
