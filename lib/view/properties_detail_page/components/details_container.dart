import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

// ignore: must_be_immutable
class DetailsContainerHouseApart extends StatelessWidget {
  DetailsContainerHouseApart({super.key, required this.propData});
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
          child: Row(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  detailsNameText(context, "TYPE"),
                  detailsNameText(context, "LISTED BY"),
                  detailsNameText(context, "BEDROOMS"),
                  detailsNameText(context, "BATHROOMS"),
                  detailsNameText(context, "FLOORS"),
                  detailsNameText(context, "CAR PARKING"),
                  detailsNameText(context, "AREA"),
                  detailsNameText(context, "FURNISHING"),
                  detailsNameText(context, "CONSTRUCTION\nSTATUS"),
                  detailsNameText(context, "FACING"),
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
                  detailsValueText(context, propData["bedrooms"]),
                  detailsValueText(context, propData["bathrooms"]),
                  detailsValueText(context, propData["floors"]),
                  detailsValueText(context, propData["carParking"]),
                  detailsValueText(context, propData["areaftsq"]),
                  detailsValueText(context, propData["furnishing"]),
                  detailsValueText(
                      context, "${propData["constructionStatus"]}\n"),
                  detailsValueText(context, propData["facingDirection"]),
                ],
              )
            ],
          ),
        ),
      ],
    );
  }

  Widget detailsNameText(BuildContext context, String text) {
    return Text(
      text,
      style: GoogleFonts.poppins(
          fontSize: 23, fontWeight: FontWeight.w700, color: Colors.white30),
    );
  }

  Widget detailsValueText(BuildContext context, String text) {
    return Text(
      text,
      style: GoogleFonts.poppins(
          fontSize: 23, fontWeight: FontWeight.w700, color: Colors.white70),
    );
  }
}
