import 'package:another_carousel_pro/another_carousel_pro.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:real_estate_application/view/theme/theme_data.dart';

// ignore: must_be_immutable
class PropertyImage extends StatelessWidget {
  PropertyImage({super.key, required this.imageUrls});
  dynamic imageUrls;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 330,
      // width: double.infinity,
      child: AnotherCarousel(
        dotColor: AppThemeData.themeColor,
        dotBgColor: Colors.black12.withOpacity(0),
        autoplay: false,
        boxFit: BoxFit.fill,
        dotVerticalPadding: 10,
        images: imageUrls.map((imageUrl) => NetworkImage(imageUrl)).toList(),
      ),
    );
  }
}
