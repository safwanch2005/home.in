import 'package:flutter/material.dart';
import 'package:real_estate_application/view/theme/theme_data.dart';

// ignore: must_be_immutable
class ImageAllProp extends StatelessWidget {
  ImageAllProp({super.key, required this.imgUrl});
  String imgUrl = "";
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(10),
      height: 318,
      width: double.infinity,
      decoration: BoxDecoration(
          //color: Colors.black38,

          borderRadius: BorderRadius.circular(15),
          border: Border.all(color: AppThemeData.themeColor, width: 1)),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(15),
        child: Placeholder(
          color: AppThemeData.themeColor.withOpacity(0.1),
          child: Image.network(
            imgUrl,
            fit: BoxFit.fill,
          ),
        ),
      ),
    );
  }
}
