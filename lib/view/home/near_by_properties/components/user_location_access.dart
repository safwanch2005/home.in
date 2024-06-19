import 'package:flutter/material.dart';
import 'package:real_estate_application/view/theme/theme_data.dart';

class UserLocationAcces extends StatelessWidget {
  const UserLocationAcces({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Icon(
            Icons.refresh,
            size: 50,
            color: AppThemeData.themeColorShade,
          ),
          Text(
            'Retry..\nAllow Location permission',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: AppThemeData.themeColorShade,
            ),
          ),
        ],
      ),
    );
  }
}
