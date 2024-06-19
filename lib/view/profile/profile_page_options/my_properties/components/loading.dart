import 'package:flutter/material.dart';
import 'package:real_estate_application/view/theme/theme_data.dart';

class LoadingPage extends StatelessWidget {
  const LoadingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppThemeData.background,
      body: Center(
        child: CircularProgressIndicator(
          color: AppThemeData.themeColor,
        ),
      ),
    );
  }
}
