import 'package:flutter/material.dart';
import 'package:real_estate_application/view/theme/theme_data.dart';

class LocationPage extends StatelessWidget {
  const LocationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppThemeData.background,
      body: Center(
          child: Icon(
        Icons.location_on_outlined,
        size: 100,
        color: AppThemeData.themeColor,
      )),
    );
  }
}
