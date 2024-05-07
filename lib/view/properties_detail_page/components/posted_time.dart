import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class PostedTime extends StatelessWidget {
  const PostedTime({super.key});

  @override
  Widget build(BuildContext context) {
    return Text(
      "week ago   ",
      style: GoogleFonts.poppins(color: Colors.white60, fontSize: 20),
    );
  }
}
