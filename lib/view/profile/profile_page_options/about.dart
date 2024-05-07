import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:real_estate_application/view/profile/profile_page_options/custom_botton.dart';

class AboutPage extends StatelessWidget {
  const AboutPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ProfileCustomBotton(
      icon: FontAwesomeIcons.circleInfo,
      text: "About",
    );
  }
}
