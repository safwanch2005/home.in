import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class GoogleAuth extends StatelessWidget {
  const GoogleAuth({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.06,
      width: double.infinity,
      decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(color: const Color(0xFF00704A), width: 1),
          borderRadius: const BorderRadius.all(
            Radius.circular(30),
          )),
      child: Container(
        margin: const EdgeInsets.only(left: 10),
        child: ListTile(
          leading: Image.asset(
            "assets/google_icon.png",
            height: 30,
            width: 30,
          ),
          title: Text(
            "Continue with Google",
            style: GoogleFonts.poppins(
                color: const Color(0xFF00704A), fontSize: 15),
          ),
        ),
      ),
    );
  }
}
