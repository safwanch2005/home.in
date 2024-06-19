import 'package:flutter/material.dart';
import 'package:real_estate_application/view/home/recent_properties/components/recent_container.dart';
import 'package:real_estate_application/view/home/recent_properties/components/recent_text.dart';

class RecentProperties extends StatelessWidget {
  const RecentProperties({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        RecentText(),
        RecentContainer(),
        //CardBuilder()
      ],
    );
  }
}
