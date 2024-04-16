import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class PhoneAuth extends StatelessWidget {
  const PhoneAuth({super.key});

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
        margin: const EdgeInsets.only(left: 15),
        child: ListTile(
          leading: const Icon(Icons.phone_iphone,
              size: 23, color: Color(0xFF00704A)),
          title: Text(
            "Continue with phone",
            style: GoogleFonts.poppins(
                color: const Color(0xFF00704A), fontSize: 15),
          ),
        ),
      ),
    );
  }
}
