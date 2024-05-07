import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

// ignore: must_be_immutable
class PriceAllProp extends StatelessWidget {
  PriceAllProp({super.key, required this.price});
  String price = "";
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
          color: Colors.black45,
          borderRadius: BorderRadius.all(Radius.circular(15))),
      child: Text(
        " ₹ $price ",
        style: GoogleFonts.poppins(
            fontSize: 35, color: Colors.white, fontWeight: FontWeight.w100),
      ),
    );
  }
}
