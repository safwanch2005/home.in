import 'package:csc_picker/csc_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:real_estate_application/controller/propertycontroller.dart';
import 'package:real_estate_application/view/theme/theme_data.dart';

// ignore: must_be_immutable
class LocationField extends StatelessWidget {
  LocationField({super.key});
  PropertyController ctrl = Get.find();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(
          height: 15,
        ),
        const Divider(),
        const SizedBox(
          height: 15,
        ),
        GestureDetector(
          onTap: () {},
          child: Text(
            'Location',
            style: GoogleFonts.poppins(
                fontSize: 25, color: AppThemeData.themeColor),
          ),
        ),
        const SizedBox(height: 10),
        CSCPicker(
          dropdownDecoration: BoxDecoration(color: AppThemeData.background),
          disabledDropdownDecoration:
              BoxDecoration(color: AppThemeData.black12),
          //disableCountry: true,
          flagState: CountryFlag.DISABLE,
          layout: Layout.vertical,
          countryFilter: const [CscCountry.India],
          countryDropdownLabel: "Select country",
          stateDropdownLabel: "Select state",
          cityDropdownLabel: "Select city",
          selectedItemStyle: GoogleFonts.poppins(
              fontSize: 25,
              fontWeight: FontWeight.w500,
              color: AppThemeData.themeColor),
          onCountryChanged: (value) {
            ctrl.location['country'] = value.toString();
          },
          onStateChanged: (value) {
            ctrl.location['state'] = value.toString();
          },
          onCityChanged: (value) {
            ctrl.location['city'] = value.toString();
          },
        ),
        const SizedBox(
          height: 5,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Column(
              children: [
                Text(
                  "or",
                  style: GoogleFonts.poppins(
                      fontSize: 20, color: AppThemeData.themeColor),
                ),
                GestureDetector(
                  onTap: () async {
                    await ctrl.getUserLocation();
                  },
                  child: Text(
                    "use current location",
                    style: GoogleFonts.poppins(
                        fontSize: 20, color: Colors.blue.shade300),
                  ),
                ),
              ],
            ),
          ],
        ),
      ],
    );
  }
}
