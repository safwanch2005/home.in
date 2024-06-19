import 'package:flutter/material.dart';
import 'package:real_estate_application/view/home/recent_properties/components/card_builder.dart';
import 'package:real_estate_application/view/theme/theme_data.dart';

class RecentContainer extends StatelessWidget {
  const RecentContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 318,
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: AppThemeData.background,
      ),
      child: CardBuilder(),
    );
  }
}
