import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:real_estate_application/view/theme/theme_data.dart';

class SendMessageOptions extends StatelessWidget {
  const SendMessageOptions({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
              margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
              height: MediaQuery.of(context).size.height * 0.05,
              width: MediaQuery.of(context).size.width * 0.85,
              decoration: BoxDecoration(
                color: AppThemeData.background,
              ),
              child: TextField(
                style: GoogleFonts.poppins(
                    color: AppThemeData.themeColor, fontSize: 20),
                decoration: InputDecoration(
                  prefix: const SizedBox(width: 10),
                  suffixIcon: GestureDetector(
                      onTap: () {},
                      child: const Icon(Icons.attachment_outlined)),
                  suffixIconColor: AppThemeData.themeColor,
                  hintText: "Type here ...",
                  hintStyle:
                      GoogleFonts.poppins(color: AppThemeData.themeColor),
                  border: const OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(30)),
                  ),
                  focusedBorder: const OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(30))),
                  contentPadding: const EdgeInsets.symmetric(horizontal: 15),
                ),
              )),
          CircleAvatar(
            radius: 25,
            backgroundColor: AppThemeData.themeColor,
            child: Center(
              child: IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.send,
                  size: 25,
                  color: AppThemeData.background,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
