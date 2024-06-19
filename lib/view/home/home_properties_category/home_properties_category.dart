import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:real_estate_application/view/home/home_properties_category/custom_box_button.dart';

class HomePropertiesCategories extends StatelessWidget {
  const HomePropertiesCategories({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CustomBoxButton(
              text: "Lands",
              icon: FontAwesomeIcons.earthAfrica,
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.05,
            ),
            CustomBoxButton(
              text: "Houses",
              icon: FontAwesomeIcons.house,
            ),
          ],
        ),
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.015,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CustomBoxButton(
              text: "Apartment",
              icon: FontAwesomeIcons.building,
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.05,
            ),
            CustomBoxButton(
              text: "Saved",
              icon: Icons.favorite,
            ),
          ],
        ),
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.015,
        ),
      ],
    );
  }
}
