import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:real_estate_application/view/theme/theme_data.dart';

// ignore: must_be_immutable
class LocationNearByProp extends StatelessWidget {
  LocationNearByProp({super.key, required this.location});
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
            color: AppThemeData.background,
            size: 25,
          ),
          Wrap(
            children: [
              Text(
                value.length <= 30 ? value : '${value.substring(0, 30)}...',
                style: GoogleFonts.poppins(
                    color: AppThemeData.background,
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
