import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:real_estate_application/view/theme/theme_data.dart';

// ignore: must_be_immutable
class LocationAllProp extends StatelessWidget {
  LocationAllProp({super.key, required this.location});
  dynamic location;
  @override
  Widget build(BuildContext context) {
    String value = " ${location["city"]}, ${location["state"]}";
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Icon(
            Icons.location_on_sharp,
            color: AppThemeData.themeColor,
            size: 25,
          ),
          Wrap(
            children: [
              Text(
                value.length <= 25 ? value : '${value.substring(0, 25)}...',
                style: GoogleFonts.poppins(
                    color: AppThemeData.themeColor,
                    fontSize: 25,
                    fontWeight: FontWeight.w200),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
