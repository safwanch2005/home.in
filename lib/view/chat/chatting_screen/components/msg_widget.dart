import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:real_estate_application/view/theme/theme_data.dart';

class MessageWidget extends StatelessWidget {
  final ScrollController scrollController;

  const MessageWidget({super.key, required this.scrollController});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin:
          EdgeInsets.only(bottom: MediaQuery.of(context).size.height * 0.06),
      height: MediaQuery.of(context).size.height * 0.90,
      child: ListView.builder(
          controller: scrollController,
          physics: const BouncingScrollPhysics(),
          itemCount: 25,
          itemBuilder: (context, index) {
            return Column(
              crossAxisAlignment: index.isOdd
                  ? CrossAxisAlignment.end
                  : CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: index.isOdd
                      ? MainAxisAlignment.end
                      : MainAxisAlignment.start,
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(
                          vertical: 10, horizontal: 15),
                      margin: const EdgeInsets.symmetric(
                          vertical: 3, horizontal: 10),
                      decoration: BoxDecoration(
                          color: index.isOdd
                              ? AppThemeData.themeColor
                              : AppThemeData.background,
                          borderRadius: BorderRadius.circular(20),
                          border: Border.all(
                              color: AppThemeData.themeColor, width: 0.5)),
                      child: ConstrainedBox(
                        constraints: BoxConstraints(
                            maxWidth: MediaQuery.of(context).size.width * 0.7),
                        child: Text(
                          "hey there, How are you",
                          style: GoogleFonts.poppins(
                              fontSize: 18,
                              color: index.isOdd
                                  ? AppThemeData.background
                                  : AppThemeData.themeColor),
                        ),
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: MediaQuery.of(context).size.width * 0.07),
                  child: Text(
                    "11:30 AM",
                    style: GoogleFonts.poppins(
                        color: AppThemeData.themeColor,
                        fontWeight: FontWeight.w400),
                  ),
                )
              ],
            );
          }),
    );
  }
}
