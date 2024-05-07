import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

// ignore: must_be_immutable
class CountsOfItems extends StatelessWidget {
  CountsOfItems({super.key, required this.items, required this.icon});
  String items = "";
  IconData? icon;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          items,
          style: GoogleFonts.poppins(fontSize: 30, color: Colors.white60),
        ),
        const SizedBox(
          width: 5,
        ),
        Icon(
          icon,
          size: icon == Icons.bathtub_outlined ? 28 : 35,
          color: Colors.white54,
        ),
      ],
    );
  }
}
