import 'package:flutter/material.dart';
import 'package:real_estate_application/view/home/near_by_properties/components/near_by_prop_card_builder.dart';
import 'package:real_estate_application/view/theme/theme_data.dart';

class NearByContainer extends StatelessWidget {
  const NearByContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 318,
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: AppThemeData.background,
      ),
      child: const NearByCardBuilder(),
    );
  }
}
