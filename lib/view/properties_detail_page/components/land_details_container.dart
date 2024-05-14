import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:real_estate_application/view/theme/theme_data.dart';

///////////////////NEW CHANGES ADDED HEREEEEEEEEEEEEEEEEEEE
// ignore: must_be_immutable
class LandDetailsContainer extends StatelessWidget {
  LandDetailsContainer({super.key, required this.propData});
  dynamic propData;
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
            "Details",
            style: GoogleFonts.poppins(
                fontSize: 30, color: AppThemeData.themeColor),
          ),
        ),
        Container(
          padding: const EdgeInsets.all(15),
          decoration: BoxDecoration(
            color: AppThemeData.background,
            boxShadow: [
              BoxShadow(
                color: AppThemeData.themeColor.withOpacity(0.5), // Shadow color
                spreadRadius: 5, // Spread radius
                blurRadius: 7, // Blur radius
                offset: const Offset(0, 3), // Offset
              ),
            ],
            borderRadius: const BorderRadius.all(
              Radius.circular(20),
            ),
          ),
          width: double.infinity,
          child: Row(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  detailsNameText(context, "TYPE"),
                  detailsNameText(context, "LISTED BY"),
                  detailsNameText(context, "PLOT AREA"),
                  detailsNameText(context, "FACING"),
                  detailsNameText(context, "LENGTH"),
                  detailsNameText(context, "BREADTH"),
                ],
              ),
              const SizedBox(
                width: 15,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  detailsValueText(context, propData["type"]),
                  detailsValueText(context, propData["listedBy"]),
                  detailsValueText(context, propData["plotArea"]),
                  detailsValueText(context, propData["facingDirection"]),
                  detailsValueText(context, propData["length"]),
                  detailsValueText(context, propData["breadth"]),
                ],
              )
            ],
          ),
        )
      ],
    );
  }

  Widget detailsNameText(BuildContext context, String text) {
    return Text(
      text,
      style: GoogleFonts.poppins(
          fontSize: 23,
          fontWeight: FontWeight.w700,
          color: AppThemeData.themeColorShade),
    );
  }

  Widget detailsValueText(BuildContext context, String text) {
    return Text(
      text,
      style: GoogleFonts.poppins(
          fontSize: 23,
          fontWeight: FontWeight.w700,
          color: AppThemeData.themeColor),
    );
  }
}
