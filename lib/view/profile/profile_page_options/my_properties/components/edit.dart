import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class EditMyProp extends StatelessWidget {
  const EditMyProp({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: 30,
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(backgroundColor: Colors.white24),
          onPressed: () {},
          child: Text(
            'Edit',
            style: GoogleFonts.poppins(color: Colors.white),
          ),
        ));
  }
}
