import 'package:flutter/material.dart';
import 'package:real_estate_application/view/home/near_by_properties/components/near_by_container.dart';
import 'package:real_estate_application/view/home/near_by_properties/components/near_by_text.dart';

class NearByProperties extends StatelessWidget {
  const NearByProperties({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        NearByText(),
        NearByContainer(),
      ],
    );
  }
}
