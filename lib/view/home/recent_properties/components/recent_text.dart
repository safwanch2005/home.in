import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:geocoding/geocoding.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:real_estate_application/view/theme/theme_data.dart';

class RecentText extends StatelessWidget {
  const RecentText({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
          horizontal: MediaQuery.of(context).size.width * 0.03, vertical: 10),
      child: GestureDetector(
        onTap: () async {
          await getCoordinates('India', 'Kerala', 'Koombara, Kozhikode');
        },
        child: Text(
          "Recent Properties",
          style: GoogleFonts.poppins(
              color: AppThemeData.themeColor,
              fontSize: 30,
              fontWeight: FontWeight.w500),
        ),
      ),
    );
  }

  Future<Map<String, double>> getCoordinates(
      String country, String state, String city) async {
    try {
      String address = '$city, $state, $country';
      List<Location> locations = await locationFromAddress(address);

      if (locations.isNotEmpty) {
        Location location = locations.first;
        print(location.latitude);
        print(location.longitude);

        return {
          'latitude': location.latitude,
          'longitude': location.longitude,
        };
      } else {
        throw Exception('No locations found for the provided address');
      }
    } catch (e) {
      throw Exception('Failed to get coordinates: $e');
    }
  }
}
