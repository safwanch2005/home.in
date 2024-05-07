import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

// ignore: must_be_immutable
class AreaSQ2 extends StatelessWidget {
  AreaSQ2({super.key, required this.areaSQ2});
  String areaSQ2 = "";
  @override
  Widget build(BuildContext context) {
    return Text("$areaSQ2 ft^2",
        style: GoogleFonts.poppins(
            fontSize: 30, color: Colors.white70, fontWeight: FontWeight.w200));
  }
}
