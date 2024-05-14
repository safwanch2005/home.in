import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:real_estate_application/view/theme/theme_data.dart';

// ignore: must_be_immutable
class LocationTextDetailPage extends StatelessWidget {
  LocationTextDetailPage({super.key, required this.location});
  dynamic location;
  @override
  Widget build(BuildContext context) {
    String value =
        " ${location["city"]}, ${location["state"]}, ${location["country"]}";
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SizedBox(
            width: 10,
          ),
          Icon(
            Icons.location_on_sharp,
            color: AppThemeData.themeColor,
            size: 25,
          ),
          Flexible(
            child: Text(
              value,
              overflow: TextOverflow.ellipsis,
              style: GoogleFonts.poppins(
                  color: AppThemeData.themeColor,
                  fontSize: 25,
                  fontWeight: FontWeight.w300),
            ),
          ),
        ],
      ),
    );
  }
}
