import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

// ignore: must_be_immutable
class DescriptionPageDetailPage extends StatelessWidget {
  DescriptionPageDetailPage({super.key, required this.description});
  dynamic description;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(
          height: 20,
        ),
        Padding(
          padding: const EdgeInsets.only(left: 25, bottom: 5),
          child: Text(
            "Description",
            style: GoogleFonts.poppins(fontSize: 30, color: Colors.white),
          ),
        ),
        Container(
          padding: const EdgeInsets.all(15),
          decoration: const BoxDecoration(
            color: Colors.white24,
            borderRadius: BorderRadius.all(
              Radius.circular(20),
            ),
          ),
          width: double.infinity,
          child: Text(
            description,
            style: GoogleFonts.poppins(
                fontSize: 25,
                fontWeight: FontWeight.w300,
                color: Colors.white70),
          ),
        ),
      ],
    );
  }
}
