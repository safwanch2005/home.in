import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:real_estate_application/view/theme/theme_data.dart';

class MessageButton extends StatelessWidget {
  const MessageButton({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.4,
      height: 60,
      child: ElevatedButton(
        style:
            ElevatedButton.styleFrom(backgroundColor: AppThemeData.themeColor),
        onPressed: () {},
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Icon(FontAwesomeIcons.comments,
                size: 20, color: AppThemeData.background),
            Text(
              "chat",
              style: GoogleFonts.poppins(
                  fontSize: 25, color: AppThemeData.background),
            ),
          ],
        ),
      ),
    );
  }
}
