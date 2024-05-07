import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

// ignore: must_be_immutable
class LocationAllProp extends StatelessWidget {
  LocationAllProp({super.key, required this.location});
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
          const Icon(
            Icons.location_on_sharp,
            color: Colors.white70,
            size: 25,
          ),
          Wrap(
            children: [
              Text(
                value.length <= 35 ? value : '${value.substring(0, 35)}...',
                style: GoogleFonts.poppins(
                    color: Colors.white,
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
