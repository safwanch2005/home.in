import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomTextFielForAuthPage extends StatelessWidget {
  final String hintText;
  final String titleText;
  final bool isPassword;
  final TextEditingController controller;

  const CustomTextFielForAuthPage({
    super.key,
    required this.hintText,
    required this.titleText,
    required this.controller,
    this.isPassword = false,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          titleText,
          style:
              GoogleFonts.poppins(fontSize: 20, color: const Color(0xFF00704A)),
        ),
        const SizedBox(
          height: 3,
        ),
        TextFormField(
          controller: controller,
          textAlign: TextAlign.center,
          obscureText:
              isPassword, // Set obscureText based on isPassword parameter
          decoration: InputDecoration(
            hintText: hintText,
            hintStyle: GoogleFonts.poppins(color: Colors.grey, fontSize: 20),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20),
              borderSide:
                  const BorderSide(color: Color(0xFF00704A), width: 1.5),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(40),
              borderSide: const BorderSide(color: Color(0xFF00704A), width: 2),
            ),
          ),
        ),
      ],
    );
  }
}
