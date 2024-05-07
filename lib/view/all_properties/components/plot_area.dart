import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

// ignore: must_be_immutable
class PlotAreaAllProp extends StatelessWidget {
  PlotAreaAllProp({super.key, required this.plotArea});
  String plotArea = "";
  @override
  Widget build(BuildContext context) {
    return Text("$plotArea sq.ft",
        style: GoogleFonts.poppins(
            fontSize: 30, color: Colors.white70, fontWeight: FontWeight.w200));
  }
}
