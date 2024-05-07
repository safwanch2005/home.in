import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

// ignore: must_be_immutable
class LandLengthBreadthAllDetailPage extends StatelessWidget {
  LandLengthBreadthAllDetailPage(
      {super.key, required this.type, required this.value});
  String type = "";
  String value = "";

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          type,
          style: GoogleFonts.poppins(fontSize: 15, color: Colors.white38),
        ),
        const SizedBox(
          width: 5,
        ),
        Text(value,
            style: GoogleFonts.poppins(fontSize: 30, color: Colors.white54)),
      ],
    );
  }
}
