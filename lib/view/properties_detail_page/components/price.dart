import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

// ignore: must_be_immutable
class PriceDetailPage extends StatelessWidget {
  PriceDetailPage({super.key, required this.price});
  String price;
  @override
  Widget build(BuildContext context) {
    return Text(
      " ₹ $price ",
      style: GoogleFonts.poppins(
          fontSize: 35, color: Colors.white, fontWeight: FontWeight.w300),
    );
  }
}
