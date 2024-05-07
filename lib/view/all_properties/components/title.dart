import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

// ignore: must_be_immutable
class TitleAllProp extends StatelessWidget {
  TitleAllProp({super.key, required this.title});
  String title = "";
  @override
  Widget build(BuildContext context) {
    return Text(title.length <= 25 ? title : '${title.substring(0, 25)}...',
        style: GoogleFonts.poppins(
            fontSize: 30, color: Colors.white, fontWeight: FontWeight.w200));
  }
}
