import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:real_estate_application/view/theme/theme_data.dart';

// ignore: must_be_immutable
class AdminResponeStatus extends StatelessWidget {
  AdminResponeStatus({super.key, required this.isAccepted});
  int isAccepted;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Text(
        isAccepted == 0
            ? "Request sent"
            : isAccepted == 1
                ? "Rejected 🚫"
                : "Accepted ✅",
        style: GoogleFonts.poppins(
            color: isAccepted == 0
                ? AppThemeData.grey
                : isAccepted == 1
                    ? AppThemeData.red
                    : AppThemeData.green,
            fontSize: 25),
      ),
    );
  }
}
